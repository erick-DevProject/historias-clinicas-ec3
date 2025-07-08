<!-- src/main/webapp/WEB-INF/jsp/medications/list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Medicaciones · Historias Clínicas</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: { extend: { colors: { brand: '#2563eb' } } }
    }
  </script>
</head>
<body class="bg-gray-100 min-h-screen flex">
  <!-- Sidebar -->
  <aside class="w-64 bg-white border-r p-6 flex flex-col">
    <h1 class="text-2xl font-bold text-brand mb-8">Panel Profesional</h1>
    <nav class="flex-1">
      <ul class="space-y-2">
        <li>
          <a href="${pageContext.request.contextPath}/professional/dashboard"
             class="block px-4 py-2 rounded hover:bg-gray-100">🏠 Dashboard</a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/professional/patients"
             class="block px-4 py-2 rounded hover:bg-gray-100">👥 Pacientes</a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/professional/medications"
             class="block px-4 py-2 rounded bg-gray-100 font-semibold">💊 Medicaciones</a>
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
    <div class="flex items-center justify-between mb-6">
      <h2 class="text-2xl font-bold">Medicaciones Disponibles</h2>
      <a href="${pageContext.request.contextPath}/professional/medications/new"
         class="inline-flex items-center rounded-lg bg-brand px-4 py-2 text-white hover:bg-blue-700">
        + Nuevo
      </a>
    </div>
    <table class="min-w-full divide-y divide-gray-200 bg-white rounded-xl shadow overflow-hidden text-sm">
      <thead class="bg-gray-50">
        <tr>
          <th class="px-6 py-3 text-left font-medium text-gray-500 uppercase">ID</th>
          <th class="px-6 py-3 text-left font-medium text-gray-500 uppercase">Nombre</th>
          <th class="px-6 py-3 text-left font-medium text-gray-500 uppercase">Forma</th>
          <th class="px-6 py-3 text-left font-medium text-gray-500 uppercase">Concentración</th>
          <th class="px-6 py-3 text-left font-medium text-gray-500 uppercase">Acciones</th>
        </tr>
      </thead>
      <tbody class="divide-y divide-gray-200">
        <c:forEach var="m" items="${medications}">
          <tr class="hover:bg-gray-50">
            <td class="px-6 py-4">${m.medicationId}</td>
            <td class="px-6 py-4">${m.name}</td>
            <td class="px-6 py-4">${m.form}</td>
            <td class="px-6 py-4">${m.concentration}</td>
            <td class="px-6 py-4 text-right space-x-2">
              <a href="${pageContext.request.contextPath}/professional/medications/${m.medicationId}/edit"
                 class="text-blue-600 hover:text-blue-800">Editar</a>
              <form action="${pageContext.request.contextPath}/professional/medications/${m.medicationId}/delete"
                    method="post" class="inline">
                <button onclick="return confirm('¿Eliminar esta medicación?')"
                        class="text-red-600 hover:text-red-800">Eliminar</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </main>
</body>
</html>
