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

@WebServlet(name = "addorder", value = "/addorder")
public class AddOrder extends HttpServlet {

    ConnectionPool connectionPool;

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

        System.out.println(username);
        System.out.println(price);

        Order order = new Order();
        ShoppingCart shoppingCart = new ShoppingCart();

        order.setUsername(username);
        order.setTotal_price(price);


        try {
            OrderFacade.createOrder(username, price, connectionPool);
            User user = UserFacade.getUserByUsername(username, connectionPool);
            int oldSaldo = user.getSaldo();
            int newSaldo = oldSaldo - price;
            if(oldSaldo>=price) {
                UserFacade.update(username, newSaldo, connectionPool);
            }

            session = request.getSession();
            session.setAttribute("order", order);
            session.removeAttribute("cart");
            session.setAttribute("cart", shoppingCart);

            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        } catch (DatabaseException | SQLException e) {
            e.printStackTrace();
            System.out.println("Something went wrong");
        }
        response.sendRedirect("welcome.jsp");
    }
}
