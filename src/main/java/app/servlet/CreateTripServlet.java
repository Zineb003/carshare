
package app.servlet;
import java.sql.ResultSet;
import app.util.DBUtil;
import app.model.Trajet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;


@WebServlet("/createTrip")
public class CreateTripServlet extends jakarta.servlet.http.HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	int profilId = Integer.parseInt(request.getParameter("profilId"));
	String statut = null;
	try (Connection conn = DBUtil.getConnection()) {
	    String sql = "SELECT statut FROM profil WHERE id = ?";
	    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, profilId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                statut = rs.getString("statut");
	            }
	        }
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}
	request.setAttribute("profilId", profilId);
	request.setAttribute("statut", statut);
	request.getRequestDispatcher("createTrip.jsp").forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        System.out.println("✅ CreateTripServlet appelé !");

        int profilId = Integer.parseInt(request.getParameter("profilId"));
        String startTown = request.getParameter("startTown");
        String endTown = request.getParameter("endTown");
        String startAddress = request.getParameter("startAddress");
        String endAddress = request.getParameter("endAddress");
        String startDateStr = request.getParameter("startDate"); // ex: "2025-05-23T14:30"
        System.out.println("✅ [LOG] startDateStr  : " + startDateStr);
        startDateStr = startDateStr.replace("T", " ");
        if (startDateStr.length() == 16) { startDateStr += ":00"; //si format sans secondes
        }
        System.out.println("✅ [LOG] nouveau startDateStr  : " + startDateStr);
        Timestamp Date = Timestamp.valueOf(startDateStr);
        System.out.println("✅ [LOG] Date  : " + Date);

	String priceStr = request.getParameter("price");
	BigDecimal price = null;
	if (priceStr != null && !priceStr.trim().isEmpty()) {
	    price = new BigDecimal(priceStr.trim()); System.out.println("price: " + price);
	}


        String description = request.getParameter("description");
        
        try {
            String dateO = startDateStr.split(" ")[0];

            try (Connection conn = DBUtil.getConnection()) {
                String sql = "INSERT INTO trajets (profilId, startTown, endTown, startAddress, endAddress, startDate, price, description, createdAt) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, profilId);
                stmt.setString(2, startTown);
                stmt.setString(3, endTown);
                stmt.setString(4, startAddress);
                stmt.setString(5, endAddress);
                stmt.setTimestamp(6, Date);
                if (price != null) {
			stmt.setBigDecimal(7, price);
		} else {
			stmt.setNull(7, java.sql.Types.DECIMAL); }
                stmt.setString(8, description);
                stmt.setTimestamp(9, new Timestamp(System.currentTimeMillis()));

                stmt.executeUpdate();

                request.setAttribute("message", "Trajet cree avec succès !");
                response.sendRedirect("search?depart=" + startTown + "&destination=" + endTown + "&date=" + dateO);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Erreur lors de la creation du trajet : " + e.getMessage());
                request.getRequestDispatcher("createTrip.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de la conversion des donnees : " + e.getMessage());
            request.getRequestDispatcher("createTrip.jsp").forward(request, response);
        }
    }
}
