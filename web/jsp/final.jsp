<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Online Bookstore</h2>
    <hr>
    <h3>Thank you for shopping with us.</h3>

    <table>
        <tr>
            <td>
                <c:out value="${result}" default="No result message available."/>
            </td>
        </tr>
    </table>
</body>
</html>
