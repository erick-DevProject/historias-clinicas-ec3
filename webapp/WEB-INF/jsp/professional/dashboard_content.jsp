<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div>
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
</div>
