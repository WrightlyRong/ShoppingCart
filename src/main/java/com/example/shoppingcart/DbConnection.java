package com.example.shoppingcart;

import java.sql.*;

public class DbConnection {
    private String dbURL = "jdbc:mysql://localhost/shoppingcart";
    private String username = "root";
    private String password = "";
    private Connection connection;

    public DbConnection(){
        try{

            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL,username,password);
            if(connection!=null){
                System.out.println("Success");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public Connection getConnection(){
        return connection;
    }

    public void insertRecord(String name){
        try{
            String sqlQuery = "INSERT INTO items (Name) VALUES (?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, name);

            int noOfRowsInserted = preparedStatement.executeUpdate();
            if(noOfRowsInserted>0){
                System.out.println(noOfRowsInserted + " rows inserted");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet fetchRecord(String name){
        try{
            String sqlQuery = "SELECT items.Name, items.price FROM items where items.Name=(?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, name);
            ResultSet result = preparedStatement.executeQuery(sqlQuery);

            return result;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
