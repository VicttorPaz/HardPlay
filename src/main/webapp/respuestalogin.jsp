<%@ page import="com.usuarios.seguridad.Usuario" %>
<%@ page import="com.usuarios.datos.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    String userParam = request.getParameter("username");
    String passParam = request.getParameter("password");

    if (userParam == null || userParam.trim().isEmpty() || 
        passParam == null || passParam.trim().isEmpty()) {
        
        response.sendRedirect("login.jsp?error=Por+favor+escribe+tu+usuario+y+contrasenia");
        return;
    }

    Conexion con = new Conexion();
    Connection c = null;
    PreparedStatement pr = null;
    ResultSet rs = null;

    String sql = "SELECT * FROM tb_usuarios WHERE username = ? AND password = ?";

    try {
        c = con.getConexion();
        if (c == null) {
            response.sendRedirect("login.jsp?error=Error+de+conexion+con+la+base+de+datos");
            return;
        }

        pr = c.prepareStatement(sql);
        pr.setString(1, userParam.trim());
        pr.setString(2, passParam.trim());
        rs = pr.executeQuery();

        if (rs.next()) {
            String usernameBD = rs.getString("username");
            String avatarBD = rs.getString("avatar");
            
            int rolBD = 2; 
            try { rolBD = rs.getInt("id_per"); } catch (Exception e) { rolBD = 2; }
            if (rolBD == 0) { rolBD = 2; } 

            String estadoBD = "ACTIVO";
            try { estadoBD = rs.getString("estado"); } catch (Exception e) { estadoBD = "ACTIVO"; }
            if (estadoBD == null) { estadoBD = "ACTIVO"; }

            if ("BLOQUEADO".equalsIgnoreCase(estadoBD)) {
                response.sendRedirect("login.jsp?error=Tu+cuenta+ha+sido+bloqueada");
                return;
            }

            HttpSession sesionActiva = request.getSession(true);
            sesionActiva.setAttribute("usuarioLogueado", usernameBD);
            sesionActiva.setAttribute("avatarUsuario", avatarBD);
            sesionActiva.setAttribute("avatarLogueado", avatarBD);
            sesionActiva.setAttribute("rolLogueado", rolBD);
            
            try {
                Usuario bitacoraHelper = new Usuario();
                bitacoraHelper.registrarAccionBitacora(usernameBD, "Inició sesión en el sistema");
            } catch (Exception e) {}

            if (rolBD == 1) {
                response.sendRedirect("adminpanel.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
            return;

        } else {
            response.sendRedirect("login.jsp?error=Usuario+o+contrasenia+incorrectos");
            return;
        }

    } catch (Exception ex) {
        response.sendRedirect("login.jsp?error=Error+interno+del+servidor");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (pr != null) pr.close(); } catch (Exception e) {}
        try { if (c != null) c.close(); } catch (Exception e) {}
    }
%>