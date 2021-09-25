/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flowernotes.Util;

/**
 *
 * @author karen
 */
public class FileUtils {
     public static String RUTE_USER_IMAGE = "assets/images";
    
    public static String GetExtension(String contentType) {
        switch (contentType) {
            case "image/png":
                return ".png";
            case "image/jpeg":
                return ".jpg";
          
        }
        return ".ext";
    }
}
