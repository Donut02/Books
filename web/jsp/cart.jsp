<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Bookshop</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
    <jsp:include page = "header.jsp"/>
    <h1>The following items are in your shopping cart</h1>

    <form name="form1" method="post" action="./books">
        <input type="hidden" name="action" value="update_cart" />
        <table>
            <thead>
                <tr>
                    <th>ISBN</th>
                    <th>Title</th>
                    <th>Price/unit</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="total" value="0.0" />
                <c:forEach var="entry" items="${sessionScope.cart}">
                    <c:set var="isbn" value="${entry.key}" />
                    <c:set var="item" value="${entry.value}" />
                    <c:set var="book" value="${item.book}" />
                    <c:set var="subtotal" value="${item.orderCost}" />
                    <c:set var="total" value="${total + subtotal}" />

                    <tr>
                        <td>${isbn}</td>
                        <td>${book.title}</td>
                        <td>${book.dollarPrice}</td>
                        <td>
                            <input type="text" name="${isbn}" size="2" maxlength="4" value="${item.quantity}" />
                        </td>
                        <td>${item.dollarOrderCost}</td>
                        <td align="center">
                            <input type="checkbox" name="remove" value="${isbn}" />
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4">
                        <input type="submit" name="Submit" value="Update Cart" />
                    </td>
                    <td colspan="2" align="right">
                        <strong>ORDER TOTAL $<fmt:formatNumber value="${total}" type="number" minFractionDigits="2" /></strong>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>

    <div class="link-container">
        <p><a href="./books?action=continue">Continue Shopping</a></p>
        <p><a href="./books?action=checkout">Check Out</a></p>
    </div>
    <jsp:include page = "footer.jsp"/>
</body>
</html>
