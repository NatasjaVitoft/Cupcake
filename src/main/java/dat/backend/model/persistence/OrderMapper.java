package dat.backend.model.persistence;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Order;
import dat.backend.model.entities.Orderline;
import dat.backend.model.exceptions.DatabaseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderMapper {

    ConnectionPool connectionPool;

    public OrderMapper(ConnectionPool connectionPool) {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    public static Order createOrder(String username, int total_price, ConnectionPool connectionPool ) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        Order order;
        String sql = "insert into orders (order_username, order_totalprice) values (?,?)";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setString(1, username);
                ps.setInt(2, total_price);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1)
                {
                    order = new Order(username, total_price);
                } else
                {
                    throw new DatabaseException("Could not insert order into database");
                }
            }
        }
        catch (SQLException | DatabaseException ex)
        {
            throw new DatabaseException(ex, "Could not insert order into database");
        }
        return order;
    }

    public static void readOrder(HttpServletRequest request, ConnectionPool connectionPool){
        List<Order> orderList = new ArrayList<>();

        HttpSession session = request.getSession();

        String sql = "select * from orders ";

        try (Connection connection = connectionPool.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("order_id");
                String username = resultSet.getString("order_username");
                Timestamp date = resultSet.getTimestamp("order_date");
                int total_price = resultSet.getInt("order_totalprice");

                Order order = new Order(id, username, date, total_price);
                orderList.add(order);
            }
            session.setAttribute("orderlist", orderList);

        } catch (SQLException e) {

            e.printStackTrace();
        }

    }

    public static Order updateOrder(int id, String username, ConnectionPool connectionPool) {
        return null;
    }
}