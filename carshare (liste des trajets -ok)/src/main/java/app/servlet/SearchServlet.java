
package app.servlet;

import app.util.DBUtil;
import app.model.Trajet;


import java.sql.Timestamp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/search")
public class SearchServlet extends jakarta.servlet.http.HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        System.out.println("✅ SearchServlet appelé !");
        String depart = request.getParameter("depart");
        String destination = request.getParameter("destination");
        String date = request.getParameter("date");

        System.out.println("Départ: " + depart + ", Destination: " + destination + ", Date: " + date);

        List<Trajet> trajets = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT t.*, p.statut, p.typeVehicule, u.username, u.avatar_url FROM trajets t " +
                         "JOIN profil p ON t.profilId = p.id " +
                         "JOIN users u ON p.id = u.id " +
                         "WHERE t.startTown = ? AND t.endTown = ? AND DATE(t.startDate) = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, depart);
            stmt.setString(2, destination);
            stmt.setString(3, date);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    System.out.println("✅ Trajet trouvé : " + rs.getString("startTown") + " → " + rs.getString("endTown"));

                    Trajet trajet = new Trajet();
                    trajet.setId(rs.getInt("id"));
                    trajet.setProfilId(rs.getInt("profilId"));
                    trajet.setStartTown(rs.getString("startTown"));
                    trajet.setEndTown(rs.getString("endTown"));
                    trajet.setStartAddress(rs.getString("startAddress"));
                    trajet.setEndAddress(rs.getString("endAddress"));
                    trajet.setStartDate(rs.getTimestamp("startDate"));
                    trajet.setPrice(rs.getBigDecimal("price"));
                    trajet.setDescription(rs.getString("description"));
                    trajet.setCreatedAt(rs.getTimestamp("createdAt"));

                    trajets.add(trajet);
                }
            }

            request.setAttribute("trajets", trajets);
            request.getRequestDispatcher("search.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de la recherche : " + e.getMessage());
            request.getRequestDispatcher("/search.jsp").forward(request, response);
        }
    }
}
