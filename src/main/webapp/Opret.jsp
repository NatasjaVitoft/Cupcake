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

        <br>

        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-lg-2">
                    <form action="Opret" method="post">
                        <h1>Opret</h1>
                        <h4>Udfyld felterne:</h4>
                        <br>

                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="username"></label>
                                <input type="username" placeholder="Enter username" name="username" id="username"
                                       required>
                            </div>
                        </div>

                        <br>

                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="password"></label>
                                <input type="password" placeholder="Enter Password" name="password" id="password"
                                       required>
                            </div>
                        </div>

                        <br>

                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="email"></label>
                                <input type="text" placeholder="Enter Email" name="email" id="email" required>
                            </div>
                        </div>

                        <br>


                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="role"></label>
                                <input type="text" placeholder="Enter role" name="role" id="role" required>
                            </div>
                        </div>

                        <br>

                        <div class="row">
                            <div class="col-lg-auto">
                                <label for="saldo"></label>
                                <input type="text" placeholder="Enter saldo" name="saldo" id="saldo" required>
                            </div>
                        </div>

                        <br>
                        <br>
                        <div class="row">
                            <div class="col-lg-auto">
                                <button style="background-color: black; color: whitesmoke" type="submit" class="registerbtn">Opret</button>
                            </div>
                        </div>


                    </form>
                </div>
            </div>
        </div>
        <div style="text-align: center">
            <div class="col-lg-auto">
                <div class="container signin">
                    <br>
                    <p>Har du allerede en bruger? <a href="login.jsp">login her</a>.</p>
                </div>
            </div>
        </div>

    </jsp:body>
</t:pagetemplate>



