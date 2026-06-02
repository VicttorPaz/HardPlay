<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.usuarios.datos.Conexion" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    // Validar sesión de administrador
    HttpSession sesion = request.getSession(false);
    String adminActual = (sesion != null) ? (String) sesion.getAttribute("usuarioLogueado") : "Admin";
    
    String tipoAccion = request.getParameter("accion");
    String txtNombre = request.getParameter("txtNombre");
    String txtClave = request.getParameter("txtClave");
    String txtEmail = request.getParameter("txtEmail");
    String txtAvatar = request.getParameter("txtAvatar");

    Conexion con = new Conexion();
    Connection c = con.getConexion();

    if (c != null && tipoAccion != null && txtNombre != null) {
        try {
            c.setAutoCommit(false); // Transacción segura

            if (tipoAccion.equals("crear")) {
                // 1. INSERTAR NUEVO USUARIO (id_per = 2 significa Estudiante, estado por defecto 'ACTIVO')
                String sqlIns = "INSERT INTO tb_usuarios (username, password, parent_email, avatar, id_per, estado) VALUES (?, ?, ?, ?, 2, 'ACTIVO')";
                try (PreparedStatement pr = c.prepareStatement(sqlIns)) {
                    pr.setString(1, txtNombre.trim());
                    pr.setString(2, txtClave.trim());
                    pr.setString(3, txtEmail.trim());
                    pr.setString(4, txtAvatar != null ? txtAvatar : "robot");
                    pr.executeUpdate();
                }
                // Bitácora del Insert
                String sqlBit = "INSERT INTO bitacora (usuario_apodo, accion) VALUES (?, ?)";
                try (PreparedStatement prB = c.prepareStatement(sqlBit)) {
                    prB.setString(1, adminActual);
                    prB.setString(2, "El Administrador CREÓ un nuevo estudiante de forma manual: @" + txtNombre);
                    prB.executeUpdate();
                }

            } else if (tipoAccion.equals("actualizar")) {
                // 2. ACTUALIZAR INFORMACIÓN
                String sqlUpd = "UPDATE tb_usuarios SET password = ?, parent_email = ? WHERE username = ?";
                try (PreparedStatement pr = c.prepareStatement(sqlUpd)) {
                    pr.setString(1, txtClave.trim());
                    pr.setString(2, txtEmail.trim());
                    pr.setString(3, txtNombre.trim());
                    pr.executeUpdate();
                }
                // Bitácora del Update
                String sqlBit = "INSERT INTO bitacora (usuario_apodo, accion) VALUES (?, ?)";
                try (PreparedStatement prB = c.prepareStatement(sqlBit)) {
                    prB.setString(1, adminActual);
                    prB.setString(2, "El Administrador ACTUALIZÓ los datos de acceso de: @" + txtNombre);
                    prB.executeUpdate();
                }

            } else if (tipoAccion.equals("cambiarEstado")) {
                // 3. BLOQUEAR / DESBLOQUEAR USUARIO
                String estadoActual = request.getParameter("estadoActual");
                String nuevoEstado = "ACTIVO".equalsIgnoreCase(estadoActual) ? "BLOQUEADO" : "ACTIVO";
                
                String sqlState = "UPDATE tb_usuarios SET estado = ? WHERE username = ?";
                try (PreparedStatement pr = c.prepareStatement(sqlState)) {
                    pr.setString(1, nuevoEstado);
                    pr.setString(2, txtNombre.trim());
                    pr.executeUpdate();
                }
                // Bitácora del Bloqueo
                String sqlBit = "INSERT INTO bitacora (usuario_apodo, accion) VALUES (?, ?)";
                try (PreparedStatement prB = c.prepareStatement(sqlBit)) {
                    prB.setString(1, adminActual);
                    prB.setString(2, "El Administrador cambió el estado de @" + txtNombre + " a: " + nuevoEstado);
                    prB.executeUpdate();
                }
            }

            c.commit(); // Confirmar cambios en PostgreSQL
        } catch (SQLException e) {
            try { c.rollback(); } catch(Exception ex){}
            System.out.println("Error en el CRUD del Administrador: " + e.getMessage());
        } finally {
            try { c.close(); } catch(Exception e){}
        }
    }

    // Regresar de golpe al panel de control con la vista fresca
    response.sendRedirect("adminpanel.jsp");
%>