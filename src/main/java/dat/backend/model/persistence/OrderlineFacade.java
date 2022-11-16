package dat.backend.model.persistence;

import dat.backend.model.entities.Orderline;
import dat.backend.model.exceptions.DatabaseException;


public class OrderlineFacade {

    public static Orderline create(int topid, int baseid, int price, ConnectionPool connectionPool) throws DatabaseException {
        return OrderlineMapper.create(topid, baseid, price, connectionPool);
    }
}
