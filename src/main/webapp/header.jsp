<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/home-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<br>
<div class="topnav sticky">
    <%
        String email = session.getAttribute("email").toString();
    %>
    <div style="text-align: center;"><h2>Shopping Cart</h2></div>
    <h2><a href=""><% out.println(email); %> <i class='fas fa-user-alt'></i></a></h2>
    <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
    <a href="myCart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
    <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
</div>
<br>
</html>

