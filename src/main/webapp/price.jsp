<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Priser
    </jsp:attribute>

    <jsp:attribute name="footer">
        Priser
    </jsp:attribute>

    <jsp:body>

        <br>
        <br>
        <h4 style="text-align: center">Bunde</h4>

        <table class="table table-striped">
            <thead>
            <tr>
                <th style="width: 70%">Bund</th>
                <th style="width: 30%">Pris</th>
            </tr>
            </thead>
            <tr>
                <td>Chokolade</td>
                <td>5 kr</td>
            </tr>
            <tr>
                <td>Blåbær</td>
                <td>5 kr</td>
            </tr>
            <tr>
                <td>Hindbær</td>
                <td>5 kr</td>
            </tr>
            <tr>
                <td>Crispy</td>
                <td>6 kr</td>
            </tr>
            <tr>
                <td>Jordbær</td>
                <td>6 kr</td>
            </tr>
            <tr>
                <td>Rum/rosin</td>
                <td>7 kr</td>
            </tr>
            <tr>
                <td>Appelsin</td>
                <td>8 kr</td>
            </tr>
            <tr>
                <td>Citron</td>
                <td>8 kr</td>
            </tr>
            <tr>
                <td>Skimmelost</td>
                <td>9 kr</td>
            </tr>
        </table>

        <br>
        <h4 style="text-align: center">Toppe</h4>

        <table class="table table-striped">
            <thead>
            <tr>
                <th style="width: 70%">Top</th>
                <th style="width: 30%">Pris</th>
            </tr>
            </thead >
            <tr>
                <td>Vanilje</td>
                <td>5 kr</td>
            </tr>
            <tr>
                <td>Nutmeg</td>
                <td>5 kr</td>
            </tr>
            <tr>
                <td>Pistacie</td>
                <td>6 kr</td>
            </tr>
            <tr>
                <td>Mandel</td>
                <td>7 kr</td>
            </tr>
        </table>

        <br>

    </jsp:body>

</t:pagetemplate>