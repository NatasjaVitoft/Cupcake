package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Top;
import sun.security.rsa.RSAUtil;

import java.sql.*;

public class CupcakeMapper {


    public static Top getTopById(int topId, ConnectionPool connectionPool) {

        String sql = "select * from cupcake_top where top_id = ?";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {

                ps.setInt(1, topId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {

                    int id = rs.getInt("top_id");
                    String name = rs.getString("top_name");
                    int price = rs.getInt("top_price");

                    Top top = new Top(id, name, price);
                    System.out.println(top);
                    return top;
                }
            } catch (SQLException e) {

                e.printStackTrace();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public static Bottom getBottomById(int bottomId, ConnectionPool connectionPool) {
        String sql = "select * from cupcake_base where base_id = ?";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {

                ps.setInt(1, bottomId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {

                    int id = rs.getInt("base_id");
                    String name = rs.getString("base_name");
                    int price = rs.getInt("base_price");

                    Bottom bottom = new Bottom(id, name, price);
                    System.out.println(bottom);
                    return bottom;
                }
            } catch (SQLException e) {

                e.printStackTrace();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
