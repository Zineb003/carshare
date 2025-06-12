package app.servlet;

import app.util.DBUtil;

import app.model.User;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.sql.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

@WebServlet(urlPatterns = {"/profile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class ProfileServlet extends HttpServlet {

    private String uploadPath = "/usr/local/tomcat/webapps/carshare-app/uploads";
    private String uploadPathName = "/uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null ) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/run/run-profile.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("user");

        int userId = (int) user.getId();

        Argon2 argon2 = Argon2Factory.create();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Part avatar = request.getPart("avatar");
        String avatar_url = "";

        if(avatar != null && username != null && !username.isEmpty() && email != null && !email.isEmpty() && password != null && !password.isEmpty()) {

 
            avatar_url = avatar.getSubmittedFileName();
            avatar.write(uploadPath + File.separator + avatar_url);

            String hashedPassword = argon2.hash(4, 65536, 1, password);

            String updateSql = "UPDATE users SET username = ?, email = ?, password = ?, avatar_url = ? WHERE id = ?";
            try (Connection conn = DBUtil.getConnection()) {

                try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                    updateStmt.setString(1, username);
                    updateStmt.setString(2, email);
                    updateStmt.setString(3, hashedPassword);
                    updateStmt.setString(4, uploadPathName + File.separator + avatar_url);
                    updateStmt.setInt(5, userId);

                    int affectedRows = updateStmt.executeUpdate();
                    if (affectedRows == 0) {
                        request.setAttribute("error", "Erreur serveur. Veuillez réessayer.");
                    }

                    user.setUsername(username);
                    user.setEmail(email);
                    user.setAvatar(request.getContextPath() + uploadPathName + File.separator + avatar_url);

                    request.setAttribute("success", "Les informations ont bien été modifiées !");
                    request.setAttribute("user", user);

                } catch (SQLException e) {
                    request.setAttribute("error", "Erreur serveur. Veuillez réessayer.");
                }

            } catch (SQLException e) {
                request.setAttribute("error", "Erreur serveur. Veuillez réessayer.");
            } finally {
                argon2.wipeArray(password.toCharArray());
            }

        } else if (username != null && !username.isEmpty() && email != null && !email.isEmpty() && password != null && !password.isEmpty()) {

            String hashedPassword = argon2.hash(4, 65536, 1, password);

            String updateSql = "UPDATE users SET username = ?, email = ?, password = ? WHERE id = ?";
            try (Connection conn = DBUtil.getConnection()) {

                try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                    updateStmt.setString(1, username);
                    updateStmt.setString(2, email);
                    updateStmt.setString(3, hashedPassword);
                    updateStmt.setInt(4, userId);

                    int affectedRows = updateStmt.executeUpdate();
                    if (affectedRows == 0) {
                        request.setAttribute("error", "Erreur serveur. Veuillez réessayer.");
                    }

                    user.setUsername(username);
                    user.setEmail(email);

                    request.setAttribute("success", "Les informations ont bien été modifiées !");
                    request.setAttribute("user", user);

                } catch (SQLException e) {
                    request.setAttribute("error", "Erreur serveur. Veuillez réessayer.");
                }
            } catch (SQLException e) {
                request.setAttribute("error", "Erreur serveur. Veuillez réessayer.");
            } finally {
                argon2.wipeArray(password.toCharArray());
            }


        } else if (username != null && !username.isEmpty() && email != null && !email.isEmpty()) {
             
            String updateSql = "UPDATE users SET username = ?, email = ? WHERE id = ?";
            try (Connection conn = DBUtil.getConnection()) {

                try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                    updateStmt.setString(1, username);
                    updateStmt.setString(2, email);
                    updateStmt.setInt(3, userId);

                    int affectedRows = updateStmt.executeUpdate();
                    if (affectedRows == 0) {
                        request.setAttribute("error", "Erreur serveur. Veuillez réessayer.");
                    }

                    user.setUsername(username);
                    user.setEmail(email);
                    
                    request.setAttribute("success", "Les informations ont bien été modifiées !");
                    request.setAttribute("user", user);

                } catch (SQLException e) {
                    request.setAttribute("error", "Erreur serveur. Veuillez réessayer.");
                }

            } catch (SQLException e) {
                request.setAttribute("error", "Erreur serveur. Veuillez réessayer.");
            }
        
        } else {
            request.setAttribute("error", "Une erreur est survenue pendant la modification des informations.");
        }

        doGet(request, response);
    }
}