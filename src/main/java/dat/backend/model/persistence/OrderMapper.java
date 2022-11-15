package dat.backend.model.persistence;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Order;
import dat.backend.model.entities.Orderline;
import dat.backend.model.exceptions.DatabaseException;

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

    public static void readOrder(ConnectionPool connectionPool){
        List<String> orderList = new ArrayList<>();

        String sql = "select * from orders ";

        try (Connection connection = connectionPool.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("order_id");
                String username = resultSet.getString("order_username");
                Timestamp date = resultSet.getTimestamp("order_date");
                int total_price = resultSet.getInt("order_totalprice");

                orderList.add(id + " : username: " + username + ", order timestamp: " + date + " , total price: " + total_price);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
        for (String s : orderList) {

            System.out.println(s);

        }
    }

    /*public static Order deleteOrder(int id, String username, ConnectionPool connectionPool){

        //skal en metode til at printe liste som vi sletter fra

        String sql = "delete from order where order_id = ?";

        try (Connection connection = connectionPool.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql);) {

            String bookName = getString("Skriv navnet på bogen der skal slettes ");

            ps.setString(1, bookName);


            int res = ps.executeUpdate();

            if (res > 0) {

                System.out.println("Bogen med navnet " + "\"" + bookName + "\"" + " er nu blevet slettet");
            } else {

                System.out.println("Bogen med navnet " + "\"" + bookName + "\"" + " fandtes ikke i listen");

            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        //printer listen igen , så vi kan se at elementet er slettet fra listen.
        return order;
    }*/


    public static Order updateOrder(int id, String username, ConnectionPool connectionPool){
        return null;
    }


}