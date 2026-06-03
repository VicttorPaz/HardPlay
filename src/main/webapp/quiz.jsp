<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.usuarios.seguridad.Usuario" %>
<%
    HttpSession sesionNavbar = request.getSession(false);
    String apodoLogueado = null;
    String avatarLogueado = null;

    if (sesionNavbar != null && sesionNavbar.getAttribute("usuarioLogueado") != null) {
        apodoLogueado = (String) sesionNavbar.getAttribute("usuarioLogueado");
        avatarLogueado = (String) sesionNavbar.getAttribute("avatarUsuario");
    }
%>

<%
    String alumnoActivo = (String) session.getAttribute("usuarioLogueado");
    if (alumnoActivo != null) {
        com.usuarios.seguridad.Usuario bitacoraHelper = new com.usuarios.seguridad.Usuario();
        bitacoraHelper.registrarAccionBitacora(alumnoActivo, "El estudiante abrió el Quiz para Niños");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Quiz Niños</title>
    <link rel="stylesheet" href="style/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
     <%@ include file="asistente.jsp" %>
   <script src="accesibilidad.js"></script>
    
   
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
                        <a href="grafica.jsp"><i class="bi bi-gpu-card"></i> Tarjeta Gráfica</a>
                        <a href="fuente.jsp"><i class="bi bi-lightning-charge-fill"></i> Fuente de Poder</a>
                        <a href="tarjetamadre.jsp"><i class="bi bi-controller"></i> Tarjeta Madre</a>
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
                    <a href="mi_perfil.jsp"><i class="bi bi-person-bounding-box"></i> Mi Perfil</a>
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
            <h1>Misión: Descubre el Hardware 🚀</h1>
            <p>¡Responde estas preguntas y conviértete en un experto de las computadoras!</p>
        </section>

        <div class="quiz-wrapper">
            <form action="respuesta.jsp" method="POST">
                
                <div class="quiz-card">
                    <span class="badge-points">Pregunta 1</span>
                    <h3>1. Es conocido como el "cerebro" de la computadora porque piensa y organiza todo lo que haces. ¿Quién es?</h3>
                    <div class="quiz-image-container">
                        <img src="https://images.unsplash.com/photo-1591453089816-0fbb971b454c?q=80&w=600&auto=format&fit=crop" class="quiz-image" alt="Procesador">
                    </div>
                    <div class="options-container">
                        <label class="option-label">
                            <input type="radio" name="p1" value="A" required>
                            <span>A) El Procesador (CPU)</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p1" value="B">
                            <span>B) El Teclado</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p1" value="C">
                            <span>C) El Ratón (Mouse)</span>
                        </label>
                    </div>
                </div>

                <div class="quiz-card">
                    <span class="badge-points">Pregunta 2</span>
                    <h3>2. Esta parte te ayuda a recordar tus juegos abiertos mientras juegas, pero si apagas la computadora, ¡se le olvida todo! ¿Qué es?</h3>
                    <div class="quiz-image-container">
                        <img src="https://images.unsplash.com/photo-1541029071515-84cc54f84dc5?q=80&w=600&auto=format&fit=crop" class="quiz-image" alt="Memoria RAM">
                    </div>
                    <div class="options-container">
                        <label class="option-label">
                            <input type="radio" name="p2" value="A" required>
                            <span>A) Un Disco Duro</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p2" value="B">
                            <span>B) La Memoria RAM</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p2" value="C">
                            <span>C) Los Parlantes</span>
                        </label>
                    </div>
                </div>

                <div class="quiz-card">
                    <span class="badge-points">Pregunta 3</span>
                    <h3>3. Es como una gran caja fuerte o mochila donde se guardan tus fotos, tareas y juegos de forma segura por mucho tiempo. ¿Qué componente es?</h3>
                    <div class="quiz-image-container">
                        <img src="https://images.unsplash.com/photo-1531403009284-440f080d1e12?q=80&w=600&auto=format&fit=crop" class="quiz-image" alt="Almacenamiento">
                    </div>
                    <div class="options-container">
                        <label class="option-label">
                            <input type="radio" name="p3" value="A" required>
                            <span>A) El Disco de Almacenamiento (SSD / HDD)</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p3" value="B">
                            <span>B) El Cable de Energía</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p3" value="C">
                            <span>C) La Pantalla</span>
                        </label>
                    </div>
                </div>

                <div class="quiz-card">
                    <span class="badge-points">Pregunta 4</span>
                    <h3>4. ¿Cuál de estas partes sirve para "escribir" letras y números dentro de la pantalla?</h3>
                    <div class="quiz-image-container">
                        <img src="https://images.unsplash.com/photo-1587829741301-dc798b83add3?q=80&w=600&auto=format&fit=crop" class="quiz-image" alt="Teclado">
                    </div>
                    <div class="options-container">
                        <label class="option-label">
                            <input type="radio" name="p4" value="A" required>
                            <span>A) El Teclado</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p4" value="B">
                            <span>B) La Impresora</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p4" value="C">
                            <span>C) El Procesador</span>
                        </label>
                    </div>
                </div>

                <div class="quiz-card">
                    <span class="badge-points">Pregunta 5</span>
                    <h3>5. ¿Qué componente se encarga de dar "energía eléctrica" a todas las piezas para que la computadora pueda encender?</h3>
                    <div class="quiz-image-container">
                        <img src="https://images.unsplash.com/photo-1555664424-778a1e5e1b48?q=80&w=600&auto=format&fit=crop" class="quiz-image" alt="Fuente de poder">
                    </div>
                    <div class="options-container">
                        <label class="option-label">
                            <input type="radio" name="p5" value="A" required>
                            <span>A) El Ventilador</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p5" value="B">
                            <span>B) La Fuente de Poder (Alimentación)</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="p5" value="C">
                            <span>C) El Lector de CD</span>
                        </label>
                    </div>
                </div>

                <div style="margin-top: 10px; margin-bottom: 40px;">
                    <button type="submit" class="quiz-submit-btn">Finalizar mi Misión 🚀</button>
                </div>

            </form>
        </div>
    </main>

    <footer class="main-footer">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware</p>
    </footer>

</body>
</html>