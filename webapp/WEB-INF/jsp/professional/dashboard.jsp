<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Dashboard Profesional · Historias Clínicas</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = { theme: { extend: { colors: { brand: '#2563eb' } } } };
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
             class="block px-4 py-2 rounded hover:bg-gray-100">
            💊 Medicaciones
          </a>
        </li>
      </ul>
    </nav>

    <!-- EDITAR PERFIL -->
    <a href="${pageContext.request.contextPath}/profile/edit"
       class="mt-6 inline-flex items-center justify-center rounded-lg bg-gray-200 px-4 py-2 text-gray-800 hover:bg-gray-300">
      ✏️ Editar perfil
    </a>

    <!-- LOGOUT -->
    <a href="${pageContext.request.contextPath}/logout"
       class="mt-6 inline-flex items-center justify-center rounded-lg bg-red-500 hover:bg-red-600 text-white py-2 px-4">
      ➜ Cerrar sesión
    </a>
  </aside>

  <!-- Contenido principal -->
  <main class="flex-1 p-8">
    <h2 class="text-3xl font-bold mb-6">¡Bienvenido, ${user.firstName} ${user.lastName}!</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div class="bg-white p-6 rounded shadow">
        <p class="text-gray-600">Pacientes registrados</p>
        <p class="text-2xl font-semibold">${patientsCount}</p>
      </div>
      <div class="bg-white p-6 rounded shadow">
        <p class="text-gray-600">Episodios activos</p>
        <p class="text-2xl font-semibold">${activeEpisodes}</p>
      </div>
    </div>
  </main>
</body>
</html>
