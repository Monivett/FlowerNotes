/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flowernotes.Controllers;

import com.mycompany.flowernotes.DAO.UserDAO;
import com.mycompany.flowernotes.Model.User;

import com.mycompany.flowernotes.Util.FileUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author monic
 */
@WebServlet(name = "Registrar", urlPatterns = {"/Registrar"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 25)
public class Registrar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//Acentos

        String name = request.getParameter("inputName");
        String apellido = request.getParameter("inputApellido");
        String mail = request.getParameter("inputEmail");
        String contraseña = request.getParameter("inputPassword1");

        String username = request.getParameter("inputUsername");
        String nac = request.getParameter("inputDate");

        Part img = request.getPart("inputFoto");

        String path = request.getServletContext().getRealPath("");
        String contentType = img.getContentType();
        String nameImage = img.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType);
        String fullPath = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage;
        img.write(fullPath);

        User User = new User(name, apellido, nac, mail, FileUtils.RUTE_USER_IMAGE + "/" + nameImage, username, contraseña);

        UserDAO.RegistrarUsuario(User);

        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
