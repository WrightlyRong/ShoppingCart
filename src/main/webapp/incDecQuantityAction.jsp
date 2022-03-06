<%@page import="com.example.shoppingcart.DbConnection" %>
<%@page import="java.sql.*" %>

<%
    String email = session.getAttribute("email").toString();
    String id = request.getParameter("id");
    String incdec = request.getParameter("quantity");
    int price = 0;
    int total = 0;
    int quantity = 0;
    int final_total = 0;

    try{
        String incDecQuery = "SELECT * FROM cart WHERE email ='" + email + "' AND item_id='"+id+"'";
        DbConnection db = new DbConnection();
        Connection con = db.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(incDecQuery);
        while (rs.next()) {
            price = rs.getInt(4);
            total = rs.getInt(5);
            quantity = rs.getInt(3);
        }
        if(quantity==1 && incdec.equals("dec"))
            response.sendRedirect("myCart.jsp?msg=notPossible");
        else if(quantity!=1 && incdec.equals("dec")){
            total = total - price;
            quantity = quantity - 1;
            String updateQuery = "UPDATE cart SET total = '"+total+"', quantity = '"+quantity+"' WHERE email='"+email+"' AND item_id='"+id+"'";
            st.executeUpdate(updateQuery);
            response.sendRedirect("myCart.jsp?msg=dec");
        }
        else
        {
            total = total + price;
            quantity = quantity + 1;
            String updateQuery = "UPDATE cart SET total = '"+total+"', quantity = '"+quantity+"' WHERE email='"+email+"' AND item_id='"+id+"'";
            st.executeUpdate(updateQuery);
            response.sendRedirect("myCart.jsp?msg=inc");
        }
    }catch (Exception e){
        System.out.println(e);
    }
%>