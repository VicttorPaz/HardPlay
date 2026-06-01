<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" import="com.usuarios.seguridad.Usuario" %>

<%
    request.setCharacterEncoding("UTF-8");

    String avatar = request.getParameter("avatar");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String parentEmail = request.getParameter("parentEmail");

    String mensajeRegistro = "";
    boolean camposCompletos = true;

    if (avatar == null || avatar.trim().isEmpty() ||
        username == null || username.trim().isEmpty() ||
        password == null || password.trim().isEmpty() ||
        parentEmail == null || parentEmail.trim().isEmpty()) {
        
        camposCompletos = false;
        mensajeRegistro = "Error: ¡Faltan datos! Todos los campos obligatorios deben estar llenos.";
    }

    if (camposCompletos) {
        Usuario user = new Usuario(avatar, username, password, parentEmail);
        mensajeRegistro = user.ingresarCliente();
    }

    boolean esExitoso = camposCompletos && mensajeRegistro.equalsIgnoreCase("Inserción correcta");
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

                        <% if (esExitoso) { %>
                            <div class="text-success mb-4" style="font-size: 4.5rem;">
                                <i class="bi bi-check-circle-fill"></i>
                            </div>
                            <h2 class="fw-bold text-success">¡Registro Completado con Éxito!</h2>
                            <p class="text-muted mb-4">Tu cuenta ha sido guardada de forma segura en nuestro servidor de Base de Datos.</p>

                            <div class="bg-light p-3 rounded-3 text-start mb-4">
                                <h6 class="fw-bold text-secondary mb-3"><i class="bi bi-card-text me-2"></i>Tus Datos de Héroe:</h6>
                                <p class="mb-1"><strong>Súper Apodo:</strong> <span class="text-primary"><%= username %></span></p>
                                <p class="mb-1"><strong>Tu Avatar:</strong> <span class="text-capitalize text-dark"><%= avatar %></span></p>
                                <p class="mb-0"><strong>Contacto de Seguridad:</strong> <span class="text-dark"><%= parentEmail %></span></p>
                            </div>

                            <a href="login.jsp" class="btn btn-primary btn-lg w-100 rounded-3 fw-bold shadow-sm">Ir a Iniciar Sesión <i class="bi bi-arrow-right-short"></i></a>

                        <% } else { %>
                            <div class="text-danger mb-4" style="font-size: 4.5rem;">
                                <i class="bi bi-exclamation-triangle-fill"></i>
                            </div>
                            <h2 class="fw-bold text-danger">¡Oh no! Hubo un inconveniente</h2>
                            
                            <div class="alert alert-danger rounded-3 text-start my-4" role="alert">
                                <strong>Detalle del error:</strong><br>
                                <%= mensajeRegistro %>
                            </div>

                            <p class="text-muted">Esto puede pasar si el apodo ya está siendo usado por otro niño o si dejaste campos vacíos.</p>

                            <a href="register.jsp" class="btn btn-outline-danger btn-lg w-100 rounded-3 fw-bold mt-2">Intentarlo de Nuevo</a>
                        <% } %>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>