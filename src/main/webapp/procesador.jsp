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
%>

<%
    String alumnoActivo = (String) session.getAttribute("usuarioLogueado");
    if (alumnoActivo != null) {
        com.usuarios.seguridad.Usuario bitacoraHelper = new com.usuarios.seguridad.Usuario();
        bitacoraHelper.registrarAccionBitacora(alumnoActivo, "El estudiante abrió la pestaña PROCESADOR");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - El Procesador</title>
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
               
                <li><a href="quiz.jsp">Quiz</a></li>
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
                <a href="register.jsp" class="user-profile-icon" title="Mi Cuenta / Iniciar Sesión">
                    <i class="bi bi-person-circle"></i>
                </a>
            <% } %>
        </nav>
    </header>

    <main class="container">
        
        <section class="interactive-section">
            <h2>¿Qué es este pequeño chip?</h2>
            <p>El <strong>Procesador (o CPU)</strong> es el cerebro de la computadora. No tiene ojos ni manos, ¡pero piensa más rápido que nadie! Su trabajo es tomar tus clics y convertirlos en dibujos, música y movimientos en la pantalla.</p>
            
            <div class="processor-box">
                <i class="bi bi-cpu-fill"></i>
            </div>
            
            <h3>¿Qué pasa cuando juegas o ves videos?</h3>
            <p>Haz clic en los botones para ver qué órdenes da el procesador en tiempo real:</p>
            
            <div class="power-buttons">
                <button class="btn-power" onclick="showInfo('juegos')"><i class="bi bi-controller"></i> En los Juegos</button>
                <button class="btn-power" onclick="showInfo('videos')"><i class="bi bi-youtube"></i> En los Videos</button>
            </div>

            <div id="info-screen"></div>
        </section>

        <section class="interactive-section">
            <h2><i class="bi bi-gear-wide-connected text-purple"></i> El Laboratorio Interno del CPU</h2>
            <p class="mb-3">El cerebro del PC tiene tres ayudantes secretos trabajando adentro. ¡Pasa el mouse o toca cada tarjeta para descubrir sus superpoderes!</p>
            
            <div class="parts-grid">
                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front bg-blue">
                            <i class="bi bi-compass-fill"></i>
                            <h4>Unidad de Control</h4>
                            <span>(El Director)</span>
                        </div>
                        <div class="card-back">
                            <p>¡Es como el policía de tránsito del CPU! Decide qué datos entran primero y hacia dónde deben ir para que nada se choque ni se pierda.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front bg-green">
                            <i class="bi bi-calculator-fill"></i>
                            <h4>Unidad Lógica (ALU)</h4>
                            <span>(El Matemático)</span>
                        </div>
                        <div class="card-back">
                            <p>¡Es un genio de los números! Resuelve sumas, restas y comparaciones lógicas a una velocidad increíble de millones de cuentas por segundo.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front bg-orange">
                            <i class="bi bi-folder-symlink-fill"></i>
                            <h4>Los Registros</h4>
                            <span>(Notas Rápidas)</span>
                        </div>
                        <div class="card-back">
                            <p>Son cajas de notas ultra veloces donde el procesador guarda los números que está calculando en ese preciso milisegundo.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="interactive-section">
            <h2><i class="bi bi-thermometer-half text-purple"></i> ¿El Cerebro se Calienta?</h2>
            <p>¡Sí! Al pensar tan rápido, el procesador se pone muy caliente. Necesita un ventilador (disipador) para mantenerse fresco y feliz. ¡Haz clic para encender los ventiladores antes de que se queme!</p>
            
            <div class="cooler-simulator">
                <div class="thermometer-container">
                    <div class="thermometer-bar" id="temp-bar"></div>
                    <span class="temp-label" id="temp-text">35°C (¡Todo Fresco!)</span>
                </div>
                <div class="fan-box">
                    <i class="bi bi-fan" id="fan-icon"></i>
                    <button class="btn-fan" onclick="coolProcessor()">¡Activar Ventilador!</button>
                </div>
            </div>
        </section>

        <section class="game-wrapper">
            <h2 style="margin-bottom: 20px; color: #6c5ce7;"><i class="bi bi-joystick"></i> ¡A jugar! Demuestra lo que sabes</h2>
            <iframe src="https://wordwall.net/es/embed/81ea0d00c7d343179ed864a7642b8d27?themeId=66&templateId=5&fontStackId=0" width="100%" height="450" frameborder="0" allowfullscreen></iframe>
        </section>

    </main>

    <footer class="main-footer">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware Especial para Niños</p>
    </footer>

    <script>
        // Lógica de los botones informativos
        function showInfo(type) {
            const screen = document.getElementById('info-screen');
            screen.style.display = 'block';
            if(type === 'juegos') {
                screen.innerHTML = "<strong><i class='bi bi-controller'></i> En los Juegos:</strong> El procesador calcula hacia dónde se mueve tu personaje, cómo rebotan los objetos y le dice a la tarjeta gráfica exactamente qué pintar en la pantalla para que no se trabe.";
                screen.style.borderLeftColor = '#3498db';
            } else if(type === 'videos') {
                screen.innerHTML = "<strong><i class='bi bi-youtube'></i> En los Videos:</strong> Descarga paquetes de datos invisibles de Internet, los une como piezas de un rompecabezas de imágenes y reproduce el sonido sincronizado para que disfrutes de tus películas favoritas.";
                screen.style.borderLeftColor = '#e74c3c';
            }
        }

        // Lógica del simulador de temperatura
        let temperature = 35;
        const tempBar = document.getElementById('temp-bar');
        const tempText = document.getElementById('temp-text');
        const fanIcon = document.getElementById('fan-icon');

        setInterval(() => {
            if (temperature < 90) {
                temperature += 3;
                updateThermometer();
            }
        }, 1500);

        function updateThermometer() {
            tempBar.style.height = temperature + '%';
            if (temperature < 55) {
                tempBar.style.backgroundColor = '#2ecc71';
                tempText.innerText = temperature + "°C (¡Todo Fresco!)";
                fanIcon.classList.remove('spin-fast');
            } else if (temperature < 75) {
                tempBar.style.backgroundColor = '#f1c40f';
                tempText.innerText = temperature + "°C (¡Pensando mucho!)";
            } else {
                tempBar.style.backgroundColor = '#e74c3c';
                tempText.innerText = temperature + "°C (¡Peligro! ¡Se quema!)";
            }
        }

        function coolProcessor() {
            temperature = Math.max(35, temperature - 20);
            fanIcon.classList.add('spin-fast');
            updateThermometer();
            setTimeout(() => {
                if(temperature < 55) fanIcon.classList.remove('spin-fast');
            }, 1000);
        }
    </script>
</body>
</html>