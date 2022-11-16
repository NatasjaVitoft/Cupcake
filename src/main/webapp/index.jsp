<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Olsker cupcake
    </jsp:attribute>

    <jsp:attribute name="footer">
        Olsker cupcake
    </jsp:attribute>

    <jsp:body>
        <br>
        <div style="text-align: center">
        <p>Log venglist på systemet først</p>
        <p>Derefter kan du shoppe løs</p>
        <p>Det kan du gøre her: <a href="login.jsp">link</a></p>
        </div>

    </jsp:body>

</t:pagetemplate>