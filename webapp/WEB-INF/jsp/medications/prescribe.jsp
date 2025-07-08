<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
  <head>
    <title>Prescribir Medicamento</title>
  </head>
  <body>
    <h2>Prescribir Medicamento</h2>
    <form action="${pageContext.request.contextPath}/professional/medications/prescribe"
          method="post">
      <p>
        <label>Episodio:
          <select name="episodeId" required>
            <c:forEach var="e" items="${episodes}">
              <option value="${e.episodeId}">
                #${e.episodeId} – ${e.patient.user.firstName}
                ${e.patient.user.lastName}
              </option>
            </c:forEach>
          </select>
        </label>
      </p>
      <p>
        <label>Medicamento:
          <select name="medicationId" required>
            <c:forEach var="m" items="${medications}">
              <option value="${m.medicationId}">${m.name}</option>
            </c:forEach>
          </select>
        </label>
      </p>
      <p>
        <label>Dosis:
          <input type="text" class="p-2" name="dose" required/>
        </label>
      </p>
      <p>
        <label>Vía:
          <select name="route" required>
            <c:forEach var="r" items="${routes}">
              <option value="${r}">${r}</option>
            </c:forEach>
          </select>
        </label>
      </p>
      <p>
        <label>Frecuencia:
          <input type="text" name="frequency"/>
        </label>
      </p>
      <p>
        <button type="submit">Prescribir</button>
      </p>
    </form>
  </body>
</html>
