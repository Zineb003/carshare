<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="fr">

<%@ include file="head.jsp" %>

<body class="bg-gray-50 text-gray-900">
    <%@ include file="menu.jsp" %>

<%@ page import="java.util.*, java.math.BigDecimal" %>
<%@ page import="java.util.List" %>
<%@ page import="app.model.Trajet" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<html>
<head>
    <title>Mes Trajets</title>
</head>
<body>
    <h1>Mes trajets</h1>



    <c:if test="${empty trajets}">
        <p>Vous n'avez pas encore créé de trajets.</p>
    </c:if>

    <c:forEach var="trajet" items="${trajets}">
        <div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">
            <p><strong>Départ :</strong> ${trajet.startTown} : ${trajet.startAddress} </p>
            <p><strong>Arrivée :</strong> ${trajet.endTown} : ${trajet.endAddress}</p>
            <p><strong>Date :</strong> ${trajet.startDate}</p>
            <p><strong>Prix :</strong> 
                <c:choose>
                    <c:when test="${trajet.price != null}">
                        ${trajet.price} €
                    </c:when>
                    <c:otherwise>
                        Gratuit / Non spécifié
                    </c:otherwise>
                </c:choose>
            </p>
            <p><strong>Description :</strong> ${trajet.description}</p>
  

        </div>
    </c:forEach>

    <%@ include file="footer.jsp" %>
</body>
</html>