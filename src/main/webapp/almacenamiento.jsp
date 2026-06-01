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
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Almacenamiento SSD/HDD</title>
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
                    <a href="#" class="active">Partes del Computador <i class="bi bi-chevron-down" style="font-size: 0.8rem;"></i></a>
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

    <main class="content-container">
        
      

        <section class="interactive-section">
            <h2>¿Qué es este gran baúl de archivos?</h2>
            <p>El <strong>Disco de Almacenamiento (SSD o HDD)</strong> es el armario gigante de la computadora. A diferencia de la olvidadiza RAM, este componente guarda tus fotos, tareas y juegos favoritos bajo llave para que nunca se borren, ¡incluso si apagas el PC por muchos días!</p>
            
            <div class="processor-box" style="color: #9b59b6; font-size: 4rem; text-align: center; margin: 20px 0;">
                <i class="bi bi-hdd-fill"></i>
            </div>
            
            <h3>¿Cómo prefieres guardar tus archivos?</h3>
            <p>Haz clic en los botones para descubrir los dos tipos de armarios que existen:</p>
            
            <div class="power-buttons" style="display: flex; gap: 15px; justify-content: center; margin: 20px 0;">
                <button class="btn-power" style="background-color:#f3e5f5; color:#9b59b6; border: 2px solid #9b59b6; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="showInfo('hdd')"><i class="bi bi-disc"></i> El Viejo Disco HDD</button>
                <button class="btn-power" style="background-color:#f3e5f5; color:#9b59b6; border: 2px solid #9b59b6; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="showInfo('ssd')"><i class="bi bi-lightning-fill"></i> El Veloz Disco SSD</button>
            </div>

            <div id="info-screen" style="border-left: 5px solid #9b59b6; background-color: #faf5ff; padding: 15px; border-radius: 8px; margin-top: 15px; display: none;"></div>
        </section>

        <section class="interactive-section" style="margin-top: 40px;">
            <h2><i class="bi bi-folder-fill" style="color: #9b59b6;"></i> ¿Qué guardamos en el armario?</h2>
            <p class="mb-3">Todo lo que creas o descargas ocupa un rinconcito en tu disco. ¡Mira los ejemplos haciendo girar las tarjetas!</p>
            
            <div class="features-grid">
                
                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #ff9f43; color: white; padding: 20px; border-radius: 15px; text-align: center;">
                            <i class="bi bi-image-alt" style="font-size: 3rem;"></i>
                            <h4>Fotos y Recuerdos</h4>
                            <span>(Archivos Medianos)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Las capturas de tus juegos y las fotos familiares se quedan grabadas como pequeños mosaicos de colores estables en el disco duro.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #54a0ff; color: white; padding: 20px; border-radius: 15px; text-align: center;">
                            <i class="bi bi-controller" style="font-size: 3rem;"></i>
                            <h4>Súper Videojuegos</h4>
                            <span>(Archivos Gigantes)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Los juegos ocupan bloques gigantescos dentro del baúl porque contienen mapas de mundos enteros, personajes y sonidos tridimensionales.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #ff5252; color: white; padding: 20px; border-radius: 15px; text-align: center;">
                            <i class="bi bi-file-earmark-text-fill" style="font-size: 3rem;"></i>
                            <h4>Tareas Escolares</h4>
                            <span>(Archivos Pequeños)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Los archivos de texto de tus clases no ocupan casi nada de espacio. ¡Podrías guardar millones de tareas en un solo disco!</p>
                        </div>
                    </div>
                </div>

            </div>
        </section>

    </main>

    <footer class="main-footer">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware Especial para Niños</p>
    </footer>

    <script>
        function showInfo(type) {
            const screen = document.getElementById('info-screen');
            screen.style.display = "block";
            
            if(type === 'hdd') {
                screen.innerHTML = "<h4>💿 Disco Duro (HDD): El Armario de Discos Giratorios</h4><p>Funciona con un disco de metal que gira muy rápido dentro de una caja, como si fuera un tocadiscos mecánico. Es un armario gigante donde cabe muchísimo, pero es un poco lento para encontrar los juguetes y hace un poquito de ruido.</p>";
            } else if(type === 'ssd') {
                screen.innerHTML = "<h4>⚡ Unidad de Estado Sólido (SSD): El Armario Eléctrico Ultra Veloz</h4><p>No tiene ninguna pieza que se mueva por dentro. Utiliza chips electrónicos inteligentes (como los de un pendrive). Es súper silencioso y tan veloz como un rayo; hace que tus juegos e informática carguen al instante.</p>";
            }
        }
    </script>

</body>
</html>