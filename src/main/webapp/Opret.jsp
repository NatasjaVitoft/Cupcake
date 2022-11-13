<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>

    <jsp:attribute name="header">

    </jsp:attribute>

    <jsp:attribute name="footer">

    </jsp:attribute>

    <jsp:body>

        <form action="Opret" method="post">
            <div class="container">
                <h1>Opret</h1>
                <p>Udfyld felterne:</p>
                <hr>

                <label for="username"><b>Username</b></label>
                <input type="username" placeholder="Enter username" name="username" id="username" required>

                <label for="password"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" id="password" required>

                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" id="email" required>

                <label for="role"><b>Role</b></label>
                <input type="text" placeholder="Enter role" name="role" id="role" required>

                <label for="saldo"><b>Saldo</b></label>
                <input type="text" placeholder="Enter saldo" name="saldo" id="saldo" required>

                <hr>

                <button type="submit" class="registerbtn">Opret</button>

            </div>

            <div class="container signin">
                <br>
                <p>Har du allerede en bruger? <a href="login.jsp">login her</a>.</p>
            </div>
        </form>

    </jsp:body>
</t:pagetemplate>



