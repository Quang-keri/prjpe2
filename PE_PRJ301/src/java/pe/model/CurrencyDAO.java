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
import java.util.ArrayList;
import java.util.List;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import pe.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class CurrencyDAO {

    private final static String SEARCH = "SELECT code,name,description,rate FROM tblCurrency WHERE code like ? AND  name like ?";
      private final static String UPDATE = "UPDATE tblCurrency SET name=?,description=?,rate=? WHERE code=?";
    
  public boolean update(String code,String name,String  des,float rate) throws SQLException{
     boolean check=false;
       Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
      try{
          conn  =DBUtils.getConnection();
          if(conn != null){
              ptm=conn.prepareStatement(UPDATE);
              ptm.setString(1, name);
              ptm.setString(2, des);
              ptm.setFloat(3, rate);
              ptm.setString(4, code);
              check=ptm.executeUpdate() > 0? true:false;
          }
      }catch(Exception e){
          
      }finally{
           if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
      }
      
      
      return check;
  }
    public List<Currency> search(String code, String name) throws SQLException {
        List<Currency> currencyList = new ArrayList<>();//null
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1,"%"+code+"%");
                ptm.setString(2, "%"+name+"%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String codeCurr = rs.getString("code");
                    String nameCurr = rs.getString("name");
                    String des = rs.getString("description");
                    float rate = Float.parseFloat(rs.getString("rate"));
                    currencyList.add(new Currency(codeCurr, nameCurr, des, rate));
                }
                
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return currencyList;
    }
    public static void main(String[] args) throws SQLException {
        CurrencyDAO dao =new CurrencyDAO();
        boolean check=dao.update("EUR", "eur1 name", "des euro", (float)0.8925);
        System.out.println("check la"+check);
    }
    
}
   

