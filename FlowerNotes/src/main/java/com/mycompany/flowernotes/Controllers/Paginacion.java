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
@WebServlet(name = "Paginacion", urlPatterns = {"/Paginacion"})
public class Paginacion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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

        //Muestra las notas
        List<Nota> noteTotal = null;
        noteTotal = NotaDAO.MuestraNotas(user);
        request.setAttribute("TotalNotas", noteTotal);

        //Muestra solo 10 notas (paginación)
        List<Nota> note = null;
        note = NotaDAO.MuestraNotasPage(pageid, user);
        request.setAttribute("Notas", note);

         //Muestra las etiquetas
        List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        request.setAttribute("hashtags", hashtags);
        
        //Redirecciona a la página principal
        request.getRequestDispatcher("PaginaPrincipal.jsp").forward(request, response);

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
