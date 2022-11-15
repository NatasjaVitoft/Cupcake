<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <jsp:invoke fragment="header"/>
    </title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<header>
    <div class="container">
            <div style="justify-content: center; display: flex; background-color: #3c1463;">
                <a class="navbar-brand" href="welcome.jsp">
                    <img src="${pageContext.request.contextPath}/images/olskercupcakes.png" width="1000px;"
                         class="img-fluid"/>
                </a>
            </div>
            <nav class="navbar navbar-expand-lg navbar-secondary bg-light">
                <div class="container">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNavAltMarkup"
                            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-item nav-link"
                               href="${pageContext.request.contextPath}/welcome.jsp">Forside</a>
                            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/price.jsp">Priser</a>
                            <c:if test="${sessionScope.user != null }">
                                <a class="nav-item nav-link"
                                   href="${pageContext.request.contextPath}/shopping.jsp">Kurv</a>
                            </c:if>
                            <c:if test="${sessionScope.user == null }">
                                <a class="nav-item nav-link"
                                   href="${pageContext.request.contextPath}/login.jsp">Login</a>
                            </c:if>
                            <c:if test="${sessionScope.user != null }">
                                <a class="nav-item nav-link" href="${pageContext.request.contextPath}/logout">Log
                                    out</a>
                            </c:if>
                            <c:if test="${sessionScope.user.email != null }">
                                <a class="nav-item nav-link" href="#"> ${sessionScope.user.email}</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </nav>
    </div>
</header>

<div id="body" class="container mt-4" style="min-height: 400px;">
    <h1 style="text-align: center">
        <jsp:invoke fragment="header"/>
    </h1>
    <jsp:doBody/>
</div>

<!-- Footer -->
<div class="container mt-3">
    <hr/>
    <div class="row mt-4">
        <div class="col">
            Nørgaardsvej 30<br/>
            2800 Lyngby
        </div>
        <div class="col">
            Olster Cupcakes <br>
            <p>&copy; 2012 Cphbusiness</p>
        </div>
        <div class="col">
            Datamatikkeruddannelsen<br/>
            2.semester efterår 2022
        </div>
    </div>

</div>

</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>