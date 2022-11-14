package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.*;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "AddToCart", value = "/addtocart")
public class AddToCart extends HttpServlet {

    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException
    {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");


        int topId = Integer.parseInt(request.getParameter("top"));
        int bottomId = Integer.parseInt(request.getParameter("bottom"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));


        Top top = CupcakeFacade.getTopById(topId, connectionPool);
        Bottom bottom = CupcakeFacade.getBottomById(bottomId, connectionPool);

        Cupcake cupcake = new Cupcake(top, bottom, quantity);

        try {
            OrderlineFacade.create(topId, bottomId, quantity, connectionPool);
        } catch (DatabaseException e) {
            e.printStackTrace();
            System.out.println("IT DIDNT WORK");
        }

        int totalPrice = 0;

        for (int i = 0; i <= cart.getCupcakeList().size(); i++){
            totalPrice += cupcake.getBottom().getPrice() + cupcake.getTop().getPrice();
            System.out.println(totalPrice);
        }

        cart.setTotalPriceOfCupcakes(totalPrice);
        System.out.println(cart.getTotalPriceOfCupcakes());

        cart.add(cupcake);
        System.out.println(cart.getCupcakeList());

        session.setAttribute("cart", cart);
        request.setAttribute("cartsize", cart.getNumberOfCupcakes());
        session.setAttribute("price", cart.getTotalPriceOfCupcakes());



        request.getRequestDispatcher("shopping.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
