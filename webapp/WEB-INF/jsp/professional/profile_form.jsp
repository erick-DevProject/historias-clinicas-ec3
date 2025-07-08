<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
  request.setAttribute("pageTitle", "Editar Perfil · Historias Clínicas");
  request.setAttribute("appTitle", "Historias Clínicas");
  request.setAttribute("homePath", "professional/dashboard");
  request.setAttribute("profileEditPath", "profile/edit");
  request.setAttribute("contentPage", "/professional/profile_form_content.jsp");
%>
<jsp:include page="/WEB-INF/jsp/layouts/user_layout.jsp"/>
