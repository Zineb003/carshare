<%@ page pageEncoding="UTF-8" isELIgnored="false" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">Jakarta App</a>
        <div class="d-flex">    
            <% String user = (String) session.getAttribute("user");
              if (user == null) {
            %>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Connexion</a>
            <%
                } else {
            %>  
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Se déconnecter</a>
            <%      
                }
            %>
        </div>
    </div>
</nav>