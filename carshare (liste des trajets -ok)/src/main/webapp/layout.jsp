<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="fr">

<%@ include file="head.jsp" %>

<body class="bg-gray-50 text-gray-900">
    <%@ include file="menu.jsp" %>

    <div class="mx-auto">
        <jsp:include page="${content}" />
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>