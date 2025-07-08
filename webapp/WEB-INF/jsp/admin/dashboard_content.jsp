<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div>
  <h2 class="text-3xl font-bold mb-8">¡Bienvenido, ${user.firstName}!</h2>
  <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
    <div class="bg-white rounded-xl shadow p-6">
      <p class="text-gray-500 text-sm">Profesionales</p>
      <p class="text-3xl font-bold">${prosCount}</p>
    </div>
    <div class="bg-white rounded-xl shadow p-6">
      <p class="text-gray-500 text-sm">Pacientes</p>
      <p class="text-3xl font-bold">${patientsCount}</p>
    </div>
    <div class="bg-white rounded-xl shadow p-6">
      <p class="text-gray-500 text-sm">Episodios abiertos</p>
      <p class="text-3xl font-bold">${openEpisodes}</p>
    </div>
  </div>
</div>
