#!/usr/bin/env python3
"""
Concatena en un único fichero (UTF-8) el contenido de todos los archivos dentro
de src/main/, filtrando por extensión si se indica.

▪ Omite cualquier archivo que NO sea UTF-8 válido.
▪ Cada bloque se marca con:
      -- Archivo: <ruta/relativa/a/src/main> 
"""

from pathlib import Path
import argparse
from typing import Iterable

ROOT_DIR = Path("src/main")        # <-- directorio fijo de búsqueda

# --------------------------------------------------------------------------- #
def iter_files(root: Path, exts: set[str] | None) -> Iterable[Path]:
    """Recorre recursivamente y devuelve los archivos que cumplen las extensiones."""
    for path in root.rglob("*"):
        if path.is_file() and (exts is None or path.suffix.lower() in exts):
            yield path

def is_utf8(path: Path, sample: int = 4096) -> bool:
    """Comprueba si el archivo parece UTF-8 (lee hasta `sample` bytes)."""
    try:
        with path.open("rb") as f:
            f.read(sample).decode("utf-8")
        return True
    except UnicodeDecodeError:
        return False

def agregar_archivos_a_texto(destino: Path, extensiones: list[str] | None):
    exts = (
        {e.lower() if e.startswith(".") else f".{e.lower()}" for e in extensiones}
        if extensiones else None
    )

    with destino.open("w", encoding="utf-8") as outf:
        for file in iter_files(ROOT_DIR, exts):
            if not is_utf8(file):
                print(f"🛈 Descartado (no UTF-8): {file}")
                continue

            rela = file.relative_to(ROOT_DIR)
            outf.write(f"\n\n-- Archivo: {rela} \n")
            outf.write(file.read_text(encoding="utf-8"))

# --------------------------------------------------------------------------- #
def main():
    parser = argparse.ArgumentParser(
        description="Concatena en un .txt el contenido UTF-8 de src/main/."
    )
    parser.add_argument(
        "-o", "--output", default="todo_el_codigo.txt",
        help="Fichero de salida (por defecto: todo_el_codigo.txt)."
    )
    parser.add_argument(
        "-e", "--extensiones", metavar="EXT", nargs="+",
        help="Filtra por extensión: ej. -e .py .java"
    )
    args = parser.parse_args()

    destino = Path(args.output).resolve()
    agregar_archivos_a_texto(destino, args.extensiones)
    print(f"✅ Contenido guardado en '{destino}'")

if __name__ == "__main__":
    main()
