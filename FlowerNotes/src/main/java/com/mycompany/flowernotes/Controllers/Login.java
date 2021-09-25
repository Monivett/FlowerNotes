/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flowernotes.Controllers;

import com.google.gson.Gson;
import com.mycompany.flowernotes.DAO.UserDAO;
import com.mycompany.flowernotes.Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
       
        PrintWriter out = response.getWriter();
       
            out.print(login(request));
     
        out.flush();
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    private String login(HttpServletRequest request) {

        HashMap resutado = new HashMap();
          String username = request.getParameter("username");
        //Password
        String pass = request.getParameter("password");

        User user = new User(username, pass);
       UserDAO userDao = new UserDAO();
        user = userDao.identificar(user);
        String json;
        HttpSession session;
        if (user != null) {
            session = request.getSession();
            session.setAttribute("Nombre",user.getNombre());
            session.setAttribute("Apellido",user.getApellidos());
            session.setAttribute("Correo",user.getCorreo());
         
            session.setAttribute("FechaNac",user.getFechaNac());
         
            session.setAttribute("username",user.getUsername());
            session.setAttribute("ID_Usuario", user.getID());
            session.setAttribute("Foto", user.getFoto());
            session.setAttribute("Contraseña", user.getContraseña());
            session.setAttribute("usuarioID", user);  //Guardamos la información del usuario en usuarioID
           
            resutado.put("usuario", user);
            resutado.put("Respuesta", true);
            json = new Gson().toJson(resutado);

        } else {
            resutado.put("Respuesta", false);
            json = new Gson().toJson(resutado);
        }
        return json;
    }

}
