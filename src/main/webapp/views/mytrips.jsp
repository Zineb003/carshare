<%@ page contentType="text/html;charset=UTF-8" import="java.util.List, app.model.Trip" language="java" isELIgnored="false" %>

<section class="min-h-screen flex flex-col justify-center items-center bg-gradient-to-br from-blue-100 to-white">
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold text-center mb-30">Mes trajets</h1>

        <%
            List<Trip> trips = (List<Trip>) request.getAttribute("trips");
            if (trips != null && !trips.isEmpty()) {
        %>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <%
                for (Trip trip : trips) {
            %>
                <div class="bg-white rounded-2xl shadow p-5 hover:shadow-lg transition">
                    <div class="flex justify-between items-center mb-2">
                        <span class="text-lg font-semibold text-blue-600"><%= trip.getStartTown() %></span>
                        <svg class="h-5 w-5 text-gray-400 mx-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                        </svg>
                        <span class="text-lg font-semibold text-green-600"><%= trip.getEndTown() %></span>
                    </div>
                    <div class="text-sm text-gray-600 mb-2">
                        Départ : <strong><%= trip.getFormattedStartDate() %></strong><br>
                        Places disponibles : <%= trip.getNbPlaces() %><br>
                        Prix : <span class="text-blue-500 font-bold"><%= trip.getPrice() %> €</span>
                    </div>
                    <a href="<%= request.getContextPath() %>/tripdetails" 
                        class="inline-block px-6 py-2 bg-blue-600 text-white font-semibold rounded hover:bg-blue-700">
                        Détails
                    </a>
                </div>
            <%
                }
            %>
            </div>
        <%
            } else {
        %>
            <p class="text-center text-gray-600">Vous n'avez pas encore publié de trajet.</p>
        <%
            }
        %>

        <div class="text-center mt-8">
            <a href="<%= request.getContextPath() %>/create-trip"
            class="inline-block px-6 py-2 bg-blue-600 text-white font-semibold rounded hover:bg-blue-700">
                Ajouter un trajet
            </a>
        </div>
    </div>
</section>