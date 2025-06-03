<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
    
<section class="min-h-screen flex flex-col justify-center items-center bg-gradient-to-br from-blue-100 to-white">
    <div class="w-full max-w-md bg-white rounded-lg shadow-md p-8">

        <h1 class="text-3xl font-bold mb-6 text-center">Créer un compte</h1>

        <% 
            String error = (String) request.getAttribute("error");
        %>

        <% if (error != null) { %>
            <div class="mb-4 p-3 bg-red-100 text-red-700 rounded">
                <%= error %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/register" method="post" class="space-y-5">

            <div>
                <label for="username" class="block text-gray-700 font-semibold mb-1">Nom d'utilisateur</label>
                <input type="text" name="username" id="username" required
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>

            <div>
                <label for="email" class="block text-gray-700 font-semibold mb-1">Adresse e-mail</label>
                <input type="email" name="email" id="email" required
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>

            <div>
                <label for="password" class="block text-gray-700 font-semibold mb-1">Mot de passe</label>
                <input type="password" name="password" id="password" required
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>

            <button type="submit" 
                    class="w-full bg-blue-600 text-white font-semibold py-2 rounded-md hover:bg-blue-700 transition cursor-pointer">
                S'inscrire
            </button>
        </form>

        <p class="mt-6 text-center text-gray-600 text-sm">
            Déjà un compte ? <a href="${pageContext.request.contextPath}/login" class="text-blue-600 hover:underline">Se connecter</a>
        </p>

    </div>
</section>