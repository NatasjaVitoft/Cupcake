<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
             Admin page
    </jsp:attribute>

    <jsp:attribute name="footer">
            Admin page <br>

    </jsp:attribute>

    <jsp:body>

        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-lg-auto">
                    <br>
                    <h5> Indsæt penge på brugerens konto</h5>
                    <br>
                    <form action="AdminPage" method="post">
                        <label for="username">Username: </label>
                        <input type="text" id="username" name="username"/>
                        <label for="saldo">Saldo: </label>
                        <input type="saldo" id="saldo" name="saldo"/>
                        <input style="background-color: #3c1463; border: none; color: whitesmoke" type="submit" value="Opdater saldo"/>
                    </form>

                    <br>
                    <form action="AdminPage" method="get">
                        <input style="background-color: #3c1463; border: none; color: whitesmoke" type="submit" value="Se ordreliste"/>
                    </form>

                    <br>

                    <div style="width: 555px">
                        <c:forEach var="item" items="${sessionScope.orderlist}">
                            ID: ${item.id} <br>
                            Username: ${item.username} <br>
                            Date: ${item.date} <br>
                            Pris: ${item.total_price} kr <br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:pagetemplate>