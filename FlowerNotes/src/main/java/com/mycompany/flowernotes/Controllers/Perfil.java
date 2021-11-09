/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flowernotes.Controllers;

import com.mycompany.flowernotes.DAO.EtiquetaDAO;
import com.mycompany.flowernotes.DAO.NotaDAO;
import com.mycompany.flowernotes.DAO.UserDAO;
import com.mycompany.flowernotes.Model.Etiquetas;
import com.mycompany.flowernotes.Model.Nota;
import com.mycompany.flowernotes.Model.User;
import com.mycompany.flowernotes.Util.FileUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author monic
 */
@WebServlet(name = "Perfil", urlPatterns = {"/Perfil"})
public class Perfil extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //USUARIO (sesion actual)
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuarioID");
        int ID = user.getID();
        //Muestra la información del usuario

        user = UserDAO.GetUser(ID);
        request.setAttribute("usuario", user);
        
             //Muestra las etiquetas
        List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        request.setAttribute("hashtags", hashtags);

        
        request.getRequestDispatcher("PerfilUsuario.jsp").forward(request, response);
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
