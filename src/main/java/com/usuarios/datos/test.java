package com.usuarios.datos;

import java.sql.Connection;

public class test {
    public static void main(String[] args) {
        Conexion conObj = new Conexion();
        System.out.println("Intentando conectar a PostgreSQL...");
        
        Connection testCon = conObj.crearConexion();
        
        if (testCon != null) {
            System.out.println("------------------------------------");
            System.out.println("¡CONEXIÓN EXITOSA!");
            System.out.println("La base de datos respondió correctamente.");
            System.out.println("------------------------------------");
            try { testCon.close(); } catch (Exception e) {}
        } else {
            System.out.println("------------------------------------");
            System.out.println("ERROR: No se pudo establecer la conexión.");
            System.out.println("Revisa:");
            System.out.println("1. Que el servicio de PostgreSQL esté INICIADO.");
            System.out.println("2. Que el puerto sea el correcto (5432 o 5433).");
            System.out.println("3. Que la base de datos 'bd_productos' exista.");
            System.out.println("------------------------------------");
        }
    }
}