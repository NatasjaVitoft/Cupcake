package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Order;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.OrderFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddOrder", value = "/AddOrder")
public class AddOrder extends HttpServlet {

    ConnectionPool connectionPool;
    OrderFacade orderFacade;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("order", null);

        String username = (String) session.getAttribute("username");
        int price = (int) session.getAttribute("price");

        Order order = new Order();

        order.setUsername(username);
        order.setTotal_price(price);

        try {
            orderFacade.createOrder(username, price, connectionPool);
            session = request.getSession();
            session.setAttribute("order", order); // adding user object to session scope
            request.getRequestDispatcher("WEB-INF/welcome.jsp").forward(request, response);
        } catch (DatabaseException e) {
            e.printStackTrace();
        }
        response.sendRedirect("shopping.jsp");
    }
}
