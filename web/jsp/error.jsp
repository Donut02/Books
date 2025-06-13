<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Error</h2>
    <c:choose>
        <c:when test="${not empty result}">
            <h3><c:out value="${result}" /></h3>
        </c:when>
        <c:otherwise>
            <h3>An unexpected error occurred.</h3>
        </c:otherwise>
    </c:choose>
</body>
</html>
