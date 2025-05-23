<%@ page import="java.util.List" %>
<%@ page import="app.model.Trajet" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    String message = (String) request.getAttribute("message");
    List<Trajet> trajets = (List<Trajet>) request.getAttribute("trajets");
%>

<h2><%= message != null ? message : "Liste des trajets" %></h2>

<%
    if (trajets != null && !trajets.isEmpty()) {
        trajets.sort((t1, t2) -> t1.getStartDate().compareTo(t2.getStartDate()));
%>
    <ul>
    <% for (Trajet t : trajets) { %>
        <li>
            <strong><%= t.getStartTown() %></strong> vers <strong><%= t.getEndTown() %></strong><br>
            Lieu de depart : <%= t.getStartAddress() %><br>
            Lieu d'arrivee : <%= t.getEndAddress() %><br>
            Date : <%= t.getStartDate() %><br>
            Prix : <%= t.getPrice() %> EURO<br>
            Conducteur : <%= t.getUsername() %> (<%= t.getStatut() %>)
            <img src="<%= t.getAvatar_url() %>" alt="Avatar" width="50" height="50"><br><br>
            Vehicule : <%= t.getTypeVehicule() != null ? t.getTypeVehicule() : "Non specifie" %><br>
            Description : <%= t.getDescription() != null ? t.getDescription() : "Aucune" %>
        </li>
        <hr>
    <% } %>
    </ul>

<%
    } else {
%>
    <p>Aucun trajet disponible.</p>
<%
    }
%>
