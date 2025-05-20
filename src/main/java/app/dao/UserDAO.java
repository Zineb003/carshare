package app.dao;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import app.model.User;

public class UserDAO {

    private DataSource dataSource;

    public UserDAO() {
        try {
            InitialContext ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/carshare");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<User> getUsers() {
        List<User> liste = new ArrayList<>();
        String sql = "SELECT * FROM users ORDER BY created_at DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setNom(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setMotDePasse(rs.getString("password"));
                u.setDateCreation(rs.getTimestamp("created_at"));
                liste.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return liste;
    }
}