package newpackage;

import java.sql.*;


public class ConnectionPro {
    public static Connection con;
    
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql:///member","root","annu11");
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}