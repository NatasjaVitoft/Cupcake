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

        <form action="AdminPage" method="post">
            <label for="username">Username: </label>
            <input type="text" id="username" name="username"/>
            <label for="saldo">Saldo: </label>
            <input type="saldo" id="saldo" name="saldo"/>
            <input type="submit" value="Opdater saldo"/>
        </form>

        <br>
        <form action="AdminPage" method="get">
            <input type="submit" value="Se Orderliste"/>
        </form>

        <br>

        <div style="width: 555px">
                ${sessionScope.orderlist}
        </div>

    </jsp:body>
</t:pagetemplate>