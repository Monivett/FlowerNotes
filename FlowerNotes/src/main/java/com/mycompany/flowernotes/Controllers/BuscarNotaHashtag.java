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
@WebServlet(name = "BuscarNotaHashtag", urlPatterns = {"/BuscarNotaHashtag"})
public class BuscarNotaHashtag extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //USUARIO (sesion actual)
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuarioID");

        //Obtenemos el id de la etiqueta
        int ID = Integer.parseInt(request.getParameter("id"), 10);
        request.setAttribute("navegacion", ID);
        //TODAS LAS NOTAS ENCONTRADAS 
        List<Nota> notesTotal = null;
        notesTotal = NotaDAO.BuscarNotaHASHTotal(user, ID);
        request.setAttribute("TotalNotas", notesTotal);

        request.setAttribute("navegacion", ID);

        // NOTAS ENCONTRADAS PAGINACIÓN
        List<Nota> notes = null;
        notes = NotaDAO.BuscarNotaHASH(user, ID, 1);
        request.setAttribute("Notas", notes);

        //Muestra las etiquetas
        List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        request.setAttribute("hashtags", hashtags);

        request.getRequestDispatcher("BuscarNotaEtiqueta.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String spageid = request.getParameter("page");
        int pageid = Integer.parseInt(spageid);

        int total = 10;
        if (pageid == 1) {
        } else {
            pageid = pageid - 1;
            pageid = pageid * total + 1;
        }

        //USUARIO (sesion actual)
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuarioID");

        //Obtenemos el id de la etiqueta
        String hasID = request.getParameter("buscar");
        int ID = Integer.parseInt(hasID);
        request.setAttribute("navegacion", ID);

        //TODAS LAS NOTAS ENCONTRADAS 
        List<Nota> notesTotal = null;
        notesTotal = NotaDAO.BuscarNotaHASHTotal(user, ID);
        request.setAttribute("TotalNotas", notesTotal);

        request.setAttribute("navegacion", ID);

        // NOTAS ENCONTRADAS PAGINACIÓN
        List<Nota> notes = null;
        notes = NotaDAO.BuscarNotaHASH(user, ID, pageid);
        request.setAttribute("Notas", notes);

        //Muestra las etiquetas
        List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        request.setAttribute("hashtags", hashtags);

        request.getRequestDispatcher("BuscarNotaEtiqueta.jsp").forward(request, response);
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
