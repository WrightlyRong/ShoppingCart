package com.example.shoppingcart;
import java.sql.*;
import java.io.*;

public class uploadImages {
    public static void main(String[] args){
        try{

            DbConnection db = new DbConnection();
            Connection con = db.getConnection();
            String insertImageQuery = "INSERT INTO items(id,name,price,image) values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(insertImageQuery);

            ps.setInt(1,3);
            ps.setString(2,"Bed");
            ps.setInt(3,48000);

            FileInputStream fis = new FileInputStream("D:\\IdeaProjects\\ShoppingCart\\src\\main\\java\\com\\example\\shoppingcart\\bed.jpg");
            ps.setBinaryStream(4,fis,fis.available());
            ps.executeUpdate();

        }catch (Exception e){
            System.out.println(e);
        }
    }
}
