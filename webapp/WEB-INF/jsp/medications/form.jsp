<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>
    <c:choose>
      <c:when test="${not empty medication.medicationId}">Editar medicamento</c:when>
      <c:otherwise>Nuevo medicamento</c:otherwise>
    </c:choose>
    · Historias Clínicas
  </title>
  <!-- Tailwind CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: { extend: { colors: { brand: '#2563eb' } } }
    }
  </script>
</head>
<body class="bg-gray-100 min-h-screen flex">
  <!-- Sidebar Profesional -->
  <aside class="w-64 bg-white border-r p-6 flex flex-col">
    <h1 class="text-2xl font-bold text-brand mb-8">Panel Profesional</h1>
    <nav class="flex-1">
      <ul class="space-y-2">
        <li>
          <a href="${pageContext.request.contextPath}/professional/dashboard"
             class="block px-4 py-2 rounded hover:bg-gray-100">
            🏠 Dashboard
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/professional/patients"
             class="block px-4 py-2 rounded hover:bg-gray-100">
            👥 Pacientes
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/professional/medications"
             class="block px-4 py-2 rounded bg-gray-100 font-semibold">
            💊 Medicaciones
          </a>
        </li>
      </ul>
    </nav>
    <a href="${pageContext.request.contextPath}/logout"
       class="mt-6 inline-flex items-center justify-center rounded-lg bg-red-500 hover:bg-red-600 text-white py-2 px-4">
      ➜ Cerrar sesión
    </a>
  </aside>

  <!-- Contenido principal -->
  <main class="flex-1 p-8">
    <div class="max-w-lg mx-auto bg-white p-6 rounded-xl shadow">
      <h2 class="text-2xl font-bold mb-4">
        <c:choose>
          <c:when test="${not empty medication.medicationId}">Editar medicamento</c:when>
          <c:otherwise>Nuevo medicamento</c:otherwise>
        </c:choose>
      </h2>

      <form
        action="<c:choose>
                  <c:when test='${not empty medication.medicationId}'>
                    ${pageContext.request.contextPath}/professional/medications/${medication.medicationId}/edit
                  </c:when>
                  <c:otherwise>
                    ${pageContext.request.contextPath}/professional/medications
                  </c:otherwise>
                </c:choose>"
        method="post"
        class="space-y-4"
      >
        <div>
          <label class="block text-sm font-medium text-gray-700">Nombre</label>
          <input
            name="name"
            value="${medication.name}"
            required
            class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"
          />
        </div>
        <div>
          <label class="block text-sm font-medium text-gray-700">Forma</label>
          <input
            name="form"
            value="${medication.form}"
            class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"
          />
        </div>
        <div>
          <label class="block text-sm font-medium text-gray-700">Concentración</label>
          <input
            name="concentration"
            value="${medication.concentration}"
            class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"
          />
        </div>
        <div class="text-right">
          <button
            type="submit"
            class="inline-flex items-center rounded-lg bg-brand px-6 py-2 text-white hover:bg-blue-700"
          >
            Guardar
          </button>
        </div>
      </form>
    </div>
  </main>
</body>
</html>
