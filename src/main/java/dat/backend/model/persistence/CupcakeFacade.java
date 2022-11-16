package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Top;


public class CupcakeFacade {

    public static Top getTopById(int topId, ConnectionPool connectionPool){

        return CupcakeMapper.getTopById( topId, connectionPool);
    }

    public static Bottom getBottomById(int bottomId, ConnectionPool connectionPool ) {

        return CupcakeMapper.getBottomById( bottomId, connectionPool);
    }
}
