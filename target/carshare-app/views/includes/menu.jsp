<%@ page pageEncoding="UTF-8" import="app.model.User" isELIgnored="false" %>

<nav class="bg-white shadow-sm sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between h-16">
      <%-- Logo --%>
      <div class="flex-shrink-0 flex items-center">
        <a href="${pageContext.request.contextPath}/" class="text-blue-600 text-2xl font-bold tracking-wide hover:text-blue-700">
          Carshare
        </a>
      </div>

      <%-- User menu --%>
      <div class="flex items-center space-x-4">
          <a href="${pageContext.request.contextPath}/" class="hidden md:block text-gray-700 hover:text-blue-600 font-medium transition">Accueil</a>
          <a href="${pageContext.request.contextPath}/search" class="hidden md:block text-gray-700 hover:text-blue-600 font-medium transition">Rechercher</a>
        <%
           if (session.getAttribute("user") != null) { 
              User user = (User) session.getAttribute("user");
              String avatar = (String) user.getAvatar();
        %>
          <a href="${pageContext.request.contextPath}/create-trip" class="hidden md:block text-gray-700 hover:text-blue-600 font-medium transition">Proposer un trajet</a>
          <a href="${pageContext.request.contextPath}/user-trips" class="hidden md:block text-gray-700 hover:text-blue-600 font-medium transition">Mes trajets</a>
          <div class="relative group hidden md:block">
            <img src="<%= avatar %>" alt="avatar" class="w-10 h-10 rounded-full cursor-pointer transition border-2 border-blue-500"/>

            <div class="absolute left-1/2 transform -translate-x-1/2 mt-2 w-40 bg-white border border-gray-200 rounded-lg shadow-lg opacity-0 group-hover:opacity-100 scale-95 group-hover:scale-100 transform transition-all duration-200 z-50 invisible group-hover:visible">
              <a href="${pageContext.request.contextPath}/profile" class="block px-4 py-2 text-gray-700 hover:bg-blue-100 hover:text-blue-600 font-medium">Profil</a>
              <a href="${pageContext.request.contextPath}/logout" class="block px-4 py-2 text-gray-700 hover:bg-blue-100 hover:text-blue-600 font-medium">Déconnexion</a>
            </div>
          </div>
        <% } else { %>
          <a href="${pageContext.request.contextPath}/login" class="hidden md:block text-blue-600 hover:text-blue-700 font-semibold transition">Connexion</a>
          <a href="${pageContext.request.contextPath}/register" class="hidden md:block ml-4 px-3 py-1.5 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-semibold transition">
            Inscription
          </a>
        <% } %>
      </div>

      <%-- Mobile menu button --%>
      <div class="flex items-center md:hidden">
        <button id="mobile-menu-button" aria-label="Ouvrir le menu" class="text-gray-700 focus:outline-none cursor-pointer">
          <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" >
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M4 6h16M4 12h16M4 18h16"/>
          </svg>
        </button>
      </div>
    </div>
  </div>

  <!-- Mobile menu -->
  <div id="mobile-menu" class="hidden md:hidden bg-white border-t border-gray-200">
    <a href="${pageContext.request.contextPath}/" class="block px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 font-medium">Accueil</a>
    <a href="search.jsp" class="block px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 font-medium">Rechercher</a>
    <% 
        if (session.getAttribute("user") != null) { 
            User user = (User) session.getAttribute("user");
            String avatar = (String) user.getAvatar();
    %>
      <a href="create-trip.jsp" class="block px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 font-medium">Proposer un trajet</a>
      <a href="my-trips.jsp" class="block px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 font-medium">Mes trajets</a>
      <a href="profile.jsp" class="block px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 font-medium">Profil</a>
      <form action="${pageContext.request.contextPath}/logout" method="post" class="block px-4 py-3 hover:bg-red-50">
        <button type="submit" class="w-full text-left text-red-600 hover:text-red-700 font-semibold cursor-pointer">
          Déconnexion
        </button>
      </form>
    <% } else { %>
      <a href="${pageContext.request.contextPath}/login" class="block px-4 py-3 text-blue-600 hover:bg-blue-50 font-semibold">Connexion</a>
      <a href="${pageContext.request.contextPath}/register" class="block px-4 py-3 text-blue-600 hover:bg-blue-50 font-semibold">Inscription</a>
    <% } %>
  </div>
</nav>