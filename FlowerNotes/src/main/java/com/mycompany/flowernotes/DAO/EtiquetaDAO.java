/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flowernotes.DAO;

import com.mycompany.flowernotes.Model.Etiquetas;
import com.mycompany.flowernotes.Model.Nota;
import com.mycompany.flowernotes.Model.User;
import com.mycompany.flowernotes.Util.DbConnectionn;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author karen
 */
public class EtiquetaDAO {

    public static List<Etiquetas> getEtiquetas() {
        List<Etiquetas> hashtag = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();
            String sql = "call SP_Hashtags(?,?,?)";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "S"); // Remplazamos el primer parametro por la opción del procedure
            statement.setInt(2, 0);
            statement.setString(3, "0"); // El tercero por la nombres  
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt(1);
                String name = result.getString(2);
                hashtag.add(new Etiquetas(id, name));
            }

            return hashtag;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EtiquetaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return hashtag;
    }
    
     public static List<Etiquetas> getEtiquetasID(int ide) {
        List<Etiquetas> hashtag = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();
            String sql = "call SP_Hashtags(?,?,?)";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "A"); // Remplazamos el primer parametro por la opción del procedure
            statement.setInt(2, ide);
            statement.setString(3, "0"); // El tercero por la nombres  
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt(1);
                String name = result.getString(2);
                hashtag.add(new Etiquetas(id, name));
            }

            return hashtag;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EtiquetaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return hashtag;
    }
    
    

    public static List<Etiquetas> MuestraEtiquetaNota(int nota) {
        List<Etiquetas> hashtag = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();
            String sql = "call SP_Hashtags(?,?,?)";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "A"); // Remplazamos el primer parametro por la opción del procedure
            statement.setInt(2, nota);
            statement.setString(3, "0"); // El tercero por la nombres  
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                int note = result.getInt(1);
                String etiqueta = result.getString(2); 
                hashtag.add(new Etiquetas(etiqueta, note));
            }

            return hashtag;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EtiquetaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return hashtag;
    }

    private static void executeQuery() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
