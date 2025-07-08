<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Historias Clínicas</title>
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    /** Paleta de marca */
    tailwind.config = { theme: { extend: { colors: { brand: '#2563eb' } } } };
  </script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center">
  <div class="bg-white p-8 rounded-2xl shadow-lg text-center max-w-md">
    <h1 class="text-4xl font-extrabold mb-4">Historias Clínicas</h1>
    <p class="text-lg text-gray-700 mb-6">${mensaje}</p>
    <a href="${pageContext.request.contextPath}/login"
       class="inline-block bg-brand hover:bg-blue-700 text-white font-semibold py-2 px-8 rounded-lg transition">
      Iniciar Sesión
    </a>
  </div>
</body>
</html>
