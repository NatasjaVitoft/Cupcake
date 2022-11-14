<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>

    <jsp:attribute name="header">
        Opret
    </jsp:attribute>

    <jsp:attribute name="footer">
        Opret<br>
    </jsp:attribute>

    <jsp:body>

        <br>
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-lg-auto">
                    <form action="Opret" method="post">
                        <p>Udfyld felterne:</p>
                        <hr>

                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="username"><b>Username</b></label>
                                <input type="username" placeholder="Enter username" name="username" id="username"
                                       required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="password"><b>Password</b></label>
                                <input type="password" placeholder="Enter Password" name="password" id="password"
                                       required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="email"><b>Email</b></label>
                                <input type="text" placeholder="Enter Email" name="email" id="email" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="role"><b>Role</b></label>
                                <input type="text" placeholder="Enter role" name="role" id="role" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="saldo"><b>Saldo</b></label>
                                <input type="text" placeholder="Enter saldo" name="saldo" id="saldo" required>
                            </div>
                        </div>

                        <hr>

                        <button type="submit" class="registerbtn">Opret</button>


                    </form>
                </div>
            </div>
        </div>

        <div class="container signin">
            <br>
            <p>Har du allerede en bruger? <a href="login.jsp">login her</a>.</p>
        </div>
        </form>

    </jsp:body>
</t:pagetemplate>



