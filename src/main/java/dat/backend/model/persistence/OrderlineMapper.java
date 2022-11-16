package dat.backend.model.persistence;

import dat.backend.model.entities.Orderline;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderlineMapper {


    public static Orderline create(int topid, int baseid, int price, ConnectionPool connectionPool) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        Orderline orderLine;
        String sql = "insert into orderline (top_id, base_id, orderline_amount) values (?,?,?)";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, topid);
                ps.setInt(2, baseid);
                ps.setInt(3, price);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1)
                {
                    orderLine = new Orderline(topid, baseid, price);
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
        return orderLine;
    }
}
