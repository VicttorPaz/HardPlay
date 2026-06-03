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
        if (avatarLogueado == null) {
            avatarLogueado = (String) sesionNavbar.getAttribute("avatarLogueado");
        }
    }

    // Control anti-errores nulos
    if (avatarLogueado == null) {
        avatarLogueado = "robot";
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
    <link rel="stylesheet" href="style/hardware.css">
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
            <h2>HARD<span>PLAY</span></h2>
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
            
            <div class="processor-box" style="color: #2ecc71; font-size: 4rem; text-align: center; margin: 20px 0;">
                <i class="bi bi-memory"></i>
            </div>
            
            <h3>¿Qué pasa cuando abres muchas cosas?</h3>
            <p>Haz clic en los botones para ver cómo trabaja la RAM en tiempo real:</p>
            
            <div class="power-buttons" style="display: flex; gap: 15px; justify-content: center; margin: 20px 0;">
                <button class="btn-power" style="background-color:#e8f5e9; color:#2ecc71; border:2px solid #2ecc71; padding:10px 20px; border-radius:12px; font-weight:bold; cursor:pointer;" onclick="showInfo('abrir')"><i class="bi bi-plus-circle-fill"></i> Abrir Apps</button>
                <button class="btn-power" style="background-color:#e8f5e9; color:#2ecc71; border:2px solid #2ecc71; padding:10px 20px; border-radius:12px; font-weight:bold; cursor:pointer;" onclick="showInfo('cerrar')"><i class="bi bi-dash-circle-fill"></i> Cerrar Apps</button>
            </div>

            <div id="info-screen" style="border-left: 5px solid #2ecc71; background-color: #f4fbf7; padding: 15px; border-radius: 8px; margin-top: 15px; display: none;"></div>
        </section>

        <section class="interactive-section">
            <h2><i class="bi bi-device-ssd-fill text-purple"></i> Los Superpoderes de la RAM</h2>
            <p class="mb-3">Toca cada tarjeta para descubrir las características secretas de esta súper memoria rápida.</p>
            
            <div class="parts-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-top: 20px;">
                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #2ecc71; color: white; padding: 20px; border-radius: 15px; text-align: center;">
                            <i class="bi bi-lightning-charge-fill" style="font-size: 3rem;"></i>
                            <h4>Súper Velocidad</h4>
                            <span>(Ultra Rápida)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Es muchísimo más rápida que los discos duros. Envía datos al procesador en un abrir y cerrar de ojos para que tu juego no vaya lento.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #1abc9c; color: white; padding: 20px; border-radius: 15px; text-align: center;">
                            <i class="bi bi-cloud-lightning-fill" style="font-size: 3rem;"></i>
                            <h4>Es Volátil</h4>
                            <span>(Olvidadiza)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>¡No guarda nada para siempre! En cuanto la computadora se apaga o se queda sin energía, la RAM queda completamente vacía.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #9b59b6; color: white; padding: 20px; border-radius: 15px; text-align: center;">
                            <i class="bi bi-grid-3x3-gap-fill" style="font-size: 3rem;"></i>
                            <h4>Múltiples Tareas</h4>
                            <span>(El Pulpo)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Cuanta más memoria RAM tengas, más pestañas de internet, videos de YouTube y canciones puedes tener abiertos al mismo tiempo.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

  

        <section class="game-wrapper" style="margin-top: 40px;">
            <h2><i class="bi bi-joystick"></i> ¡A jugar con la RAM!</h2>
            <p>¡Oh no! Han abierto demasiadas aplicaciones en la computadora y la memoria RAM está a punto de llenarse. Haz clic sobre las burbujas de aplicaciones para cerrarlas y liberar espacio antes de que llegue al 100%.</p>
            
            <div class="game-box">
                <div style="display: flex; justify-content: space-between; font-weight: bold; color: #2c3e50;">
                    <span>Uso de RAM: <span id="ram-percentage">0</span>%</span>
                    <span>Puntuación: <span id="game-score">0</span></span>
                </div>
                
                <div class="ram-bar-container">
                    <div class="ram-bar-fill" id="ram-bar"></div>
                </div>

                <div class="app-spawn-zone" id="spawn-zone">
                    <div style="padding-top: 80px; color: #94a3b8; font-weight: 600;" id="game-placeholder">
                        <i class="bi bi-play-circle-fill" style="font-size: 2.5rem; color: #2ecc71; cursor: pointer;" onclick="startGame()"></i>
                        <br>Presiona el botón para iniciar el reto de velocidad
                    </div>
                </div>

                <button class="btn-start-game" id="btn-control" onclick="startGame()">Iniciar Simulación</button>
            </div>
        </section>

        <div id="blue-screen-error" class="bsod-overlay">
            <div class="bsod-content">
                <div class="bsod-sad-face">:(</div>
                <h1>¡PANTALLAZO AZUL!</h1>
                <p class="bsod-message">
                    Tu memoria RAM se ha llenado al 100% porque abriste demasiados juegos y programas al mismo tiempo. 
                    El procesador se quedó sin espacio físico en su mesa de trabajo y el sistema colapsó.
                </p>
                <div class="bsod-score-box">
                    Puntuación alcanzada: <span id="bsod-final-score">0</span> puntos de velocidad
                </div>
                <button class="btn-restart-sys" onclick="closeBlueScreen()">
                    <i class="bi bi-arrow-counterclockwise"></i> Reiniciar Computadora
                </button>
            </div>
        </div>

    </main>

    <footer class="main-footer" style="background-color:#2ecc71; color: white; text-align: center; padding: 15px; margin-top: 40px;">
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
                    let cell = document.getElementById(`cell-${i}`);
                    cell.style.backgroundColor = '#2ecc71';
                    cell.innerHTML = '<i class="bi bi-controller"></i>';
                }, i * 200);
            }
        }

        function triggerPowerOff() {
            for(let i=0; i<4; i++) {
                let cell = document.getElementById(`cell-${i}`);
                cell.style.backgroundColor = '#cbd5e1';
                cell.innerHTML = '<i class="bi bi-file-code"></i>';
            }
            
            // Reemplazamos la alerta clásica por el diseño del Pantallazo Azul controlado
            document.getElementById('bsod-final-score').innerText = "0 (Apagado Manual)";
            document.getElementById('blue-screen-error').style.display = 'flex';
        }

        /* LÓGICA DEL JUEGO INTERACTIVO */
        let ramUsage = 0;
        let score = 0;
        let gameInterval = null;
        let isPlaying = false;
        const appNames = [
            { name: 'Minecraft ⛏️', weight: 20 },
            { name: 'YouTube 📺', weight: 15 },
            { name: 'Roblox 🎮', weight: 18 },
            { name: 'Google Chrome 🌐', weight: 25 },
            { name: 'Música 🎵', weight: 10 },
            { name: 'Zoom 📹', weight: 15 }
        ];

        function startGame() {
            if(isPlaying) return;
            isPlaying = true;
            ramUsage = 0;
            score = 0;
            document.getElementById('game-score').innerText = score;
            document.getElementById('ram-percentage').innerText = ramUsage;
            document.getElementById('ram-bar').style.width = '0%';
            document.getElementById('game-placeholder').style.display = 'none';
            document.getElementById('btn-control').style.display = 'none';
            
            const zone = document.getElementById('spawn-zone');
            zone.innerHTML = '';

            gameInterval = setInterval(() => {
                updateRam(4);
                spawnApp();

                if(ramUsage >= 100) {
                    endGame();
                }
            }, 1200);
        }

        function spawnApp() {
            const zone = document.getElementById('spawn-zone');
            const randomApp = appNames[Math.floor(Math.random() * appNames.length)];
            
            const bubble = document.createElement('div');
            bubble.className = 'ram-app-bubble';
            
           
            bubble.innerHTML = '<i class="bi bi-app-indicator"></i> ' + randomApp.name + ' (+' + randomApp.weight + '%)';
            
            const x = Math.random() * (zone.clientWidth - 160);
            const y = Math.random() * (zone.clientHeight - 45);
            bubble.style.left = x + 'px';
            bubble.style.top = y + 'px';
            
            bubble.onclick = function() {
                if(!isPlaying) return;
                score += 10;
                document.getElementById('game-score').innerText = score;
                updateRam(-randomApp.weight);
                bubble.remove();
            };

            zone.appendChild(bubble);
            updateRam(randomApp.weight);
        }

        function updateRam(amount) {
            ramUsage += amount;
            if(ramUsage < 0) ramUsage = 0;
            if(ramUsage > 100) ramUsage = 100;
            
            document.getElementById('ram-percentage').innerText = ramUsage;
       
            document.getElementById('ram-bar').style.width = ramUsage + '%';
        }

        function endGame() {
            isPlaying = false;
            clearInterval(gameInterval);
            
            // Transferir puntuación y lanzar el overlay nativo de la página
            document.getElementById('bsod-final-score').innerText = score;
            document.getElementById('blue-screen-error').style.display = 'flex';
        }

        function closeBlueScreen() {
            // Ocultar la capa de error
            document.getElementById('blue-screen-error').style.display = 'none';
            
            // Reestablecer el marcador del juego de forma limpia
            document.getElementById('spawn-zone').innerHTML = `
                <div style="padding-top: 80px; color: #94a3b8; font-weight: 600;" id="game-placeholder">
                    <i class="bi bi-arrow-counterclockwise" style="font-size: 2.5rem; color: #2ecc71; cursor: pointer;" onclick="startGame()"></i>
                    <br>¡Buen intento! Presiona para volver a jugar
                </div>`;
            document.getElementById('btn-control').style.display = 'inline-block';
            document.getElementById('btn-control').innerText = 'Volver a Intentar';
        }
    </script>
</body>
</html>