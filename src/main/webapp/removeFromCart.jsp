<%@page import="com.example.shoppingcart.DbConnection" %>
<%@page import="java.sql.*" %>

<%
    String email = session.getAttribute("email").toString();
    String item_id = request.getParameter("id");

    try {
        String removeQuery = "DELETE FROM cart WHERE email ='" + email + "' AND item_id='" + item_id + "'";
        DbConnection db = new DbConnection();
        Connection con = db.getConnection();
        Statement st = con.createStatement();
        st.executeUpdate(removeQuery);
        response.sendRedirect("myCart.jsp?msg=removed");
    } catch (Exception e) {
        System.out.println(e);
    }
%>