
package dao;

import javax.swing.JOptionPane;

public class tables {
    public static void main(String[] args){
        try{
            String userTable = "create table user (id int AUTO_INCREMENT primary key,name varchar(100),email varchar(100),mobileNumber varchar(10),address varchar(200),password varchar(20),securityQuestion varchar(200),answer varchar(100),status varchar(20),UNIQUE (email))";
            String adminDetails = "insert into user(name,email,mobileNumber,address,password,securityQuestion,answer,status) values('Admin','admin@gmail.com','0123456789','home','admin','Is admin at home','no','true')";
            DbOperations.setDataOrDelete(userTable, "User Table Created Successfully");
            DbOperations.setDataOrDelete(adminDetails, "Admin Details Aded successfully");
        }
        catch(Exception e){
           JOptionPane.showMessageDialog(null,e); 
        }
    }
    
}
