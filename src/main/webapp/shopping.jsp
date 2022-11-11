<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Shopping
    </jsp:attribute>

    <jsp:attribute name="footer">
        Shopping
    </jsp:attribute>

    <jsp:body>

        <h1>Shop amok</h1>

        <form action="addtocart" method="post">
            <select name="bottom" id="bottom">
                <option value="1">chokolade (10 kr)</option>
                <option value="2">vanilje (5 kr)</option>
            </select>

            <select name="top" id="top">
                <option value="1">chokolade (10 kr)</option>
                <option value="2">vanilje (5 kr)</option>
            </select>

            <select name="quantity" id="quantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
            <button name="addToCart">Add to cart</button>
        </form>

       <h2> Antal linjer i kurven: ${requestScope.cartsize}</h2>

        <h2>Indhold i kurv:</h2>
        <c:forEach var="item" items="${sessionScope.cart.cupcakeList}">
            Top: ${item.top.name} Bund: ${item.bottom.name} Antal: ${item.quantity}
            Price: ${item.top.price + item.bottom.price}<br>
        </c:forEach>
        <br>
        Total Price: ${sessionScope.cart.getTotalPriceOfCupcakes()}


    </jsp:body>

</t:pagetemplate>
