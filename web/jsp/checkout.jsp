<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <jsp:include page = "header.jsp"/>
    <h1>Shopping Cart Check Out</h1>

    <form method="post" action="jsp/thankyou.jsp">
        <input type="hidden" name="action" value="validate_credit">
        <table>
            <thead>
                <tr>
                    <th colspan="2">You have selected to purchase the following items</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="total" value="0.0" />
                <c:forEach var="entry" items="${sessionScope.cart}">
                    <c:set var="item" value="${entry.value}" />
                    <tr>
                        <td>${item}</td>
                    </tr>
                    <c:set var="total" value="${total + item.orderCost}" />
                </c:forEach>
            </tbody>
        </table>

        <p>Please input the following information.</p>

        <table>
            <tr>
                <td>Last name:</td>
                <td><input type="text" name="lastname" size="25" /></td>
            </tr>
            <tr>
                <td>Street:</td>
                <td><input type="text" name="street" size="25" /></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><input type="text" name="city" size="25" /></td>
            </tr>
            <tr>
                <td>State:</td>
                <td><input type="text" name="state" size="2" /></td>
            </tr>
            <tr>
                <td>Zip code:</td>
                <td><input type="text" name="zipcode" size="10" /></td>
            </tr>
            <tr>
                <td>Phone #:</td>
                <td><input type="text" name="phone" size="12" /></td>
            </tr>
            <tr>
                <td>Credit Card #:</td>
                <td><input type="text" name="card_num" size="25" /></td>
            </tr>
            <tr>
                <td>Expiration (mm/yy):</td>
                <td>
                    <input type="text" name="expires" size="2" />/
                    <input type="text" name="expires2" size="2" />
                </td>
            </tr>
            <tr>
                <td>Order Amount $</td>
                <td>
                    <fmt:formatNumber var="formattedTotal" value="${total}" type="currency" currencySymbol="" minFractionDigits="2" />
                    <input type="text" name="amount" value="${formattedTotal}" readonly />
                </td>
            </tr>
        </table>

        <p><input type="submit" value="Submit" /></p>
    </form>
    <jsp:include page = "footer.jsp"/>     
</body>
</html>
