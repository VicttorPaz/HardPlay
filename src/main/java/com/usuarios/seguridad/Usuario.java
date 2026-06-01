package com.usuarios.seguridad;

import java.sql.PreparedStatement;
import com.usuarios.datos.Conexion;

public class Usuario {
    private int id;
    private String avatar;
    private String username;
    private String password;
    private String parentEmail;

    public Usuario() {}

    public Usuario(String avatar, String username, String password, String parentEmail) {
        this.avatar = avatar;
        this.username = username;
        this.password = password;
        this.parentEmail = parentEmail;
    }

    // --- MÉTODOS GET Y SET ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getParentEmail() { return parentEmail; }
    public void setParentEmail(String parentEmail) { this.parentEmail = parentEmail; }

  
    public String ingresarCliente() {
        String result = "";
        Conexion con = new Conexion();
        PreparedStatement pr = null;
        
        String sql = "INSERT INTO tb_usuarios (avatar, username, password, parent_email) VALUES (?, ?, ?, ?)";
        
        try {
            if (con.getConexion() == null) {
                return "Error: No hay conexión a la base de datos";
            }
            
            pr = con.getConexion().prepareStatement(sql);
            
  
            pr.setString(1, this.avatar);
            pr.setString(2, this.username);
            pr.setString(3, this.password);
            pr.setString(4, this.parentEmail);

            if (pr.executeUpdate() == 1) {
                result = "Inserción correcta";
            } else {
                result = "Error en inserción";
            }
        } catch (Exception ex) {
            result = "Error: " + ex.getMessage();
            System.out.println("Error en ingresarCliente: " + result);
        } finally {
            try {
                if (pr != null) pr.close();
               
            } catch (Exception ex) {
                System.out.println("Error al cerrar PreparedStatement: " + ex.getMessage());
            }
        }
        return result;
    }
}