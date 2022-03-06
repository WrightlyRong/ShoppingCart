<%@page import="com.example.shoppingcart.DbConnection" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>My Cart</title>
    <style>
        h3 {
            color: yellow;
            text-align: center;
        }
    </style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
    String msg = request.getParameter("msg");
    if ("notPossible".equals(msg)) {
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%
    }
%>
<%
    if ("inc".equals(msg)) {
%>
<h3 class="alert">Quantity Increased Successfully!</h3>
<%
    }
%>
<%
    if ("dec".equals(msg)) {
%>
<h3 class="alert">Quantity Decreased Successfully!</h3>
<%
    }
%>
<%
    if ("removed".equals(msg)) {
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%
    }
%>
<table>
    <thead>
    <%
        int total = 0;
        int serialNo = 0;
        try {
            String totalQuery = "SELECT sum(total) FROM cart WHERE email ='" + email + "'";
            DbConnection db = new DbConnection();
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(totalQuery);
            while (rs.next()) {
                total = rs.getInt(1);
            }
    %>
    <tr>
        <th scope="col" style="background-color: yellow;">Total: <% out.println(total); %> </i> </th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th scope="col">S.No</th>
        <th scope="col">Product Name</th>
        <th scope="col">price</th>
        <th scope="col">Quantity</th>
        <th scope="col">Sub Total</th>
        <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
    </tr>
    </thead>
    <tbody>
    <%
        String cartItemQuery = "SELECT * FROM items INNER JOIN cart ON items.id = cart.item_id AND cart.email='" + email + "'";
        ResultSet rs1 = st.executeQuery(cartItemQuery);
        while (rs1.next()) {
    %>
    <tr>
        <% serialNo++; %>
        <td><% out.println(serialNo); %></td>
        <td><%= rs1.getString(2)%>
        </td>
        <td><%= rs1.getInt(3)%>
        </td>
        <td><a href="incDecQuantityAction.jsp?id=<%=rs1.getInt(1)%>&quantity=inc"><i
                class='fas fa-plus-circle'></i></a> <%= rs1.getString(7)%>
            <a href="incDecQuantityAction.jsp?id=<%=rs1.getInt(1)%>&quantity=dec"><i
                    class='fas fa-minus-circle'></i></a></td>
        <td><%=rs1.getString(9)%>
        </td>
        <td><a href="removeFromCart.jsp?id=<%=rs1.getInt(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
    </tr>
    <%
            }
        } catch (Exception e) {

        }

    %>
    </tbody>
</table>
<br>
<br>
<br>

</body>
</html>