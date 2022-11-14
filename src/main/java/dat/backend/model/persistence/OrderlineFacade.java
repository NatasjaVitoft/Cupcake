package dat.backend.model.persistence;

import dat.backend.model.entities.Order;
import dat.backend.model.entities.Orderline;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.Timestamp;

public class OrderlineFacade {

    public static Orderline create(int topid, int baseid, int price, ConnectionPool connectionPool) throws DatabaseException {
        return OrderlineMapper.create(topid, baseid, price, connectionPool);
    }
}
