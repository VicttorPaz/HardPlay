<%@ page import="com.usuarios.seguridad.Usuario" %>
<%@ page import="com.usuarios.datos.Conexion" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Forzar codificación UTF-8
    request.setCharacterEncoding("UTF-8");

    // 1. Capturar las credenciales del formulario de login
    String userParam = request.getParameter("username");
    String passParam = request.getParameter("password");

    // Validar que no lleguen vacíos
    if (userParam == null || userParam.trim().isEmpty() || 
        passParam == null || passParam.trim().isEmpty()) {
        
        request.setAttribute("error", "¡Por favor, escribe tu usuario y contraseña secreta!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    Conexion con = new Conexion();
    PreparedStatement pr = null;
    ResultSet rs = null;

    // Buscamos al usuario por su apodo y contraseña exacta
    String sql = "SELECT username, avatar FROM tb_usuarios WHERE username = ? AND password = ?";

    try {
        if (con.getConexion() == null) {
            request.setAttribute("error", "Error: No hay conexión con el servidor central.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        pr = con.getConexion().prepareStatement(sql);
        pr.setString(1, userParam.trim());
        pr.setString(2, passParam.trim());

        rs = pr.executeQuery();

        if (rs.next()) {
            // ¡CREDENCIALES CORRECTAS!
            // Iniciamos la sesión del navegador
            HttpSession sesionActiva = request.getSession(true);
            
            // Guardamos sus datos para usarlos en todo el sitio web
            sesionActiva.setAttribute("usuarioLogueado", rs.getString("username"));
            sesionActiva.setAttribute("avatarUsuario", rs.getString("avatar"));
            
            // Redirigir directamente al Inicio del juego
            response.sendRedirect("index.jsp");
            return;
        } else {
            // Si no coincide, regresamos al login con un mensaje claro para el niño
            request.setAttribute("error", "❌ ¡Tu apodo o contraseña secreta no son correctos! Inténtalo otra vez.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

    } catch (Exception ex) {
        request.setAttribute("error", "Error en el sistema: " + ex.getMessage());
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } finally {
        // Cierre preventivo de flujos a la base de datos
        try {
            if (rs != null) rs.close();
            if (pr != null) pr.close();
        } catch (Exception e) {
            System.out.println("Error al cerrar recursos de login: " + e.getMessage());
        }
    }
%>