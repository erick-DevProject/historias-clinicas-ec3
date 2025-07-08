<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es" class="h-full">
<head>
  <meta charset="UTF-8"/>
  <title>${pageTitle}</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = { theme: { extend: { colors: { brand:'#2563eb' } } } };
  </script>
</head>
<body class="h-full bg-gray-100 flex">
  <!-- Sidebar -->
  <aside class="w-64 bg-white border-r border-gray-200 p-6 flex flex-col">
    <h1 class="text-2xl font-bold text-brand mb-8">${appTitle}</h1>
    <nav class="flex-1">
      <ul class="space-y-1">
        <li>
          <a href="${pageContext.request.contextPath}/${homePath}"
             class="block rounded-lg px-3 py-2 hover:bg-gray-100
                    ${contentPage eq '/dashboard_content.jsp' ? 'bg-gray-100 font-semibold' : ''}">
            🏠 Dashboard
          </a>
        </li>
      </ul>
    </nav>
    <div class="mt-4">
      <a href="${pageContext.request.contextPath}/${profileEditPath}"
         class="block mb-4 rounded-lg bg-gray-200 px-4 py-2 text-gray-800 hover:bg-gray-300">
        ✏️ Editar perfil
      </a>
      <a href="${pageContext.request.contextPath}/logout"
         class="inline-flex items-center justify-center rounded-lg bg-red-500 hover:bg-red-600 text-white py-2 px-4">
        ➜ Cerrar sesión
      </a>
    </div>
  </aside>

  <!-- Contenido principal -->
  <main class="flex-1 overflow-y-auto p-8">
    <jsp:include page="/WEB-INF/jsp${contentPage}" />
  </main>
</body>
</html>
