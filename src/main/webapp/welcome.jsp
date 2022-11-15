<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Velkommen til Olsters
    </jsp:attribute>

    <jsp:attribute name="footer">
        Velkommen til Olsters
    </jsp:attribute>

    <jsp:body>

        <br>
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-auto">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquet nulla metus, id blandit
                        ipsum
                        egestas a. Nulla tincidunt metus gravida nisl sodales convallis. Nunc vehicula ipsum ante, non
                        eleifend odio finibus a.
                        Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                        Nulla quis lorem tempus odio porta malesuada
                        sit amet in lectus. Nam euismod purus eget elit scelerisque, nec condimentum felis dignissim.
                        Donec cursus dapibus nunc. Pellentesque in mi
                        sed mi porttitor dapibus. Donec cursus consequat justo sit amet cursus. Orci varius natoque
                        penatibus et magnis dis parturient montes, nascetur ridiculus mus.
                        Ut sapien nulla, sodales nec neque vel, sollicitudin rutrum eros. Suspendisse laoreet tortor
                        quis lacus egestas, posuere lacinia odio scelerisque.
                        Donec tincidunt erat rutrum sem luctus, eu consequat tellus semper. Sed pretium sapien lobortis
                        sapien venenatis porta.
                        Vestibulum euismod sapien sed varius vehicula. Proin tristique placerat mi, vitae congue ante
                        accumsan ut.</p>

                    <c:if test="${sessionScope.user != null }">
                    <a href="shopping.jsp">
                        <button style="background-color: #3c1463; color: whitesmoke; border-color: #3c1463">Shop</button>
                    </a>
                    </c:if>

                </div>
            </div>
        </div>

    </jsp:body>

</t:pagetemplate>