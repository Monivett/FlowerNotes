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
@WebServlet(name = "EditarNota", urlPatterns = {"/EditarNota"})
public class EditarNota extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//Acentos

        String nota = request.getParameter("inputNota");
        String stringID = request.getParameter("ID");
        int ID = Integer.parseInt(stringID, 10);
        //USUARIO (sesion actual)
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuarioID");

        //EDITA LA NOTA
        NotaDAO.EditarNota(nota, ID);
        
        
        //EDITA LAS ETIQUETAS DE LA NOTA
        List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        int i = 1;
          NotaDAO.BorrarEtiquetasNota(ID);
        for (Etiquetas tag : hashtags) {

            String stringEtiqueta = request.getParameter("hashtags" + i);
            if (stringEtiqueta != null) {
                int idEtiqueta = Integer.parseInt(stringEtiqueta, 10);              
                NotaDAO.InsertarEtiquetasNota(ID, idEtiqueta);
            }
            i++;
        }
        
        
        
        //Muestra las notas
        List<Nota> note = null;
        note = NotaDAO.MuestraNotas(user);
        request.setAttribute("Notas", note);

        request.getRequestDispatcher("PaginaPrincipal.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
