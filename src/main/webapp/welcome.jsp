<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security"  uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Create an account</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

		<ul class="nav nav-pills nav-stacked">
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="${contextPath}/adminPage.jsp">Admin</a></li>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_USER')">
				<li><a href="${contextPath}/tutorials.jsp">Tutorials</a></li>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_USER')">
				<li><a href="${contextPath}/accountUpdate">Account Update</a></li>
			</security:authorize>			
		</ul>
    </c:if>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
