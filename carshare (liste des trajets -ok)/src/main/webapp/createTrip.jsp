
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<h2>Creer un nouveau trajet</h2>

<form action="createTrip" method="post">

    <label for="profilId">ProfilID (le temps qu'on gere ca) :</label>
    <input type="text" id="profilId" name="profilId" required><br>

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

    <label for="price">Prix :</label>
    <input type="number" id="price" name="price" step="0.01" required><br>

    <label for="description">Description :</label>
    <textarea id="description" name="description"></textarea><br>

    <input type="submit" value="Creer le trajet">
</form>
