
package dao;
import java.sql.*;

public class ConnectionProvider {
    public static Connection getCon(){
        try{
            //if you receved database connection error plese remove // on the below code)
            //Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fbs?useSSL=false","root","sandaruwan1998");
            return con;
        }
        catch(Exception e){
            return null;
        }
    }
}
