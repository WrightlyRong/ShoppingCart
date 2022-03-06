<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 06-Mar-22
  Time: 2:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.example.shoppingcart.DbConnection" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Home</title>
    <style>
        h3
        {
            color: yellow;
            text-align: center;
        }
    </style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
    String msg = request.getParameter("msg");
    if("added".equals(msg))
    {
%>
<h3 class="alert">Product added successfully!</h3>
<%
    }
%>
<%
    if("exist".equals(msg))
    {
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%
    }
%>
<%
    if("invalid".equals(msg))
    {
%>
<h3 class="alert">Something went wrong! Try Again</h3>
<%
    }
%>
<table>
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Item Preview</th>
        <th scope="col"><i class="fa fa-bdt"></i> Price</th>
        <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
    </tr>
    </thead>
    <tbody>
<%
try{
    DbConnection db = new DbConnection();
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM items");
    Blob image;
    byte[] imgData;
    while (rs.next()){
        image = rs.getBlob(4);
        imgData = rs.getBytes(4);
        String encodedImage = Base64.getEncoder().encodeToString(imgData);
        String pic = "data:image/jpg;base64,"+encodedImage;
%>
    <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><img src="<%=pic%>"></td>
        <td><%=rs.getString(3)%></td>
        <td><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
    </tr>
<%
    }
    }catch (Exception e){
        System.out.println(e);
    }
%>
    </tbody>
</table>
<br>
<br>
<br>

</body>
</html>
