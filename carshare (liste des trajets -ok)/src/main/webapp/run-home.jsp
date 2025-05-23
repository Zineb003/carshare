<%@ page import="java.util.List, java.util.ArrayList" %>

<%
    request.setAttribute("title", "Carshare - Accueil");
    request.setAttribute("content", "home.jsp");

    List<String> scripts = new ArrayList<>();
    scripts.add(request.getContextPath() + "/js/menu.js");
    scripts.add(request.getContextPath() + "/js/villes.js");

    request.setAttribute("customScripts", scripts);
%>

<jsp:include page="layout.jsp" />