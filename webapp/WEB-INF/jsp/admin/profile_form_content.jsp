<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<h2 class="text-2xl font-bold mb-6">Editar perfil</h2>
<form action="${pageContext.request.contextPath}/profile/edit"
      method="post" class="space-y-4 max-w-lg">
  <div>
    <label class="block text-sm font-medium text-gray-700">Nombre</label>
    <input name="firstName" value="${user.firstName}" required
           class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
  </div>
  <div>
    <label class="block text-sm font-medium text-gray-700">Apellido</label>
    <input name="lastName" value="${user.lastName}" required
           class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
  </div>
  <div>
    <label class="block text-sm font-medium text-gray-700">Teléfono</label>
    <input name="phone" value="${user.phone}"
           class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
  </div>
  <div>
    <label class="block text-sm font-medium text-gray-700">Email</label>
    <input name="email" type="email" value="${user.email}"
           class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
  </div>
  <div>
    <label class="block text-sm font-medium text-gray-700">Contraseña nueva</label>
    <input name="password" type="password" placeholder="Dejar en blanco para no cambiar"
           class="mt-1 p-2 w-full rounded-lg border-gray-300 shadow-sm focus:ring-brand focus:border-brand"/>
  </div>
  <button type="submit"
          class="inline-flex items-center rounded-lg bg-brand px-6 py-2 text-white hover:bg-blue-700">
    Guardar
  </button>
</form>
