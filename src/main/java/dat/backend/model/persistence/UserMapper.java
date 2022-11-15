package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

class UserMapper {

    static User login(String username, String password, ConnectionPool connectionPool) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        User user = null;

        String sql = "SELECT * FROM user WHERE user_username = ? AND user_password = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String email = rs.getString("user_email");
                    user = new User(username, password, email);

                } else {
                    throw new DatabaseException("Wrong username or password");
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
        return user;
    }

    static User createUser(String username, String password, String email, String role, int saldo, ConnectionPool connectionPool) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        User user;
        String sql = "insert into user (user_username, user_password, user_email, user_role, user_saldo) values (?,?,?,?,?)";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, email);
                ps.setString(4, role);
                ps.setInt(5, saldo);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1) {
                    user = new User(username, password, email, role, saldo);
                } else {
                    throw new DatabaseException("The user with username = " + username + " could not be inserted into the database");
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Could not insert username into database");
        }
        return user;
    }

    static User getUserByUsername(String username, ConnectionPool connectionPool) throws DatabaseException {

        String sql = "SELECT * FROM user WHERE user_username = ?";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {

                ps.setString(1, username);

                ResultSet resultSet = ps.executeQuery();

                if (resultSet.next()) {
                    int id = resultSet.getInt("user_id");
                    String userName = resultSet.getString("user_username");
                    String password = resultSet.getString("user_password");
                    int saldo = resultSet.getInt("user_saldo");
                    String email = resultSet.getString("user_email");
                    String role = resultSet.getString("user_role");

                    User user = new User(id, userName, password, role, email, saldo);
                    return user;
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Something went wrong");
        }
        return null;
    }

    public static void update(String username, int saldo, ConnectionPool connectionPool) throws SQLException {

        String sql = "UPDATE user Set user_saldo = ? WHERE user_username = ?";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {

                ps.setInt(1, saldo);
                ps.setString(2, username);
                ps.executeUpdate();

            } catch (SQLException exception) {
                exception.printStackTrace();
            }
        }
    }
}












