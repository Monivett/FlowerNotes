/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flowernotes.Controllers;

import com.mycompany.flowernotes.DAO.EtiquetaDAO;
import com.mycompany.flowernotes.DAO.UserDAO;
import com.mycompany.flowernotes.Model.Etiquetas;
import com.mycompany.flowernotes.Model.User;
import com.mycompany.flowernotes.Util.FileUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author karen
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 25)
@WebServlet(name = "EditarPerfil", urlPatterns = {"/EditarPerfil"})
public class EditarPerfil extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //USUARIO (sesion actual)
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuarioID");
        int ID = user.getID();
        
         //Muestra las etiquetas
        List<Etiquetas> hashtags = null;
        hashtags = EtiquetaDAO.getEtiquetas();
        request.setAttribute("hashtags", hashtags);
        
        
        //Muestra la información del usuario

        user = UserDAO.GetUser(ID);
        request.setAttribute("usuario", user);
        request.getRequestDispatcher("EditarPerfil.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//Acentos
        //USUARIO (sesion actual)
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuarioID");
        int ID = user.getID();

        String name = request.getParameter("inputName");
        String apellido = request.getParameter("inputApellido");
        String mail = request.getParameter("inputEmail");
        String contraseña = request.getParameter("inputPassword1");

        String nac = request.getParameter("inputDate");

        Part img = request.getPart("inputFoto");

        String path = request.getServletContext().getRealPath("");
        String contentType = img.getContentType();
        String nameImage = img.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType);
        String fullPath = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage;
        img.write(fullPath);

        User User = new User(ID, name, apellido, nac, mail, FileUtils.RUTE_USER_IMAGE + "/" + nameImage, null, contraseña);

        UserDAO.EditarUsuario(User);

        user = UserDAO.GetUser(ID);
        request.setAttribute("usuario", user);
        
         //Volvemos a mostrar los datos del usuario que inició sesión
     
 
            session =  request.getSession();
            session = request.getSession();
            session.setAttribute("Nombre", user.getNombre());
            session.setAttribute("Apellido", user.getApellidos());
            session.setAttribute("Correo", user.getCorreo());

            session.setAttribute("FechaNac", user.getFechaNac());

            session.setAttribute("username", user.getUsername());
            session.setAttribute("ID_Usuario", user.getID());
            session.setAttribute("Foto", user.getFoto());
            session.setAttribute("Contraseña", user.getContraseña());
            session.setAttribute("usuarioID", user);  //Guardamos la información del usuario en usuarioID

        
        
        request.getRequestDispatcher("PerfilUsuario.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
