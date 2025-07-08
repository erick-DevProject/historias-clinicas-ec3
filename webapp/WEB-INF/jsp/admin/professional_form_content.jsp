<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<h2 class="text-2xl font-bold mb-6">Nuevo profesional</h2>
<c:if test="${not empty error}">
  <p class="mb-4 text-red-600">${error}</p>
</c:if>
<form action="${pageContext.request.contextPath}/admin/professionals" method="post" class="space-y-4 max-w-lg">
  <div>
    <label class="block text-sm font-medium text-gray-700">Usuario</label>
    <input name="username" required class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
  </div>
  <div>
    <label class="block text-sm font-medium text-gray-700">Contraseña</label>
    <input type="password" name="password" required class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
  </div>
  <div class="grid grid-cols-2 gap-4">
    <div>
      <label class="block text-sm font-medium text-gray-700">Nombre</label>
      <input name="firstName" required class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Apellido</label>
      <input name="lastName" required class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
    </div>
  </div>
  <div>
    <label class="block text-sm font-medium text-gray-700">Sexo</label>
    <select name="sex" class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand">
      <c:forEach var="s" items="${sexValues}">
        <option value="${s}">${s}</option>
      </c:forEach>
    </select>
  </div>
  <div class="grid grid-cols-2 gap-4">
    <div>
      <label class="block text-sm font-medium text-gray-700">Tipo profesional</label>
      <select name="profType" class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand">
        <c:forEach var="t" items="${profTypes}"><option value="${t}">${t}</option></c:forEach>
      </select>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Nº Licencia</label>
      <input name="licenseNumber" required class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
    </div>
  </div>
  <div>
    <label class="block text-sm font-medium text-gray-700">Especialidad (opcional)</label>
    <input name="specialty" class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
  </div>
  <button class="inline-flex items-center rounded-lg bg-brand px-6 py-2 text-white hover:bg-blue-700">Guardar</button>
</form>