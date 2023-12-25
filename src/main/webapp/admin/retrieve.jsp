<%@ page import="com.green.greensupermarket.dbconnect.DbConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <%
        Connection con = DbConnect.getConnection();
        String sql = "SELECT image FROM product";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()){ %>
                <tr>
                    <td><img width="100px" height="100px" src="/uploads/<%=rs.getString("image")%>"></td>
                </tr>
        <% }

    %>
</body>
</html>
