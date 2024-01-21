<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.util.List" %>
<%@ page import="com.green.greensupermarket.entity.Product" %>
<%@ page import="com.green.greensupermarket.util.ProductUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            font-family: Arial;
        }
        table{
            border: 0px;
        }
        table td{
            padding: 10px;
        }
    </style>
</head>

<%
    String subTotal = request.getParameter("subtotal");
    String shipping = request.getParameter("shipping");
    String tax = request.getParameter("tax");
    String Total = request.getParameter("total");
    String description = request.getParameter("description");
%>

<body>
<div align="center">
    <h1>Checkout</h1>
    <form action="authorize_payment" method="post">
        <table>
            <tr>
                <td>Product Service</td>
                <td><input type="text" name="product" value="<%=description%>"></td>
            </tr>
            <tr>
                <td>Sub Total</td>
                <td><input type="text" name="subtotal" value="<%=subTotal%>"></td>
            </tr>
            <tr>
                <td>Shipping</td>
                <td><input type="text" name="shipping" value="<%=shipping%>"></td>
            </tr>
            <tr>
                <td>Tax</td>
                <td><input type="text" name="tax" value="<%=tax%>"></td>
            </tr>
            <tr>
                <td>Total</td>
                <td><input type="text" name="total" value="<%=Total%>"></td>
            </tr>
            <tr align="center">
                <td colspan="2"><input type="submit" name="total" value="checkout"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
