<%@ page import="java.util.List, java.util.ArrayList" %>

<%
    request.setAttribute("title", "Carshare - Inscription");
    request.setAttribute("content", "register.jsp");

    List<String> scripts = new ArrayList<>();
    scripts.add(request.getContextPath() + "/js/menu.js");
    
    request.setAttribute("customScripts", scripts);
%>

<jsp:include page="layout.jsp" />