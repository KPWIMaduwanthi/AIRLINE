
package dao;
import javax.swing.JOptionPane;
import model.User;
import java.sql.*;
public class UserDao {
    public static void save(User user){
        String query = "insert into user (name,email,mobileNumber,address,password,securityQuestion,answer,status) values('"+user.getName()+"','"+user.getEmail()+"','"+user.getMobileNumber()+"','"+user.getAddress()+"','"+user.getPassword()+"','"+user.getSecurityQuestion()+"','"+user.getAnswer()+"','false')";
        DbOperations.setDataOrDelete(query, "Registerd Successfully ! Wait For Admin Approval");
    }
    
    public static User login(String email,String password){
        User user = null;
        try{
            ResultSet rs = DbOperations.getData("select *from user where email='"+email+"' and password='"+password+"'");
            while(rs.next()){
                user = new User();
                user.setStatus(rs.getString("status"));
            }
        } 
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
        return user;
    }
}
