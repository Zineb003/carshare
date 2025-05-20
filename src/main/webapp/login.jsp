<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Carshare - Connexion</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="menu.jsp" %>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow rounded-3">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Connexion</h2>
    
                        <form method="POST" action="${pageContext.request.contextPath}/login">
                            <div class="mb-3">
                                <label for="username" class="form-label">Nom d'utilisateur</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
    
                            <div class="mb-3">
                                <label for="password" class="form-label">Mot de passe</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
    
                            <div class="d-grid">
                                <% String error = (String) request.getAttribute("error");
                                if (error != null && !error.isEmpty()) { %>
                                    <div class="alert alert-danger" role="alert">
                                        <%= error %>
                                    </div>
                                <% } %>
                                <button type="submit" class="btn btn-primary">Se connecter</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>