package app.servlet;

import app.util.DBUtil;

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
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class ProfileServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

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

        int userId = (int) session.getAttribute("user.id");

        String username = (String) request.getAttribute("user.username");
        String email = (String) request.getAttribute("user.email");
        String password = (String) request.getAttribute("user.password");

        Part avatarPart = request.getPart("user.avatar");

        String avatarFileName = null;

        // Upload avatar si fichier choisi
        if (avatarPart != null && avatarPart.getSize() > 0) {
            String submittedFileName = Path.of(avatarPart.getSubmittedFileName()).getFileName().toString();
            String fileExt = "";

            int i = submittedFileName.lastIndexOf('.');
            if (i > 0) {
                fileExt = submittedFileName.substring(i);
            }

            // Nom unique pour éviter conflit, ex: userId_timestamp.ext
            avatarFileName = "avatar_" + userId + "_" + System.currentTimeMillis() + fileExt;

            String applicationPath = request.getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            File file = new File(uploadDir, avatarFileName);

            try (InputStream input = avatarPart.getInputStream()) {
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                request.setAttribute("error", "Erreur lors de l'upload de l'avatar.");
                doGet(request, response);
                return;
            }
        }

        doGet(request, response);
    }
}