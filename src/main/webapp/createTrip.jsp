<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="fr">

<%@ include file="head.jsp" %>

<body class="bg-gray-50 text-gray-900">
    <%@ include file="menu.jsp" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%String profilId = request.getParameter("profilId");%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    request.setAttribute("title", "Carshare - Créer un trajet");
    request.setAttribute("content", "createTrip.jsp");
    List<String> scripts = new ArrayList<>();
    scripts.add(request.getContextPath() + "/js/menu.js");
    scripts.add(request.getContextPath() + "/js/villes.js");
    request.setAttribute("customScripts", scripts);
%>
<% String statut = (String) request.getAttribute("statut"); %>





<h2>Creer un nouveau trajet</h2>

<form action="createTrip" method="post">

<form action="createTrip" method="post">

    <label for="profilId">Profil ID :</label>
    <input type="text" id="profilId" name="profilId" value="<%= profilId != null ? profilId : "" %>" readonly><br>

    <label for="startTown">Ville de depart :</label>
    <input type="text" id="startTown" name="startTown" required><br>

    <label for="endTown">Ville d'arrivee :</label>
    <input type="text" id="endTown" name="endTown" required><br>

    <label for="startAddress">Adresse de depart :</label>
    <input type="text" id="startAddress" name="startAddress" required><br>

    <label for="endAddress">Adresse d'arrivee :</label>
    <input type="text" id="endAddress" name="endAddress" required><br>

    <label for="startDate">Date et heure de depart :</label>
    <input type="datetime-local" id="startDate" name="startDate" required><br>

    <% if ("Conducteur".equalsIgnoreCase(statut)) { %>
        <label for="price">Prix :</label>
        <input type="number" id="price" name="price" step="0.01" required><br>
    <% } %>

    <label for="description">Description :</label>
    <textarea id="description" name="description"></textarea><br>

    <input type="submit" value="Creer le trajet">
</form>
    <%@ include file="footer.jsp" %>
</body>
</html>