<%@page import="com.example.shoppingcart.DbConnection" %>
<%@page import="java.sql.*" %>

<%
    String email = session.getAttribute("email").toString();
    String item_id = request.getParameter("id");
    int quantity = 1;
    int item_price = 0;
    int item_total = 0;
    int cart_total = 0;

    boolean check = false;
    try {
        DbConnection db = new DbConnection();
        Connection con = db.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM items WHERE id='" + item_id + "'");
        while (rs.next()) {
            item_price = rs.getInt(3);
            item_total = item_price;
        }
        ResultSet rs1 = st.executeQuery("SELECT * FROM cart WHERE item_id='" + item_id + "' AND email='" + email + "'");
        while (rs1.next()) {
            cart_total = rs1.getInt(5);
            cart_total = cart_total + item_total;
            quantity = rs1.getInt(3);
            quantity++;
            check = true;
        }
        if (check == true) {
            String updateQuery = "UPDATE cart SET total='" + cart_total + "', quantity='" + quantity + "' WHERE item_id='" + item_id + "' AND email='" + email + "'";
            st.executeUpdate(updateQuery);
            response.sendRedirect("home.jsp?msg=exist");
        }
        if (check == false) {
            String insertQuery = "INSERT INTO cart(email, item_id, quantity, price, total) VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(insertQuery);
            ps.setString(1, email);
            ps.setInt(2, Integer.parseInt(item_id));
            ps.setInt(3, quantity);
            ps.setInt(4, item_price);
            ps.setInt(5, item_total);

            ps.executeUpdate();
            response.sendRedirect("home.jsp?msg=added");
        }
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("home.jsp?msg=invalid");
    }
%>