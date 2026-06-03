<%@ page import="com.usuarios.seguridad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    request.setCharacterEncoding("UTF-8");

    String avatar = request.getParameter("avatar");
    String username = request.getParameter("txtNombre");
    String password = request.getParameter("txtClave");
    String parentEmail = request.getParameter("txtEmail");

    String mensajeRegistro = "";
    boolean todoOk = true;

    // 1. Validación de campos obligatorios vacíos
    if (avatar == null || avatar.trim().isEmpty() ||
        username == null || username.trim().isEmpty() ||
        password == null || password.trim().isEmpty() ||
        parentEmail == null || parentEmail.trim().isEmpty()) {
        
        todoOk = false;
        mensajeRegistro = "Error: ¡Faltan datos obligatorios! Todos los campos del formulario deben estar llenos.";
    } 
    // 2. Validación de formato de correo
    else if (!parentEmail.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
        todoOk = false;
        mensajeRegistro = "Error: El formato del correo electrónico ingresado no es válido.";
    }
    // 3. CORRECCIÓN RÚBRICA: Validación de longitud de clave (Mínimo 8 caracteres)
    else if (password.length() < 8) {
        todoOk = false;
        mensajeRegistro = "Error: La contraseña secreta debe tener un mínimo de 8 caracteres.";
    }

    if (todoOk) {
        Usuario verificador = new Usuario();
        String estadoValidacion = verificador.verifyuser(parentEmail, username);
        
        if (!"OK".equals(estadoValidacion)) {
            todoOk = false;
            mensajeRegistro = estadoValidacion;
            verificador.registrarAccionBitacora(username != null ? username : "Anónimo", "Intento de registro fallido - Datos Duplicados");
        } else {
            Usuario nuevoUsuario = new Usuario(avatar, username, password, parentEmail);
            mensajeRegistro = nuevoUsuario.ingresarCliente();
            
            if (mensajeRegistro != null && mensajeRegistro.equalsIgnoreCase("Inserción correcta")) {
                HttpSession sesionActiva = request.getSession(true);
                sesionActiva.setAttribute("usuarioLogueado", username);
                sesionActiva.setAttribute("rolLogueado", 2);
                
                // CORRECCIÓN ERROR 500: Guardar el avatar en la sesión para que index.jsp lo lea sin problemas
                sesionActiva.setAttribute("avatarLogueado", avatar); 
                
                verificador.registrarAccionBitacora(username, "Se registró exitosamente en el sistema como estudiante");
            } else {
                todoOk = false;
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Estado de tu Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
     <%@ include file="asistente.jsp" %>
   <script src="accesibilidad.js"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #e8f4fd;
        }
    </style>
</head>
<body class="d-flex align-items-center min-vh-100 py-5">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-10 col-md-8 col-lg-6">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="card-body p-5 text-center">

                        <% if (todoOk) { %>
                            <div class="text-success mb-4" style="font-size: 4.5rem;">
                                <i class="bi bi-check-circle-fill"></i>
                            </div>
                            <h2 class="fw-bold text-success">¡Registro Completado con Éxito!</h2>
                            <p class="text-muted mb-4">Tu cuenta ha sido verificada.</p>

                            <div class="bg-light p-3 rounded-3 text-start mb-4">
                                <h6 class="fw-bold text-secondary mb-3"><i class="bi bi-card-text me-2"></i>Tus Datos de Héroe:</h6>
                                <p class="mb-1"><strong>Súper Apodo:</strong> <span class="text-primary"><%= username %></span></p>
                                <p class="mb-0"><strong>Contacto de Seguridad:</strong> <span class="text-dark"><%= parentEmail %></span></p>
                            </div>

                            <a href="index.jsp" class="btn btn-primary btn-lg w-100 rounded-3 fw-bold shadow-sm">
                                ¡Comenzar la Aventura! <i class="bi bi-arrow-right-short"></i>
                            </a>

                        <% } else { %>
                            <div class="text-danger mb-4" style="font-size: 4.5rem;">
                                <i class="bi bi-exclamation-triangle-fill"></i>
                            </div>
                            <h2 class="fw-bold text-danger">¡Oh no! Hubo un inconveniente</h2>
                            
                            <div class="alert alert-danger rounded-3 text-start my-4" role="alert">
                                <i class="bi bi-x-circle-fill me-2"></i><strong>Detalle del error:</strong><br>
                                <span class="d-block mt-1"><%= mensajeRegistro %></span>
                            </div>

                            <p class="text-muted">Esto pasa si los datos (apodo o correo) ya pertenecen a otra cuenta, la clave es muy corta o si el formato es incorrecto.</p>

                            <a href="register.jsp" class="btn btn-outline-danger btn-lg w-100 rounded-3 fw-bold mt-2">Intentarlo de Nuevo</a>
                        <% } %>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>