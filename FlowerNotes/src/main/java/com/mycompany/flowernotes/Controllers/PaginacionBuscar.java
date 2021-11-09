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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author monic
 */
@WebServlet(name = "PaginacionBuscar", urlPatterns = {"/PaginacionBuscar"})
public class PaginacionBuscar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             String spageid=request.getParameter("page");
        int pageid=Integer.parseInt(spageid);
       
        int total = 10;
        if(pageid==1){}
        else{
            pageid=pageid-1;
            pageid=pageid*total+1;
        }
        
        //Input nota
        String notaB = request.getParameter("buscar");
        request.setAttribute("navegacion", notaB);

        List<Nota> notes = null;
        notes = NotaDAO.BuscarNota(pageid, notaB);
        request.setAttribute("notasPaginadas", notes);

        List<Nota> TotalNotes = null;
        TotalNotes = NotaDAO.BuscarNotaTotal(notaB);
        request.setAttribute("TotalNotes", TotalNotes);

         //Muestra las etiquetas
        List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        request.setAttribute("hashtags", hashtags);
        
        
        request.getRequestDispatcher("Busqueda.jsp").forward(request, response);
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
