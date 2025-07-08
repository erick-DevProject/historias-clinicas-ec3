<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
  // Le decimos al layout qué fragmento inyectar como contenido
  request.setAttribute("contentPage", "/admin/dashboard_content.jsp");
%>
<jsp:include page="/WEB-INF/jsp/layouts/admin_layout.jsp"/>
