package dat.backend.model.persistence;

import dat.backend.model.entities.Admin;
import dat.backend.model.exceptions.DatabaseException;

public class AdminFacade {

    public static Admin login(String username, String password, ConnectionPool connectionPool) throws DatabaseException
    {
        return AdminMapper.login(username, password, connectionPool);
    }
}
