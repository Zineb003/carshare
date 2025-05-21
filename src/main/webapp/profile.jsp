<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%
    String username = (String) request.getAttribute("user.username");
    String email = (String) request.getAttribute("user.email");
    String avatar = (String) request.getAttribute("user.avatar");
    
    String error = (String) request.getAttribute("error");
    String success = (String) request.getAttribute("success");
%>

<section class="min-h-screen flex flex-col justify-center items-center bg-gradient-to-br from-blue-100 to-white">
    <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-8">

        <h1 class="text-2xl font-bold mb-6 text-center">Bienvenue, <%= username %> !</h1>

        <% if (error != null) { %>
            <div class="mb-4 p-3 bg-red-100 text-red-700 rounded">
                <%= error %>
            </div>
        <% } %>
        <% if (success != null) { %>
            <div class="mb-4 p-3 bg-green-100 text-green-700 rounded">
                <%= success %>
            </div>
        <% } %>

        <form action="ProfileUpdateServlet" method="post" enctype="multipart/form-data" class="space-y-6">

            <div class="flex flex-col items-center">
                <img id="avatarPreview" src="<%= avatar %>" alt="Avatar" 
                    class="w-24 h-24 rounded-full object-cover mb-3 border border-gray-300" />
                <label for="avatar" 
                    class="cursor-pointer text-blue-600 hover:underline text-sm">Changer l'avatar</label>
                <input type="file" id="avatar" name="avatar" accept="image/*" class="hidden" />
            </div>

            <div>
                <label for="username" class="block mb-1 font-semibold text-gray-700">Nom d'utilisateur</label>
                <input type="text" id="username" name="username" required
                    value="<%= username != null ? username : "" %>"
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>

            <div>
                <label for="email" class="block mb-1 font-semibold text-gray-700">Email</label>
                <input type="email" id="email" name="email" required
                    value="<%= email != null ? email : "" %>"
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>

            <div>
                <label for="password" class="block mb-1 font-semibold text-gray-700">Nouveau mot de passe</label>
                <input type="password" id="password" name="password" placeholder="Laissez vide pour ne pas changer"
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>

            <button type="submit" 
                    class="w-full bg-blue-600 text-white py-2 rounded-md font-semibold hover:bg-blue-700 transition cursor-pointer">
                Enregistrer les modifications
            </button>
        </form>
    </div>
</section>