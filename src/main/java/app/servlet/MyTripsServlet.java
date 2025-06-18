package app.servlet;

import app.util.DBUtil;
import app.model.User;
import app.model.Trip;

import jakarta.servlet.ServletException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.ArrayList;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/mytrips"})
public class MyTripsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        int userId = (int) user.getId();

        List<Trip> trips = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM trips WHERE driver_id = ? ORDER BY start_date DESC";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Trip trip = new Trip();
                    trip.setId(rs.getInt("id"));
                    trip.setStartTown(rs.getString("start_town"));
                    trip.setEndTown(rs.getString("end_town"));
                    trip.setStartDate(rs.getTimestamp("start_date").toLocalDateTime());
                    trip.setNbPlaces(rs.getInt("nb_places"));
                    trip.setPrice(rs.getBigDecimal("price"));
                    trip.setDescription(rs.getString("description"));
                    trips.add(trip);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de la récupération des trajets.");
        }

        request.setAttribute("trips", trips);
        request.getRequestDispatcher("/run/run-mytrips.jsp").forward(request, response);
    }
}