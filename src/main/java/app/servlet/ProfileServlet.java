package servlet;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import utils.DatabaseUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.sql.*;

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

        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
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

        String username = request.getParameter("user.username");
        String email = request.getParameter("user.email");
        String password = request.getParameter("user.password");

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
                e.printStackTrace();
                request.setAttribute("error", "Erreur lors de l'upload de l'avatar.");
                forwardWithUserData();
                return;
            }
        }

        forwardWithUserData();
    }

    // Modif version correcte
    private void forwardWithUserData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        request.setAttribute("username", session.getAttribute("username"));
        request.setAttribute("email", session.getAttribute("email"));
        request.setAttribute("avatarUrl", session.getAttribute("avatarUrl"));

        request.getRequestDispatcher("run-profile.jsp").forward(request, response);
    }
}