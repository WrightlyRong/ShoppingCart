package com.example.shoppingcart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import com.example.shoppingcart.DbConnection;

import java.sql.*;

@WebServlet(name = "signupServlet", value = "/signupServlet")
public class signupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            DbConnection db = new DbConnection();
            Connection con = db.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO users values(?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.executeUpdate();
            response.sendRedirect("signup.jsp?msg=valid");

        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("signup.jsp?msg=invalid");
        }
    }
}
