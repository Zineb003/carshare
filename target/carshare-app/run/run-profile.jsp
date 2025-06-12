<%@ page import="java.util.List, java.util.ArrayList" %>

<%
    request.setAttribute("title", "Carshare - Profil");
    request.setAttribute("content", "/views/profile.jsp");

    List<String> scripts = new ArrayList<>();
    scripts.add(request.getContextPath() + "/js/menu.js");
    scripts.add(request.getContextPath() + "/js/avatar.js");

    request.setAttribute("customScripts", scripts);
%>

<jsp:include page="/layout.jsp" />