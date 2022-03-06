<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 05-Mar-22
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.example.shoppingcart.DbConnection" %>
<%@page import="java.sql.*" %>
<%
    try{
        DbConnection db = new DbConnection();
        Connection con = db.getConnection();
        Statement st = con.createStatement();
        String q1 = "create table users(name varchar(100), email varchar(100)primary key, password varchar(100))";
        String q2 = "create table items(id int, name varchar(500), price int)";
        String q3 = "create table cart(email varchar(100), item_id int, quantity int, price int, total int)";


        System.out.println(q1);
        st.execute(q1);

        System.out.println(q2);
        st.execute(q2);

        System.out.println(q3);
        st.execute(q3);
        System.out.println("Table Created");
        con.close();
    }catch (Exception e){

    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
