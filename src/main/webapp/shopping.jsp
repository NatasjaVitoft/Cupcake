<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">

    </jsp:attribute>

    <jsp:attribute name="footer">

    </jsp:attribute>

    <jsp:body>


        <div style="max-width: 1200px; margin: 0 auto; padding: 10px">
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col-lg-8">


                        <h1>Shopping</h1>
                        <br>
                    </div>
                </div>
                <div class="row justify-content-md-center">
                    <div class="col-lg-8">
                        <form action="addtocart" method="post">
                            <select name="bottom" id="bottom">
                                <option value="1">chokolade (5 kr)</option>
                                <option value="2">vanilje (5 kr)</option>
                                <option value="3">nutmeg (5 kr)</option>
                                <option value="4">pistacio (6 kr)</option>
                                <option value="5">almond (7 kr)</option>

                            </select>

                            <select name="top" id="top">
                                <option value="1">chokolade (5 kr)</option>
                                <option value="2">blueberry (5 kr)</option>
                                <option value="3">Raspberry (5 kr)</option>
                                <option value="4">Crispy (6 kr)</option>
                                <option value="5">Strawberry (6 kr)</option>
                                <option value="6">rum/raisin (7 kr)</option>
                                <option value="7">orange (8 kr)</option>
                                <option value="8">lemon (8 kr)</option>
                                <option value="9">blue cheese (9 kr)</option>
                            </select>

                            <select name="quantity" id="quantity">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                            <button name="addToCart">Add to cart</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <div class="container justify-content">
            <div class="row">
                <div class="col-lg-8">

                    <h2> Antal linjer i kurven: ${requestScope.cartsize}</h2>

                    <h2>Indhold i kurv:</h2>

                    <c:forEach var="item" items="${sessionScope.cart.cupcakeList}">
                        Top: ${item.top.name} Bund: ${item.bottom.name} Antal: ${item.quantity}
                        Pris: ${item.top.price + item.bottom.price} kr<br>
                    </c:forEach>
                    <br>

                    Antal af cupcakes: ${sessionScope.cart.numberOfCupcakes} <br>
                    Total pris: ${sessionScope.cart.getTotalPriceOfCupcakes()} kr

                    <br>
                    <br>
                    <form action="addorder" method="post">
                        <button name="addorder"> Betal</button>

                    </form>
                </div>
            </div>
        </div>


    </jsp:body>

</t:pagetemplate>
