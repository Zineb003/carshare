<%@ page contentType="text/html;charset=UTF-8" import="java.util.List" language="java" isELIgnored="false" %>

<section class="min-h-screen flex flex-col justify-center items-center bg-gradient-to-br from-blue-100 to-white">
    <div class="text-center mb-10">
        <h1 class="text-4xl font-bold text-blue-700 mb-4">Bienvenue sur Carshare !</h1>
        <p class="text-lg text-gray-600">Trouvez ou proposez un trajet simplement.</p>
    </div>
    <form action="search.jsp" method="get" class="bg-white p-6 rounded-2xl shadow-lg w-fit md:w-full md:max-w-6xl space-y-8">
        <div class="grid md:grid-cols-3 gap-4">
            <input type="text" name="depart" placeholder="Départ" required
                   class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500">
                   <datalist id="startOptions">
                    <% 
                        List<String> startTowns = (List<String>) request.getAttribute("startTowns");
                        if (startTowns != null) {
                            for (String town : startTowns) {
                    %>
                        <option value="<%= town %>"></option>
                    <%
                            }
                        }
                    %>
                  </datalist>
            <input type="text" name="destination" placeholder="Destination" required
                   class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500">
            <input type="date" name="date" required
                   class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500">
        </div>
        <div class="flex justify-center">
            <button type="submit"
                    class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg font-semibold transition cursor-pointer">
                Rechercher un trajet
            </button>
        </div>
    </form>
    <div class="mt-12 text-center">
        <a href="create-trip.jsp"
           class="inline-block bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-full font-semibold shadow-md">
            Proposer un trajet
        </a>
    </div>
</section>