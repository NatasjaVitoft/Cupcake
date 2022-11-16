package dat.backend.model.persistence;

import dat.backend.model.entities.Order;
import dat.backend.model.exceptions.DatabaseException;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;

public class OrderFacade {

    public static Order createOrder(String username, int total_price, ConnectionPool connectionPool) throws DatabaseException {
        return OrderMapper.createOrder(username, total_price, connectionPool);
    }

    public static void readOrder(HttpServletRequest request, ConnectionPool connectionPool) throws DatabaseException{
        OrderMapper.readOrder(request, connectionPool);
    }

    public static Order updateOrder(int id, String username, ConnectionPool connectionPool) throws DatabaseException{
        return OrderMapper.updateOrder(id, username, connectionPool);
    }
}
