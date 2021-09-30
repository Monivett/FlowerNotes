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
public class Nota {

    private int id;
    private String Nota;
    private String Fecha;
    private User user;

    public Nota() {
    }

    public Nota(int id) {
        this.id = id;
    }

    public Nota(String Nota, User user) {
        this.Nota = Nota;
        this.user = user;
    }

    public Nota(int id, String Nota, String Fecha, User user) {
        this.id = id;
        this.Nota = Nota;
        this.Fecha = Fecha;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNota() {
        return Nota;
    }

    public void setNota(String Nota) {
        this.Nota = Nota;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
    
    

}
