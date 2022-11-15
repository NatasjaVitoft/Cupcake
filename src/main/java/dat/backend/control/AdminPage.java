package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Order;
import dat.backend.model.entities.ShoppingCart;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.OrderFacade;
import dat.backend.model.persistence.UserFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminPage", value = "/AdminPage")
public class AdminPage extends HttpServlet {

    ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
            OrderFacade.readOrder(request, connectionPool);
            request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
        } catch (DatabaseException e) {
            e.printStackTrace();
        }
        response.sendRedirect("AdminPage.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("user", null);

        String username = request.getParameter("username");
        int saldo = Integer.parseInt(request.getParameter("saldo"));

        User user = new User();

        user.setUsername(username);
        user.setSaldo(saldo);

        try {
            UserFacade.update(username, saldo, connectionPool);
            session = request.getSession();
            session.setAttribute("user", user); // adding user object to session scope
            request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("AdminPage.jsp");
    }
}
