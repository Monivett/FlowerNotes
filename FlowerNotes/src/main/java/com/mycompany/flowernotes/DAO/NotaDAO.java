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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author monic
 */
public class NotaDAO {

    //Inserta la nota
    public static int InsertarNota(Nota note) {
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();

            String sql = "CALL SP_Notas(?, ?, ?, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "I");
            statement.setInt(2, 0); //ID
            statement.setString(3, note.getNota());
            statement.setInt(4, note.getUser().getID());

            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }

    //Muestra la última nota creada
    public static Nota getLastNota() {

        Connection con = null;
        try {
            con = DbConnectionn.getConnection();

            String sql = "CALL SP_Notas(?, ?, ?, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "A");
            statement.setInt(2, 0); //ID
            statement.setString(3, "0");
            statement.setInt(4, 0);
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt(1);

                return new Nota(id);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;

    }

    //Le inserta las etiquetas a la nota creada
    public static int InsertarEtiquetasNota(int idNota, int idHashtag) {
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();

            String sql = "CALL SP_Notas_Etiqueta(?, ?, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "I");
            statement.setInt(2, idNota); //ID
            statement.setInt(3, idHashtag);

            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }

    //Muestra todas las notas del usuario
    public static List<Nota> MuestraNotas(User user) {
        List<Nota> hashtag = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();
            String sql = "call SP_Notas(?,?,?,?)";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "S"); // Remplazamos el primer parametro por la opción del procedure
            statement.setInt(2, 0);
            statement.setString(3, "0"); // El tercero por la nombres  
            statement.setInt(4, user.getID()); // El cuarto por el id del usuario 
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt(1);
                String nota = result.getString(2);
                String fecha = result.getString(3);
                int userid = result.getInt(4);
                User usuario = UserDAO.GetUser(userid);
                hashtag.add(new Nota(id, nota, fecha, usuario));
            }

            return hashtag;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return hashtag;
    }

    //Muestra todas las notas en base su ID
    public static Nota MuestraNotasID(int ID) {
        List<Nota> hashtag = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();
            String sql = "call SP_Notas(?,?,?,?)";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "B"); // Remplazamos el primer parametro por la opción del procedure
            statement.setInt(2, ID);
            statement.setString(3, "0"); // El tercero por la nombres  
            statement.setInt(4, 0); // El cuarto por el id del usuario 
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt(1);
                String nota = result.getString(2);
                String fecha = result.getString(3);
                int userid = result.getInt(4);
                User usuario = UserDAO.GetUser(userid);

                return new Nota(id, nota, fecha, usuario);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    //Edita la Nota
    public static int EditarNota(String nota, int ID) {
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();

            String sql = "CALL SP_Notas(?, ?, ?, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "U");
            statement.setInt(2, ID); //ID
            statement.setString(3, nota);
            statement.setInt(4,0);

            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
     //Borra las etiquetas a la nota creada   
      public static int BorrarEtiquetasNota(int idNota) {
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();

            String sql = "CALL SP_Notas_Etiqueta(?, ?, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "U");
            statement.setInt(2, idNota); //ID
            statement.setInt(3, 0);

            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
      
       //Borra la nota
      public static int BorrarNota(int idNota) {
        Connection con = null;
        try {
            con = DbConnectionn.getConnection();

            String sql = "CALL SP_Notas(?, ?, ?,?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "D");
            statement.setInt(2, idNota); //ID
            statement.setString(3, "");
             statement.setInt(4, 0);

            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }

}
