package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.SQLException;

public class UserFacade
{
    public static User login(String username, String password, ConnectionPool connectionPool) throws DatabaseException
    {
        return UserMapper.login(username, password, connectionPool);
    }

    public static User createUser(String username, String password, String email, String role, int saldo, ConnectionPool connectionPool) throws DatabaseException
    {
        return UserMapper.createUser(username, password, email, role, saldo, connectionPool);
    }

    public static User getUserByUsername(String username, ConnectionPool connectionPool) throws DatabaseException {
        return UserMapper.getUserByUsername(username, connectionPool);
    }

    public static void update(String username, int saldo, ConnectionPool connectionPool) throws SQLException {
         UserMapper.update(username, saldo, connectionPool);
    }
}
