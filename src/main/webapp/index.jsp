<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.usuarios.seguridad.Usuario" %>
<%
    HttpSession sesionNavbar = request.getSession(false);
    String apodoLogueado = null;
    String avatarLogueado = null;

    if (sesionNavbar != null && sesionNavbar.getAttribute("usuarioLogueado") != null) {
        apodoLogueado = (String) sesionNavbar.getAttribute("usuarioLogueado");
        avatarLogueado = (String) sesionNavbar.getAttribute("avatarLogueado");
    }

    if (avatarLogueado == null) {
        avatarLogueado = "robot";
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - ¡Explora el Mundo de la Computación!</title>
    <link rel="stylesheet" href="style/style.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    
    <script src="js/accesibilidad.js"></script>
</head>
<body>

    <header class="main-header">
        <div class="logo">
            <h2>Hard<span>Learn</span></h2>
        </div>
        <nav class="nav-bar">
            <ul>
                <li><a href="index.jsp" class="active">Inicio</a></li>
                
                <li class="dropdown">
                    <a href="#">Partes del Computador <i class="bi bi-chevron-down" style="font-size: 0.8rem;"></i></a>
                    <div class="dropdown-content">
                        <a href="procesador.jsp"><i class="bi bi-cpu"></i> El Procesador</a>
                        <a href="ram.jsp"><i class="bi bi-memory"></i> Memoria RAM</a>
                        <a href="almacenamiento.jsp"><i class="bi bi-hdd-fill"></i> Almacenamiento</a>
                        <a href="grafica.jsp"><i class="bi bi-gpu-card"></i> Tarjeta Gráfica</a>
                        <a href="fuente.jsp"><i class="bi bi-lightning-charge-fill"></i> Fuente de Poder</a>
                        <a href="tarjetamadre.jsp"><i class="bi bi-controller"></i> Tarjeta Madre</a>
                    </div>
                </li>
                
                <li><a href="laboratorio.jsp">Laboratorio 3D</a></li>
                <li><a href="quiz.jsp">Quiz</a></li>
            </ul>
            
            <% if (apodoLogueado != null) { %>
                <div class="user-profile-logged">
                    <div class="user-info-text">
                        <span class="user-welcome">¡Hola!</span>
                        <span class="user-nickname"><%= apodoLogueado %></span>
                    </div>
                    <div class="avatar-container-nav">
                        <img src="https://api.dicebear.com/7.x/bottts/svg?seed=<%= "gato".equals(avatarLogueado) ? "cat" : avatarLogueado %>" alt="Avatar">
                    </div>
                    
                    <div class="profile-dropdown-menu">
                        <a href="perfil.jsp"><i class="bi bi-person-bounding-box"></i> Mi Perfil</a>
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

    <main class="content-container" id="main-content">
        
        <section class="hero-section">
            <h1>¡Conviértete en un Súper Experto de PC!</h1>
            <p>Descubre los secretos que esconde tu computadora. Explora sus piezas, interactúa con ellas y diviértete jugando.</p>
        </section>

        <section class="features-grid">
            
            <div class="feature-card section-3d">
                <div class="feature-icon">
                    <i class="bi bi-box-seam-fill"></i>
                </div>
                <h3>Laboratorio 3D</h3>
                <p>¡Gira, haz zoom y observa de cerca los componentes más poderosos como si los tuvieras en tus manos!</p>
                <a href="laboratorio.jsp" class="btn-feature">¡Ir al Laboratorio!</a>
            </div>

            <div class="feature-card section-parts">
                <div class="feature-icon">
                    <i class="bi bi-cpu-fill"></i>
                </div>
                <h3>Partes del Computador</h3>
                <p>¡Explora los órganos del PC! Elige un componente para descubrir sus secretos y jugar a sus minijuegos:</p>
                
                <div class="parts-nav-buttons">
                    <a href="procesador.jsp" class="btn-part-link link-cpu"><i class="bi bi-cpu"></i> El Procesador</a>
                    <a href="ram.jsp" class="btn-part-link link-ram"><i class="bi bi-memory"></i> Memoria RAM</a>
                    <a href="almacenamiento.jsp" class="btn-part-link link-storage"><i class="bi bi-hdd-fill"></i> Almacenamiento</a>
                    <a href="grafica.jsp" class="btn-part-link link-gpu"><i class="bi bi-gpu-card"></i> Tarjeta Gráfica</a>
                    <a href="fuente.jsp" class="btn-part-link link-power"><i class="bi bi-lightning-charge-fill"></i> Fuente de Poder</a>
                    <a href="tarjetamadre.jsp" class="btn-part-link link-motherboard"><i class="bi bi-controller"></i> Tarjeta Madre</a>
                </div>
            </div>

            <div class="feature-card section-quiz">
                <div class="feature-icon">
                    <i class="bi bi-trophy-fill"></i>
                </div>
                <h3>Quiz Desafío</h3>
                <p>Responde preguntas divertidas, acumula puntos y demuestra que eres el rey del Hardware.</p>
                <a href="quiz.jsp" class="btn-feature">¡Aceptar el Reto!</a>
            </div>

        </section>

        <section class="welcome-banner">
            <% if (apodoLogueado != null) { %>
                <div class="banner-text">
                    <h2>¡Qué bueno tenerte de vuelta, <%= apodoLogueado %>!</h2>
                    <p>Tu avatar listo. ¿Qué componente de hardware vamos a descubrir y explorar a fondo el día de hoy?</p>
                </div>
                <a href="laboratorio.jsp" class="btn-register-banner">¡Ir al Laboratorio 3D! <i class="bi bi-rocket-takeoff-fill"></i></a>
            <% } else { %>
                <div class="banner-text">
                    <h2>¿Listo para empezar tu aventura?</h2>
                    <p>Crea tu apodo secreto, elige un avatar genial de robot o alienígena y guarda todos tus puntos ganados.</p>
                </div>
                <a href="register.jsp" class="btn-register-banner">Crear Mi Avatar <i class="bi bi-arrow-right-short"></i></a>
            <% } %>
        </section>

    </main>

    <footer class="main-footer">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware Especial para Niños</p>
    </footer>

    <%@ include file="asistente.jsp" %>
</body>
</html>