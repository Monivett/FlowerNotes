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
public class Etiquetas {
    private int ID;
    private String nombre;
     private int nota;

    public Etiquetas() {
    }

    public Etiquetas(int ID) {
        this.ID = ID;
    }

    public Etiquetas(String nombre) {
        this.nombre = nombre;
    }

    public Etiquetas(int ID, String nombre) {
        this.ID = ID;
        this.nombre = nombre;
    }

    public Etiquetas(String nombre, int nota) {
        this.nombre = nombre;
        this.nota = nota;
    }

  
    
    
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
       
}
