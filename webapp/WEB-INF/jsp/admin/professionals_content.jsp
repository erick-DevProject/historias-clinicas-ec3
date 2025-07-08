<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="flex items-center justify-between mb-6">
  <h2 class="text-2xl font-bold">Profesionales</h2>
  <a href="${pageContext.request.contextPath}/admin/professionals/new"
     class="inline-flex items-center rounded-lg bg-brand px-4 py-2 text-white hover:bg-blue-700">
     + Nuevo
  </a>
</div>

<table class="min-w-full divide-y divide-gray-200 bg-white rounded-xl shadow overflow-hidden text-sm">
  <thead class="bg-gray-50">
    <tr>
      <th class="px-6 py-3 text-left font-medium text-gray-500 uppercase">ID</th>
      <th class="px-6 py-3 text-left font-medium text-gray-500 uppercase">Usuario</th>
      <th class="px-6 py-3 text-left font-medium text-gray-500 uppercase">Nombre</th>
      <th class="px-6 py-3 text-left font-medium text-gray-500 uppercase">Tipo</th>
      <th class="px-6 py-3"></th>
    </tr>
  </thead>
  <tbody class="divide-y divide-gray-200">
    <c:forEach var="p" items="${pros}">
      <tr class="hover:bg-gray-50">
        <td class="px-6 py-4">${p.userId}</td>
        <td class="px-6 py-4">${p.user.username}</td>
        <td class="px-6 py-4">${p.user.firstName} ${p.user.lastName}</td>
        <td class="px-6 py-4">${p.profType}</td>
        <td class="px-6 py-4 text-right">
          <form action="${pageContext.request.contextPath}/admin/professionals/${p.userId}/delete" method="post" class="inline">
            <button class="text-red-600 hover:text-red-800" onclick="return confirm('¿Eliminar?')">Eliminar</button>
          </form>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>