<%@ page pageEncoding="UTF-8" isELIgnored="false" %>

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
          <a href="${pageContext.request.contextPath}/" class="text-gray-700 hover:text-blue-600 font-medium transition">Accueil</a>
          <a href="${pageContext.request.contextPath}/search" class="text-gray-700 hover:text-blue-600 font-medium transition">Rechercher</a>
        <%
          Object user = session.getAttribute("user");
          if (user != null) {
        %>
          <a href="${pageContext.request.contextPath}/create-trip" class="text-gray-700 hover:text-blue-600 font-medium transition">Proposer un trajet</a>
          <a href="${pageContext.request.contextPath}/user-trips" class="text-gray-700 hover:text-blue-600 font-medium transition">Mes trajets</a>
          <a href="${pageContext.request.contextPath}/profile" class="text-gray-700 hover:text-blue-600 font-medium transition">Mon profil</a>
          <form action="${pageContext.request.contextPath}/logout" method="post" class="inline">
            <button type="submit"
                    class="text-red-600 hover:text-red-700 font-semibold transition cursor-pointer">
              Déconnexion
            </button>
          </form>
        <% } else { %>
          <a href="${pageContext.request.contextPath}/login" class="hidden md:block text-blue-600 hover:text-blue-700 font-semibold transition">Connexion</a>
          <a href="${pageContext.request.contextPath}/register" class="hidden md:block ml-4 px-3 py-1.5 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-semibold transition">
            Inscription
          </a>
        <% } %>
      </div>

      <%-- Mobile menu button --%>
      <div class="flex items-center md:hidden">
        <button id="mobile-menu-button" aria-label="Ouvrir le menu" class="text-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-blue-600 cursor-pointer">
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
    <a href="create-trip.jsp" class="block px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 font-medium">Proposer un trajet</a>
    <a href="my-trips.jsp" class="block px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 font-medium">Mes trajets</a>
    <% if (user != null) { 
          String avatar = (String) request.getAttribute("avatar");
    %>
      
      <a href="profile.jsp" class="block px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 font-medium">
        <img src="<%= avatar %>" alt="avatar">
      </a>
      <form action="${pageContext.request.contextPath}/logout" method="post" class="block px-4 py-3">
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