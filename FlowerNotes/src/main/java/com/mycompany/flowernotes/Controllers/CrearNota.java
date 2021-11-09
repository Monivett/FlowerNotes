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

/**
 *
 * @author karen
 */
@WebServlet(name = "CrearNota", urlPatterns = {"/CrearNota"})
public class CrearNota extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        request.setAttribute("hashtags", hashtags);

        request.getRequestDispatcher("CrearNota.jsp").forward(request, response); //Em que JSP está el comboBox
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//Acentos

        String nota = request.getParameter("inputNota");

        //USUARIO (sesion actual)
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuarioID");

        //INSERTA LA NOTA
        Nota note = new Nota(nota, user);
        NotaDAO.InsertarNota(note);

        //INSERTA LAS ETIQUETAS DE LA NOTA
        List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        int i = 1;
        for (Etiquetas tag : hashtags) {

            String stringEtiqueta = request.getParameter("hashtags" + i);
            if (stringEtiqueta != null) {
                int idEtiqueta = Integer.parseInt(stringEtiqueta, 10);

                Nota idNota = NotaDAO.getLastNota();
                NotaDAO.InsertarEtiquetasNota(idNota.getId(), idEtiqueta);
            }
            i++;
        }

        //MOSTRAR NOTAS......................
        //Muestra las notas
        List<Nota> noteTotal = null;
        noteTotal = NotaDAO.MuestraNotas(user);
        request.setAttribute("TotalNotas", noteTotal);

        //Muestra solo 10 notas (paginación)
        List<Nota> noteS = null;
        noteS = NotaDAO.MuestraNotasPage(1, user);
        request.setAttribute("Notas", noteS);

        request.getRequestDispatcher("PaginaPrincipal.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
