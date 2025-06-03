package app.servlet;
import java.sql.ResultSet;
import app.util.DBUtil;
import app.model.Trajet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import app.model.User;
import java.sql.*;
import jakarta.servlet.http.*;

@WebServlet("/myTrips")
public class MyTripsServlet extends jakarta.servlet.http.HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
	System.out.println("Utilisateur connecté : " + user.getUsername() + " (ID: " + user.getId() + ")");

        int userId = user.getId();

        List<Trajet> trajets = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT t.*, p.statut, p.typeVehicule, u.username, u.avatar_url FROM trajets t " +
                         "JOIN profil p ON t.profilId = p.id " +
                         "JOIN users u ON p.id = u.id " +
                         "WHERE p.id = ? ";
		System.out.println("Nombre de trajets trouvés : " + trajets.size());

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Trajet trajet = new Trajet();
                        trajet.setId(rs.getInt("id"));
                        trajet.setStartTown(rs.getString("startTown"));
                        trajet.setStartAddress(rs.getString("startAddress"));
                        trajet.setEndTown(rs.getString("endTown"));
                        trajet.setEndAddress(rs.getString("endAddress"));
                        trajet.setStartDate(rs.getTimestamp("startDate"));
                        trajet.setPrice(rs.getBigDecimal("price"));
                        trajet.setDescription(rs.getString("description"));
			trajet.setStatut(rs.getString("statut"));
			trajet.setTypeVehicule(rs.getString("typeVehicule"));
			trajet.setUsername(rs.getString("username"));
			trajet.setAvatar_url(rs.getString("avatar_url"));

                        trajets.add(trajet);
                    } System.out.println("Nombre de trajets trouvés : " + trajets.size());

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


	

        request.setAttribute("trajets", trajets);
        request.getRequestDispatcher("myTrips.jsp").forward(request, response);
    }
}
