<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.usuarios.seguridad.Usuario" %>
<%
    // 1. Buscamos si existe una sesión activa en el navegador
    HttpSession sesionNavbar = request.getSession(false);
    String apodoLogueado = null;
    String avatarLogueado = null;

    // 2. Si existe la sesión, extraemos los datos para personalizar el perfil
    if (sesionNavbar != null && sesionNavbar.getAttribute("usuarioLogueado") != null) {
        apodoLogueado = (String) sesionNavbar.getAttribute("usuarioLogueado");
        avatarLogueado = (String) sesionNavbar.getAttribute("avatarUsuario");
    }
%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Quiz</title>
    <link rel="stylesheet" href="style/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body>

    <header class="main-header">
        <div class="logo">
            <h2>Hard<span>Learn</span></h2>
        </div>
        <nav class="nav-bar">
            <ul>
                <li><a href="index.jsp">Inicio</a></li>

                 <li class="dropdown">
                    <a href="#">Partes del Computador <i class="bi bi-chevron-down" style="font-size: 0.8rem;"></i></a>
                    <div class="dropdown-content">
                        <a href="procesador.jsp"><i class="bi bi-cpu"></i> El Procesador</a>
                        <a href="ram.jsp"><i class="bi bi-memory"></i> Memoria RAM</a>
                        <a href="almacenamiento.jsp"><i class="bi bi-hdd-fill"></i> Almacenamiento</a>
                    </div>
                </li>

                <li><a href="laboratorio.jsp">Laboratorio 3D</a></li>
               
                <li><a href="quiz.jsp" class="active">Quiz</a></li>
            </ul>
             <% if (apodoLogueado != null) { %>
                <div class="user-profile-logged">
                    <div class="user-info-text">
                        <span class="user-welcome">¡Hola!</span>
                        <span class="user-nickname"><%= apodoLogueado %></span>
                    </div>
                    <div class="avatar-container-nav">
                        <img src="https://api.dicebear.com/7.x/bottts/svg?seed=<%= avatarLogueado.equals("gato") ? "cat" : avatarLogueado %>" alt="Avatar">
                    </div>
                    <div class="profile-dropdown-menu">
                        <a href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Salir del Juego</a>
                    </div>
                </div>
            <% } else { %>
                <a href="register.jsp" class="user-profile-icon" title="Mi Cuenta">
                    <i class="bi bi-person-circle"></i>
                </a>
            <% } %>
        </nav>
    </header>

    <main class="content-container">
        <section class="hero-section">
            <h1>Quiz de Evaluación</h1>
            <p>Pon a prueba lo aprendido sobre componentes informáticos básicos.</p>
        </section>
    </main>

    <footer class="main-footer">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware</p>
    </footer>

</body>
</html>