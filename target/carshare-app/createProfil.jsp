<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="fr">

<%@ include file="head.jsp" %>

<body class="bg-gray-50 text-gray-900">
    <%@ include file="menu.jsp" %>

<%@ page import="app.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }
%>

<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    request.setAttribute("title", "Carshare - Créer un profil");
    request.setAttribute("content", "createProfil.jsp");

    List<String> scripts = new ArrayList<>();
    scripts.add(request.getContextPath() + "/js/menu.js");
    scripts.add(request.getContextPath() + "/js/villes.js");

    request.setAttribute("customScripts", scripts);
%>



<h2>Créer un profil</h2>

<form action="createProfil" method="post">
    <label for="statut">Statut :</label>
    <select name="statut" id="statut" required onchange="toggleConducteurFields()">
        <option value="conducteur">Conducteur</option>
        <option value="passager">Passager</option>
    </select><br>

    <div id="conducteurFields">
        <label for="typeVehicule">Type de véhicule :</label>
        <input type="text" name="typeVehicule" id="typeVehicule"><br>

        <label for="nbPassagersMax">Nombre de passagers max :</label>
        <input type="number" name="nbPassagersMax" id="nbPassagersMax"><br>
    </div>

    <input type="submit" value="Créer le profil">
</form>

<script>
    function toggleConducteurFields() {
        const statut = document.getElementById("statut").value;
        const conducteurFields = document.getElementById("conducteurFields");

        if (statut === "conducteur") {
            conducteurFields.style.display = "block";
        } else {
            conducteurFields.style.display = "none";
            // Optionnel : vider les champs si on repasse à "passager"
            document.getElementById("typeVehicule").value = "";
            document.getElementById("nbPassagersMax").value = "";
        }
    }

    // Appel initial pour cacher les champs si "passager" est sélectionné par défaut
    window.onload = toggleConducteurFields;
</script>
    <%@ include file="footer.jsp" %>
</body>
</html>
