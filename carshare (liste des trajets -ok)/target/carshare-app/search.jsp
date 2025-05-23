<%@ page import="java.util.List" %>
<%@ page import="app.model.Trajet" %>

<%
    String message = (String) request.getAttribute("message");
    List<Trajet> trajets = (List<Trajet>) request.getAttribute("trajets");
%>

<h2><%= message != null ? message : "Liste des trajets" %></h2>

<%
    if (trajets != null && !trajets.isEmpty()) {
%>
    <ul>
    <% for (Trajet t : trajets) { %>
        <li>
            <strong><%= t.getStartTown() %></strong> → <strong><%= t.getEndTown() %></strong><br>
            Date : <%= t.getStartDate() %><br>
            Prix : <%= t.getPrice() %> €<br>
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
