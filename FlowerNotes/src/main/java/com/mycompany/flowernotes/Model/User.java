/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flowernotes.Model;

/**
 *
 * @author karen
 */
public class User {

    private int ID;
    private String Nombre;
    private String Apellidos;
    private String FechaNac;
    private String Correo;
    private String Foto;
    private String username;
    private String Contraseña;
    private int Edad;

    public User() {
    }

    public User(int ID) {
        this.ID = ID;
    }

    public User(String Nombre, String Apellidos, String FechaNac, String Correo, String Foto, String username, String Contraseña) {
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.FechaNac = FechaNac;
        this.Correo = Correo;
        this.Foto = Foto;
        this.username = username;
        this.Contraseña = Contraseña;
    }

    public User(int ID, String Nombre, String Apellidos, String FechaNac, String Correo, String Foto, String username, String Contraseña) {
        this.ID = ID;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.FechaNac = FechaNac;
        this.Correo = Correo;
        this.Foto = Foto;
        this.username = username;
        this.Contraseña = Contraseña;
    }

    public User(int ID, String Nombre, String Apellidos, String FechaNac, String Correo, String Foto, String username, String Contraseña, int Edad) {
        this.ID = ID;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.FechaNac = FechaNac;
        this.Correo = Correo;
        this.Foto = Foto;
        this.username = username;
        this.Contraseña = Contraseña;
        this.Edad = Edad;
    }

    public User(String username, String Contraseña) {
        this.username = username;
        this.Contraseña = Contraseña;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getFechaNac() {
        return FechaNac;
    }

    public void setFechaNac(String FechaNac) {
        this.FechaNac = FechaNac;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    public int getEdad() {
        return Edad;
    }

    public void setEdad(int Edad) {
        this.Edad = Edad;
    }

}
