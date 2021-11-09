/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flowernotes.Controllers;

import com.mycompany.flowernotes.DAO.EtiquetaDAO;
import com.mycompany.flowernotes.DAO.NotaDAO;
import com.mycompany.flowernotes.Model.Etiquetas;
import com.mycompany.flowernotes.Model.Nota;
import com.mycompany.flowernotes.Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author monic
 */
@WebServlet(name = "NotaEsp", urlPatterns = {"/NotaEsp"})
public class NotaEsp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Agarra el ID de la nota
        int ID = Integer.parseInt(request.getParameter("id"), 10);

        //Muestra la nota
        Nota note = null;
        note = NotaDAO.MuestraNotasID(ID);
        request.setAttribute("Nota", note);
        
        //Muestra las etiquetas de la nota
        List<Etiquetas> hashtagNote = null;
        hashtagNote = EtiquetaDAO.MuestraEtiquetaNota(ID);
         request.setAttribute("EtiquetaNota", hashtagNote);
         
         //Muestra todas las etiquetas
          List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        request.setAttribute("hashtags", hashtags);

        
        request.getRequestDispatcher("NotaEsp.jsp").forward(request, response);

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
