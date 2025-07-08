<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es" class="h-full">
<head>
  <meta charset="UTF-8"/>
  <title>Panel · Historias Clínicas</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = { theme: { extend: { colors: { brand:'#2563eb' } } } };
  </script>
</head>
<body class="h-full bg-gray-100 flex">
  <!-- Sidebar Admin -->
  <aside class="w-64 shrink-0 bg-white border-r border-gray-200 p-6 flex flex-col">
    <h1 class="text-2xl font-bold text-brand mb-8">Historias<br/>Clínicas</h1>

    <nav class="flex-1">
      <ul class="space-y-1">
        <li>
          <a href="${pageContext.request.contextPath}/admin/dashboard"
             class="block rounded-lg px-3 py-2 hover:bg-gray-100
                    ${contentPage eq '/admin/dashboard_content.jsp' ? 'bg-gray-100 font-semibold' : ''}">
            🏠 Dashboard
          </a>
        </li>
        <li>
          <c:choose>
            <c:when test="${role == 'ADMIN' or role == 'ADMIN_PRIMARY'}">
              <a href="${pageContext.request.contextPath}/admin/professionals"
                 class="block rounded-lg px-3 py-2 hover:bg-gray-100
                        ${contentPage eq '/admin/professionals_content.jsp' ? 'bg-gray-100 font-semibold' : ''}">
                👩‍⚕️ Profesionales
              </a>
            </c:when>
            <c:otherwise>
              <span class="block rounded-lg px-3 py-2 text-gray-400 cursor-not-allowed">
                👩‍⚕️ Profesionales
              </span>
            </c:otherwise>
          </c:choose>
        </li>
        <li>
          <c:choose>
            <c:when test="${role == 'ADMIN_PRIMARY'}">
              <a href="${pageContext.request.contextPath}/admin/admins"
                 class="block rounded-lg px-3 py-2 hover:bg-gray-100
                        ${contentPage eq '/admin/admins_content.jsp' ? 'bg-gray-100 font-semibold' : ''}">
                👑 Administradores
              </a>
            </c:when>
            <c:otherwise>
              <span class="block rounded-lg px-3 py-2 text-gray-400 cursor-not-allowed">
                👑 Administradores
              </span>
            </c:otherwise>
          </c:choose>
        </li>
      </ul>
    </nav>

    <!-- EDITAR PERFIL -->
    <a href="${pageContext.request.contextPath}/profile/edit"
       class="mt-4 inline-flex items-center justify-center rounded-lg bg-gray-200 px-4 py-2 text-gray-800 hover:bg-gray-300">
      ✏️ Editar perfil
    </a>

    <!-- LOGOUT -->
    <a href="${pageContext.request.contextPath}/logout"
       class="mt-4 inline-flex items-center justify-center rounded-lg bg-red-500 hover:bg-red-600 text-white py-2 px-4">
      ➜ Cerrar sesión
    </a>
  </aside>

  <!-- Contenido principal -->
  <main class="flex-1 overflow-y-auto p-8">
    <jsp:include page="/WEB-INF/jsp${contentPage}" />
  </main>
</body>
</html>
