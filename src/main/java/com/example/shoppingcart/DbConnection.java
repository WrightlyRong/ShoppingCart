package com.example.shoppingcart;

import java.sql.*;

public class DbConnection {
    private String dbURL = "jdbc:mysql://localhost/shoppingcart";
    private String username = "root";
    private String password = "";
    private Connection connection;

    public DbConnection() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL, username, password);
            if (connection != null) {
                System.out.println("Success");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }

}
