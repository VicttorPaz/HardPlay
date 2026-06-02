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
        bitacoraHelper.registrarAccionBitacora(alumnoActivo, "El estudiante abrió la pestaña RAM");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Memoria RAM</title>
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
            <h2>¿Qué es esta tarjeta con cuadritos?</h2>
            <p>La <strong>Memoria RAM</strong> es la mesa de trabajo de la computadora. Cuando abres un juego, una foto o un video, el procesador los pone sobre esta mesa rápida para usarlos al instante. Pero ojo: ¡es una mesa olvidadiza!</p>
            
            <div class="processor-box" style="color: #2ecc71;">
                <i class="bi bi-memory"></i>
            </div>
            
            <h3>¿Qué pasa cuando abres muchas cosas?</h3>
            <p>Haz clic en los botones para ver cómo trabaja la RAM en tiempo real:</p>
            
            <div class="power-buttons">
                <button class="btn-power" style="background-color:#e8f5e9; color:#2ecc71;" onclick="showInfo('abrir')"><i class="bi bi-plus-circle-fill"></i> Abrir Apps</button>
                <button class="btn-power" style="background-color:#e8f5e9; color:#2ecc71;" onclick="showInfo('cerrar')"><i class="bi bi-dash-circle-fill"></i> Cerrar Apps</button>
            </div>

            <div id="info-screen" style="border-left-color: #2ecc71;"></div>
        </section>

        <section class="interactive-section">
            <h2><i class="bi bi-device-ssd-fill text-purple"></i> Los Superpoderes de la RAM</h2>
            <p class="mb-3">Toca cada tarjeta para descubrir las características secretas de esta súper memoria rápida.</p>
            
            <div class="parts-grid">
                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front bg-green">
                            <i class="bi bi-lightning-charge-fill"></i>
                            <h4>Súper Velocidad</h4>
                            <span>(Ultra Rápida)</span>
                        </div>
                        <div class="card-back">
                            <p>Es muchísimo más rápida que los discos duros. Envía datos al procesador en un abrir y cerrar de ojos para que tu juego no vaya lento.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front bg-teal">
                            <i class="bi bi-cloud-lightning-fill"></i>
                            <h4>Es Volátil</h4>
                            <span>(Olvidadiza)</span>
                        </div>
                        <div class="card-back">
                            <p>¡No guarda nada para siempre! En cuanto la computadora se apaga o se queda sin energía, la RAM queda completamente vacía.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front bg-purple">
                            <i class="bi bi-grid-3x3-gap-fill"></i>
                            <h4>Múltiples Tareas</h4>
                            <span>(El Pulpo)</span>
                        </div>
                        <div class="card-back">
                            <p>Cuanta más memoria RAM tengas, más pestañas de internet, videos de YouTube y canciones puedes tener abiertos al mismo tiempo.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="interactive-section">
            <h2><i class="bi bi-power text-purple"></i> El Experimento del Apagón</h2>
            <p>Abre aplicaciones para llenar las celdas de la RAM con datos verdes. Luego, presiona el botón rojo para apagar el computador y observa lo que pasa.</p>
            
            <div class="disk-space-box">
                <div class="ram-cells-container">
                    <div class="ram-cell-node" id="cell-0"><i class="bi bi-file-code"></i></div>
                    <div class="ram-cell-node" id="cell-1"><i class="bi bi-file-code"></i></div>
                    <div class="ram-cell-node" id="cell-2"><i class="bi bi-file-code"></i></div>
                    <div class="ram-cell-node" id="cell-3"><i class="bi bi-file-code"></i></div>
                </div>
                
                <div style="display:flex; justify-content:center; gap:15px; margin-top:20px;">
                    <button class="btn-fan" style="background-color:#2ecc71;" onclick="loadRamData()">¡Cargar Datos!</button>
                    <button class="btn-fan" style="background-color:#e74c3c;" onclick="triggerPowerOff()">⚡ ¡Apagar PC!</button>
                </div>
            </div>
        </section>

        <section class="game-wrapper">
            <h2 style="margin-bottom: 20px; color: #2ecc71;"><i class="bi bi-joystick"></i> ¡A jugar con la RAM!</h2>
            

    </main>

    <footer class="main-footer" style="background-color:#2ecc71;">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware Especial para Niños</p>
    </footer>

    <script>
        function showInfo(type) {
            const screen = document.getElementById('info-screen');
            screen.style.display = 'block';
            if(type === 'abrir') {
                screen.innerHTML = "<strong><i class='bi bi-plus-circle-fill'></i> Al abrir Apps:</strong> El procesador clona el juego desde el almacenamiento y lo sube a la RAM. Los cuadritos negros de la tarjeta se llenan de electricidad con las texturas y música del juego.";
            } else if(type === 'cerrar') {
                screen.innerHTML = "<strong><i class='bi bi-dash-circle-fill'></i> Al cerrar Apps:</strong> La RAM limpia inmediatamente ese espacio para que otra aplicación o tarea lo pueda usar, manteniendo la computadora rápida.";
            }
        }

        function loadRamData() {
            for(let i=0; i<4; i++) {
                setTimeout(() => {
                    let cell = document.getElementById(`cell-\${i}`);
                    cell.classList.add('active-data');
                    cell.innerHTML = '<i class="bi bi-controller"></i>';
                }, i * 200);
            }
        }

        function triggerPowerOff() {
            for(let i=0; i<4; i++) {
                let cell = document.getElementById(`cell-\${i}`);
                cell.classList.remove('active-data');
                cell.innerHTML = '<i class="bi bi-file-code"></i>';
            }
            alert("¡Puff! Al quitar la corriente eléctrica, la RAM olvidó todo instantáneamente. ¡Por eso debes guardar tus archivos en el disco!");
        }
    </script>
</body>
</html>