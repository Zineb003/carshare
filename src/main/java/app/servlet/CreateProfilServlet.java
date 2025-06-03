package app.servlet;

import app.util.DBUtil;
import app.model.User;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/createProfil")
public class CreateProfilServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("createProfil.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        User user = (User) session.getAttribute("user");

        String statut = request.getParameter("statut");
        String typeVehicule = request.getParameter("typeVehicule");
        String nbPassagersMaxStr = request.getParameter("nbPassagersMax");

        
        Integer nbPassagersMax = null;
        // Si le statut est "passager", on force les champs à null
        if ("passager".equalsIgnoreCase(statut)) {
            typeVehicule = null;
            nbPassagersMax = null;
        } 
        else {
            // Sinon, on essaie de parser le nombre de passagers
            if (nbPassagersMaxStr != null && !nbPassagersMaxStr.isEmpty()) {
                try {
                    nbPassagersMax = Integer.parseInt(nbPassagersMaxStr);
                } 
                catch (NumberFormatException e) {
                    nbPassagersMax = null; // ou gérer l'erreur selon ton besoin
                }
            
            }
        }

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO profil (userId, statut, typeVehicule, nbPassagersMax, createdAt) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, user.getId());
                stmt.setString(2, statut);
                
                if (typeVehicule != null) {
                    stmt.setString(3, typeVehicule);
                } else {
                    stmt.setNull(3, Types.VARCHAR);
                }
                if (nbPassagersMax != null) {
                    stmt.setInt(4, nbPassagersMax);
                } else {
                    stmt.setNull(4, Types.INTEGER);
                }
                stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
                stmt.executeUpdate();
            }

            // Rediriger vers createTrip.jsp avec le profilId pré-rempli
            response.sendRedirect("createTrip.jsp?profilId=" + user.getId());

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de la création du profil : " + e.getMessage());
            request.getRequestDispatcher("createProfil.jsp").forward(request, response);
        }
    }
}
