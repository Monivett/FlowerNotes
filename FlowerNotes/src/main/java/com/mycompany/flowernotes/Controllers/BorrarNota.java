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
@WebServlet(name = "BorrarNota", urlPatterns = {"/BorrarNota"})
public class BorrarNota extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Agarra el ID de la nota
        String stringID = request.getParameter("ID");
        int ID = Integer.parseInt(stringID, 10);
        String boole = request.getParameter("bool");

        if (boole.equals("true")) {
            NotaDAO.BorrarNota(ID);

            //USUARIO (sesion actual)
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("usuarioID");

            //Muestra las notas
            List<Nota> note = null;
            note = NotaDAO.MuestraNotas(user);
            request.setAttribute("Notas", note);

            request.getRequestDispatcher("PaginaPrincipal.jsp").forward(request, response);

        }else{

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

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
