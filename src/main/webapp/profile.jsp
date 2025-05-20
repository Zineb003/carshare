<%@ page contentType="text/html;charset=UTF-8" import="java.util.*, app.model.User, app.dao.UserDAO" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Carshare - Profil</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="menu.jsp" %>

    <div class="container mt-5">
        <div class="row">
            <div class="col-12 d-flex align-items-center">
                <img src="https://placehold.co/100" class="profile-pic">

                <div class="ms-3">
                    <h2>${sessionScope.user}</h2>
                    <p>Bienvenue sur ton profil !</p>
                </div>
            </div>
        </div>
        <hr/>
        <div class="row mt-4">
            <div class="col-12">
                <h1 class="mb-4">Liste des Utilisateurs</h1>
                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Date de création</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        UserDAO dao = new UserDAO();
                        List<User> Users = dao.getUsers();
            
                        for (User u : Users) {
                    %>
                        <tr>
                            <td><%= u.getId() %></td>
                            <td><%= u.getNom() %></td>
                            <td><%= u.getEmail() %></td>
                            <td><%= u.getDateCreation() %></td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
