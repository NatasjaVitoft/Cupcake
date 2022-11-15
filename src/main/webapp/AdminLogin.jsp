<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
             Login
    </jsp:attribute>

    <jsp:attribute name="footer">
            Login <br>
    </jsp:attribute>

    <jsp:body>

        <br>
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-lg-auto">
                    <h3>You can log in here</h3> <br>

                    <form action="AdminLogin" method="post">
                        <label for="username">Username: </label>
                        <input type="text" id="username" name="username"/>
                        <label for="password">Password: </label>
                        <input type="password" id="password" name="password"/>
                        <input style="background-color: #3c1463; color: whitesmoke" type="submit" value="Opret"/>
                    </form>

                    <br>
                    <p>Vil du logge ind som bruger? Tryk <a href="login.jsp"> her </a></p>
                </div>
            </div>
        </div>

    </jsp:body>
</t:pagetemplate>