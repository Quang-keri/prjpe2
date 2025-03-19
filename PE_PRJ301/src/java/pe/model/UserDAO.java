/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import pe.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class UserDAO {
    private final static String LOGIN="SELECT name FROM  tblUser WHERE username = ? and password =?";
    
      public UserDTO checkLogin(String userName,String password) throws SQLException{
          UserDTO user  =null;
          Connection conn=null;
           PreparedStatement ptm =null;
           ResultSet rs =null;
          try{
             conn=DBUtils.getConnection();
             if(conn !=  null){
                 ptm =conn.prepareStatement(LOGIN);
                 ptm.setString(1, userName);
                 ptm.setString(2, password);
                 rs=ptm.executeQuery();
                 if(rs.next()){
                     String name =rs.getString("name");
                     user  =new UserDTO(userName,name,password);
                 }
             }
          }catch(Exception e){
              
          }finally{
              if(rs != null)rs.close() ;
              if(ptm != null)ptm.close();
              if(conn != null)conn.close();
          }
          
          return  user;          
      }
     
}
