package com.usuarios.seguridad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexionUsuario {
	
	private Statement St; 
    private String driver;
    private String user;
    private String pwd;
    private String cadena;
    private Connection con;

    String getDriver() {
        return this.driver;
    }

    String getUser() {
        return this.user;
    }

    String getPwd() {
        return this.pwd;
    }

    String getCadena() {
        return this.cadena;
    }
    public Connection getConexion() { 
        return this.con; 
    }
    public ConexionUsuario() {
        this.driver = "org.postgresql.Driver";
        this.user = "postgres";
        this.pwd = "1234";
        this.cadena = "jdbc:postgresql://localhost:5432/bd_hardware";
        this.con = this.crearConexion();
    }

    Connection crearConexion() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            Class.forName(getDriver()).newInstance();
            Connection con = DriverManager.getConnection(getCadena(), getUser(), getPwd());
            return con;
        } catch(Exception ee) {
            System.out.println("Error: " + ee.getMessage());
            return null;
        }
    }
    public String Ejecutar(String sql) {
        try (Connection con = getConexion(); Statement st = con.createStatement()) {
            int filas = st.executeUpdate(sql);
            return filas > 0 ? "Insertado correctamente" : "No se insertó ningún registro";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
    public ResultSet Consulta(String sql) {
        String error = "";
        ResultSet reg = null;
        try {
            St = getConexion().createStatement();
            reg = St.executeQuery(sql);
        } catch(Exception ee) {
            System.out.println("Error en Consulta(): " + ee.getMessage());
        }
        return reg;
    }


}