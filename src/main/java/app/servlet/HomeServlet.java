package app.servlet;

import app.util.DBUtil;

import java.util.List;
import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/index.html"})
public class HomeServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<String> startTown = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT DISTINCT startTown FROM trajets");
            ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                startTown.add(rs.getString("startTown"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        request.setAttribute("startTown", startTown);
        RequestDispatcher dispatcher = request.getRequestDispatcher("run-home.jsp");
        dispatcher.forward(request, response);
    }
}