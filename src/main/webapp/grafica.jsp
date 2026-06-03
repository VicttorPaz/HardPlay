<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.usuarios.seguridad.Usuario" %>
<%
    HttpSession sesionNavbar = request.getSession(false);
    String apodoLogueado = null;
    String avatarLogueado = null;

    if (sesionNavbar != null && sesionNavbar.getAttribute("usuarioLogueado") != null) {
        apodoLogueado = (String) sesionNavbar.getAttribute("usuarioLogueado");
        avatarLogueado = (String) sesionNavbar.getAttribute("avatarUsuario");
        if (avatarLogueado == null) {
            avatarLogueado = (String) sesionNavbar.getAttribute("avatarLogueado");
        }
    }

    if (avatarLogueado == null) {
        avatarLogueado = "robot";
    }
%>
<%
    String alumnoActivo = (String) session.getAttribute("usuarioLogueado");
    if (alumnoActivo != null) {
        com.usuarios.seguridad.Usuario bitacoraHelper = new com.usuarios.seguridad.Usuario();
        bitacoraHelper.registrarAccionBitacora(alumnoActivo, "El estudiante abrió el Laboratorio Interactiva de la Tarjeta Gráfica");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Tarjeta Gráfica (GPU)</title>
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

    <main class="content-container">

        <section class="interactive-section">
            <h2>La Tarjeta Gráfica: El Pintor de Videojuegos 🎨</h2>
            <p>La <strong>Tarjeta Gráfica (o GPU)</strong> es la artista del computador. Su único y súper divertido trabajo es dibujar en la pantalla todos los colores, personajes, árboles y explosiones de tus videojuegos favoritos. ¡Hace sus dibujos tan rápido que parecen películas en movimiento!</p>
            
            <div class="processor-box gpu-theme-color" style="font-size: 4rem; text-align: center; margin: 20px 0;">
                <i class="bi bi-gpu-card"></i>
            </div>
            
            <h3>¿Qué secretos esconde esta tarjeta?</h3>
            <p>Descubre los dos componentes clave que hacen que tus juegos no vayan lentos ni congelados:</p>
            
            <div class="power-buttons" style="display: flex; gap: 15px; justify-content: center; margin: 20px 0;">
                <button class="btn-power" style="background-color:#e3f2fd; color:#3498db; border: 2px solid #3498db; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="playSound('sound-click'); showGpuInfo('cores')"><i class="bi bi-cpu-fill"></i> Núcleos de Procesamiento</button>
                <button class="btn-power" style="background-color:#e3f2fd; color:#3498db; border: 2px solid #3498db; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="playSound('sound-click'); showGpuInfo('vram')"><i class="bi bi-grid-3x3-gap-fill"></i> Memoria VRAM</button>
            </div>

            <div id="gpu-info-screen" style="border-left: 5px solid #3498db; background-color: #f0f9ff; padding: 15px; border-radius: 8px; margin-top: 15px; display: none;"></div>
        </section>

        <section class="interactive-section" style="margin-top: 40px;">
            <h2><i class="bi bi-play-btn-fill" style="color: #e74c3c;"></i> ¡Mira el poder gráfico en acción!</h2>
            <p>¿Quieres aprender cómo la tarjeta gráfica divide el trabajo para pintar mundos tridimensionales gigantes en milisegundos? Disfruta este video instructivo:</p>
            
            <div class="video-container">
                <iframe src="https://www.youtube.com/embed/UP6gTf6p9V4" title="Cómo funciona una tarjeta gráfica" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </section>

        <section class="interactive-section" style="margin-top: 40px;">
            <h2><i class="bi bi-joystick" style="color: #3498db;"></i> ¿En qué nos ayuda una buena GPU?</h2>
            <p class="mb-3">Tener una tarjeta potente cambia por completo cómo experimentas la informática escolar y el entretenimiento. ¡Gira las tarjetas para ver los ejemplos!</p>
            
            <div class="features-grid">
                <div class="part-flip-card" onclick="playSound('sound-click')">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #2ecc71; color: white; padding: 20px; border-radius: 15px; text-align: center; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                            <img src="https://images.unsplash.com/photo-1542751371-adc38448a05e?w=150&auto=format&fit=crop&q=60" alt="Fluidez" class="hardware-img" style="border-radius:10px;">
                            <h4>Movimientos Fluidos</h4>
                            <span>(Alta Tasa de FPS)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>La tarjeta calcula tantos cuadros por segundo que verás correr y saltar a tus personajes de forma totalmente suave, sin pausas molestas.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card" onclick="playSound('sound-click')">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #9b59b6; color: white; padding: 20px; border-radius: 15px; text-align: center; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                            <img src="https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=150&auto=format&fit=crop&q=60" alt="Resolución" class="hardware-img" style="border-radius:10px;">
                            <h4>Imágenes Cristalinas</h4>
                            <span>(Alta Resolución)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Permite agrupar millones de píxeles finos para que los bordes de los objetos se vean perfectos, realistas y no como bloques borrosos.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card" onclick="playSound('sound-click')">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #e74c3c; color: white; padding: 20px; border-radius: 15px; text-align: center; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                            <img src="https://images.unsplash.com/photo-1614850523459-c2f4c699c52e?w=150&auto=format&fit=crop&q=60" alt="Modelos 3D" class="hardware-img" style="border-radius:10px;">
                            <h4>Efectos de Luces</h4>
                            <span>(Ray Tracing Mágico)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Las GPU avanzadas rastrean los rayos de sol virtuales para crear reflejos en el agua y sombras idénticas a las del mundo real.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="interactive-section" style="margin-top: 50px; border: 3px dashed #3498db; padding: 30px; border-radius: 24px; background-color: #faffff;">
            <div style="text-align: center; margin-bottom: 25px;">
                <h2><i class="bi bi-cpu-fill" style="color: #3498db;"></i> ¡Simulador de Rendimiento: Controla la GPU!</h2>
                <p>Modifica los controles de la Tarjeta Gráfica en vivo. Mira cómo al subir la <strong>velocidad del reloj</strong> del chip, el juego se vuelve ultra fluido (¡el alien saltará sin trabas!), pero ten cuidado: si exiges demasiado sin encender los ventiladores, la tarjeta se calentará.</p>
            </div>

            <div style="background-color: #0f172a; border-radius: 20px; padding: 25px; color: white; box-shadow: 0 10px 25px rgba(0,0,0,0.15);">
                
                <div class="game-monitor-frame">
                    <div style="display:flex; justify-content: space-between; font-size: 0.85rem; color:#38bdf8; margin-bottom:8px; font-weight:bold;">
                        <span><i class="bi bi-display"></i> Monitor Gamer (Simulado)</span>
                        <span>Rendimiento: <span id="hud-fps">15</span> FPS (Cuadros por Segundo)</span>
                        <span>Calidad: <span id="hud-res">Baja (Pixelada)</span></span>
                    </div>
                    
                    <div class="render-canvas-zone" id="screen-canvas">
                        <div class="game-character fps-laggy" id="character-sprite">👾</div>
                        <div style="position:absolute; top:10px; left:10px; background:rgba(0,0,0,0.5); padding:4px 10px; border-radius:5px; font-size:0.75rem;">
                            Temperatura GPU: <span id="hud-temp" style="color:#2ecc71; font-weight:bold;">35°C</span>
                        </div>
                    </div>
                </div>

                <div style="margin-top: 25px; display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; text-align: left;">
                    
                    <div>
                        <label style="font-weight: bold; color: #38bdf8;"><i class="bi bi-speedometer2"></i> Potencia del Reloj (Frecuencia GPU)</label>
                        <input type="range" min="1" max="3" value="1" class="gpu-slider" id="slider-clock" oninput="updateGpuSimulation()">
                        <span style="font-size:0.8rem; color:#94a3b8;">Determina qué tan rápido se procesa el movimiento del juego.</span>
                    </div>

                    <div>
                        <label style="font-weight: bold; color: #a855f7;"><i class="bi bi-grid"></i> Nivel de Detalles (Resolución de Textura)</label>
                        <input type="range" min="1" max="3" value="1" class="gpu-slider" id="slider-res" style="background:#475569;" oninput="updateGpuSimulation()">
                        <span style="font-size:0.8rem; color:#94a3b8;">Agrega más definición y nitidez al personaje 👾 del monitor.</span>
                    </div>

                </div>

                <div style="margin-top: 25px; text-align: center; border-top: 1px solid #334155; padding-top: 20px;">
                    <p id="gpu-instructions" style="color: #cbd5e1; font-size: 0.95rem; margin-bottom: 15px;">Mueve las barras deslizantes para experimentar cómo trabaja el procesador gráfico.</p>
                    
                    <button id="btn-gpu-fan" onclick="toggleGpuFan()" style="background-color: #e74c3c; border: none; color: white; padding: 12px 25px; border-radius: 12px; font-weight: bold; cursor: pointer; font-family: 'Poppins',sans-serif; font-size: 1rem; transition: background 0.3s;">
                        <i class="bi bi-fan fan-icon-spin" id="fan-icon"></i> Activar Ventiladores de Enfriamiento
                    </button>
                </div>

            </div>
        </section>

    </main>

    <footer class="main-footer" style="background-color: #3498db;">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware Especial para Niños</p>
    </footer>

    <script>
        function playSound(id) {
            const sound = document.getElementById(id);
            if (sound) {
                sound.currentTime = 0;
                sound.play().catch(e => console.log("Audio interactivo activado."));
            }
        }

        function showGpuInfo(type) {
            const screen = document.getElementById('gpu-info-screen');
            screen.style.display = "block";
            
            if(type === 'cores') {
                screen.innerHTML = "<h4>⚔️ Núcleos de Procesamiento: El Ejército de Pintores</h4><p>A diferencia del procesador de la PC (que tiene pocos núcleos pero muy grandes), la tarjeta gráfica tiene miles de núcleos pequeñitos trabajando en equipo. Cada uno se encarga de pintar un punto de color a la vez para acabar el dibujo juntos.</p>";
            } else if(type === 'vram') {
                screen.innerHTML = "<h4>🎒 Memoria VRAM: El Baúl de las Texturas Rápidas</h4><p>Es el almacén privado de la tarjeta de video. Allí se guardan los trajes de los personajes, las formas de los árboles y los mapas de los niveles para que los pintores no pierdan tiempo buscándolos en el disco duro general.</p>";
            }
        }

        // LÓGICA DE CONTROL DEL JUEGO SIMULADOR
        let fanActive = false;
        let gpuTemperature = 35;
        let tempInterval;

        function updateGpuSimulation() {
            playSound('sound-click');
            
            const clockValue = parseInt(document.getElementById('slider-clock').value);
            const resValue = parseInt(document.getElementById('slider-res').value);
            
            const txtFps = document.getElementById('hud-fps');
            const txtRes = document.getElementById('hud-res');
            const sprite = document.getElementById('character-sprite');
            const instructions = document.getElementById('gpu-instructions');

            // 1. Manejo dinámico de FPS según el reloj (Overclock simulado)
            if (clockValue === 1) {
                txtFps.innerText = "15";
                sprite.className = "game-character fps-laggy";
            } else if (clockValue === 2) {
                txtFps.innerText = "60";
                sprite.className = "game-character fps-smooth";
            } else if (clockValue === 3) {
                txtFps.innerText = "144";
                sprite.className = "game-character fps-smooth";
                // Modifica velocidad de animación CSS para reflejar los 144Hz
                sprite.style.animationDuration = "0.25s";
            }
            if (clockValue !== 3) {
                sprite.style.animationDuration = ""; // Reset de velocidad
            }

            // 2. Manejo visual de resolución (Filtros de difuminado y escala)
            if (resValue === 1) {
                txtRes.innerText = "Baja (Pixelada - 480p)";
                sprite.style.filter = "blur(4px) contrast(150%)";
                sprite.innerText = "👾";
            } else if (resValue === 2) {
                txtRes.innerText = "Media (Alta Definición - 1080p)";
                sprite.style.filter = "none";
                sprite.innerText = "👾";
            } else if (resValue === 3) {
                txtRes.innerText = "¡Ultra 4K Realista!";
                sprite.style.filter = "drop-shadow(0 0 10px #00ffff)";
                sprite.innerText = "👽"; // Súper evolución gráfica
            }

            // 3. Sistema matemático térmico dinámico
            // Si la potencia y resolución son altas, la temperatura sube orgánicamente
            let targetHeat = 35 + (clockValue * 12) + (resValue * 6);
            if (fanActive) targetHeat -= 25; // El ventilador mitiga el calor

            clearInterval(tempInterval);
            tempInterval = setInterval(() => {
                if (gpuTemperature < targetHeat) gpuTemperature++;
                if (gpuTemperature > targetHeat) gpuTemperature--;
                
                const tempLabel = document.getElementById('hud-temp');
                tempLabel.innerText = gpuTemperature + "°C";

                if (gpuTemperature >= 75) {
                    tempLabel.style.color = "#ef4444";
                    instructions.innerHTML = "⚠️ <strong>¡ALERTA TÉRMICA!</strong> La GPU está calculando demasiados píxeles y se está calentando mucho. ¡Enciende los ventiladores rápido o se congelará el juego!";
                } else if (gpuTemperature >= 55) {
                    tempLabel.style.color = "#f59e0b";
                    instructions.innerHTML = "👍 Los componentes están trabajando a buen ritmo para darte un gran rendimiento.";
                } else {
                    tempLabel.style.color = "#2ecc71";
                    if(clockValue === 3 && resValue === 3 && fanActive) {
                        instructions.innerHTML = "🏆 <strong>¡CONFIGURACIÓN PERFECTA!</strong> Tienes gráficos Ultra 4K a 144 FPS estables y el sistema está súper frío. ¡Eres un maestro de los videojuegos y la ingeniería!";
                    } else {
                        instructions.innerHTML = "Mueve las barras deslizantes para experimentar cómo trabaja el procesador gráfico.";
                    }
                }
            }, 150);
        }

        function toggleGpuFan() {
            playSound('sound-boost');
            const btn = document.getElementById('btn-gpu-fan');
            const icon = document.getElementById('fan-icon');

            fanActive = !fanActive;

            if (fanActive) {
                btn.style.backgroundColor = "#2ecc71";
                btn.innerHTML = '<i class="bi bi-fan fan-icon-spin" id="fan-icon" style="animation-play-state: running;"></i> ¡Ventiladores Funcionando al 100%!';
            } else {
                btn.style.backgroundColor = "#e74c3c";
                btn.innerHTML = '<i class="bi bi-fan fan-icon-spin" id="fan-icon" style="animation-play-state: paused;"></i> Activar Ventiladores de Enfriamiento';
            }
            updateGpuSimulation(); 
        }

  
        window.onload = () => {
            updateGpuSimulation();
        };
    </script>
    <%@ include file="asistente.jsp" %>
</body>
</html>