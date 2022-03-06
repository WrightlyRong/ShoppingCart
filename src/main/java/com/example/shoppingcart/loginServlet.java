package com.example.shoppingcart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import com.example.shoppingcart.DbConnection;
import java.sql.*;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        boolean checkUserExistenceInDB = false;
        try {
            String sqlQuery = "SELECT * FROM users WHERE email='" + email + "' and password='" + password + "'";
            DbConnection db = new DbConnection();
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sqlQuery);
            while (rs.next()) {
                checkUserExistenceInDB = true;
                session.setAttribute("email", email);
                response.sendRedirect("home.jsp");
            }
            if (checkUserExistenceInDB == false) {
                response.sendRedirect("login.jsp?msg=notexist");
            }
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("login.jsp?msg=invalid");
        }
    }
}
