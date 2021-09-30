/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flowernotes.DAO;

import com.mycompany.flowernotes.Model.User;
import com.mycompany.flowernotes.Util.DbConnectionn;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author karen
 */
public class UserDAO {
        
    public static int RegistrarUsuario(User user){
       Connection con = null;
        try{
             con = DbConnectionn.getConnection();
             // Esta linea prepara la llamada a la base de datos para insertar
             // Cada ? significa un valor a ser remplazado
            String sql = "call SP_User(?,?,?,?,?,?,?,?,?)";
            CallableStatement statement = con.prepareCall(sql);
                
            statement.setString(1, "I"); // Remplazamos el primer parametro por la opción del procedure
            statement.setInt(2,0);  //ID
            statement.setString(3, user.getNombre()); // El tercero por la nombres  
            statement.setString(4, user.getApellidos());
            statement.setString(5, user.getFechaNac());
            statement.setString(6, user.getCorreo());
            statement.setString(7, user.getFoto()); // El septimo por la url de la imagen
            statement.setString(8, user.getUsername());          
            statement.setString(9, user.getContraseña());// El noveno por la contraseña        

 
       // con.close();
         return statement.executeUpdate();//Retorna un entero
        }
        catch (SQLException ex) {
         System.out.println(ex.getMessage());
        }
              finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
        }
        return 0;
       
    
    }
  
    Connection con;
    PreparedStatement ps;
    CallableStatement cs;
    ResultSet rs;
    User usu = null;

    public User identificar(User user) {
         Connection con = null;
       
        try {
             con = DbConnectionn.getConnection();
              String sql = "call SP_Login(?,?)";
              CallableStatement statement = con.prepareCall(sql);
            cs = con.prepareCall(sql);
            cs.setString(1, user.getUsername());
            cs.setString(2, user.getContraseña());
            rs = cs.executeQuery();
            if (rs.next() == true) {
                usu = new User();
               
                usu.setUsername(user.getUsername());
                usu.setContraseña(user.getContraseña());
                 int id = rs.getInt(1);
                String username = rs.getString(2);
                String file = rs.getString(3);
                String nombre = rs.getString (4);
                String apellido = rs.getString (5);
                int Edad = rs.getInt (6);
                String Correo = rs.getString (7);
                String contraseña = rs.getString (8);
                String FechaNac = rs.getString (9);
  
                return new User(id, nombre,apellido,FechaNac,Correo,file,username,contraseña,Edad);
            }
        }       catch (SQLException ex) {
         System.out.println(ex.getMessage());
        }
                  finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
            }
        return usu;
    }
    
    
    
      public static User GetUser (int ID){
     Connection con = null;
            try{
             con = DbConnectionn.getConnection();
             // Esta linea prepara la llamada a la base de datos para insertar
             // Cada ? significa un valor a ser remplazado
         String sql = "call SP_User(?,?,?,?,?,?,?,?,?)";
            CallableStatement statement = con.prepareCall(sql);
                
            statement.setString(1, "S"); // Remplazamos el primer parametro por la opción del procedure
            statement.setInt(2,ID);  //ID
            statement.setString(3, "0"); // El tercero por la nombres  
            statement.setString(4, "0");
            statement.setString(5,"0");
            statement.setString(6, "0");
            statement.setString(7, "0"); // El septimo por la url de la imagen
            statement.setString(8, "0");          
            statement.setString(9, "0");// El noveno por la contraseña       
            ResultSet resultset = statement.executeQuery();
            while(resultset.next()) { //Mientras el resultSet tenga algo
                int id = resultset.getInt(1);
                String Nombre = resultset.getString(2);
                String Apellido = resultset.getString(3);
                String Fecha = resultset.getString (4);
                String Correo = resultset.getString (5);
                String Foto = resultset.getString (6);
                String username = resultset.getString (7);
                String contraseña = resultset.getString (8);
                int Edad = resultset.getInt (9);
                return new User(id, Nombre,Apellido,Fecha,Correo,Foto,username,contraseña,Edad);
                //return new User (id,username,file);
            }
        }
             catch (SQLException ex) {
         System.out.println(ex.getMessage());
        }
                  finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
            }
        return null;
            
    }

private static void executeQuery() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

