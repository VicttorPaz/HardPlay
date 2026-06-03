<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.usuarios.seguridad.Usuario" %>
<%@ include file="asistente.jsp" %>

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
        bitacoraHelper.registrarAccionBitacora(alumnoActivo, "El estudiante abrió Almacenamiento con Multimedia");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Almacenamiento SSD/HDD</title>
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
            <h2>¿Qué es este gran baúl de archivos?</h2>
            <p>El <strong>Disco de Almacenamiento (SSD o HDD)</strong> es el armario gigante de la computadora. A diferencia de la olvidadiza RAM, este componente guarda tus fotos, tareas y juegos favoritos bajo llave para que nunca se borren, ¡incluso si apagas el PC por muchos días!</p>
            
            <div class="processor-box" style="color: #9b59b6; font-size: 4rem; text-align: center; margin: 20px 0;">
                <i class="bi bi-hdd-fill"></i>
            </div>
            
            <h3>¿Cómo prefieres guardar tus archivos?</h3>
            <p>Haz clic en los botones para descubrir los dos tipos de armarios que existen:</p>
            
            <div class="power-buttons" style="display: flex; gap: 15px; justify-content: center; margin: 20px 0;">
                <button class="btn-power" style="background-color:#f3e5f5; color:#9b59b6; border: 2px solid #9b59b6; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="playSound('sound-click'); showInfo('hdd')"><i class="bi bi-disc"></i> El Viejo Disco HDD</button>
                <button class="btn-power" style="background-color:#f3e5f5; color:#9b59b6; border: 2px solid #9b59b6; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="playSound('sound-click'); showInfo('ssd')"><i class="bi bi-lightning-fill"></i> El Veloz Disco SSD</button>
            </div>

            <div id="info-screen" style="border-left: 5px solid #9b59b6; background-color: #faf5ff; padding: 15px; border-radius: 8px; margin-top: 15px; display: none;"></div>
        </section>

        <section class="interactive-section" style="margin-top: 40px;">
            <h2><i class="bi bi-play-btn-fill" style="color: #e74c3c;"></i> ¡Mira el almacenamiento en acción!</h2>
            <p>¿Quieres ver cómo funciona un disco duro real por dentro? Mira este divertido e instructivo video animado:</p>
            
            <div class="video-container">
                <iframe src="https://www.youtube.com/embed/SshM_g7z9YI" title="Cómo funciona un Disco Duro y un SSD" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </section>

        <section class="interactive-section" style="margin-top: 40px;">
            <h2><i class="bi bi-folder-fill" style="color: #9b59b6;"></i> ¿Qué guardamos en el armario?</h2>
            <p class="mb-3">Todo lo que creas o descargas ocupa un rinconcito en tu disco. ¡Mira los ejemplos haciendo girar las tarjetas!</p>
            
            <div class="features-grid">
                <div class="part-flip-card" onclick="playSound('sound-click')">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #ff9f43; color: white; padding: 20px; border-radius: 15px; text-align: center; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                            <img src="https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=150&auto=format&fit=crop&q=60" alt="Fotos" class="hardware-img" style="border-radius:10px;">
                            <h4>Fotos y Recuerdos</h4>
                            <span>(Archivos Medianos)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Las capturas de tus juegos y las fotos familiares se quedan grabadas como pequeños mosaicos de colores estables en el disco duro.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card" onclick="playSound('sound-click')">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #54a0ff; color: white; padding: 20px; border-radius: 15px; text-align: center; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                            <img src="https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=150&auto=format&fit=crop&q=60" alt="Juegos" class="hardware-img" style="border-radius:10px;">
                            <h4>Súper Videojuegos</h4>
                            <span>(Archivos Gigantes)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Los juegos ocupan bloques gigantescos dentro del baúl porque contienen mapas de mundos enteros, personajes y sonidos tridimensionales.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card" onclick="playSound('sound-click')">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #ff5252; color: white; padding: 20px; border-radius: 15px; text-align: center; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                            <img src="https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?w=150&auto=format&fit=crop&q=60" alt="Tareas" class="hardware-img" style="border-radius:10px;">
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

        <section class="interactive-section" style="margin-top: 50px; border: 3px dashed #9b59b6; padding: 30px; border-radius: 24px; background-color: #fdfbfe;">
            <div style="text-align: center; margin-bottom: 25px;">
                <h2><i class="bi bi-rocket-takeoff-fill" style="color: #e74c3c;"></i> ¡Simulador de Carrera: SSD vs HDD!</h2>
                <p>Vamos a cargar un juego de simulación espacial que pesa **50 Gigabytes**. Mira cómo el disco de estado sólido (SSD) vuela gracias a sus chips digitales, mientras que el disco duro mecánico (HDD) avanza lento porque sus platos mecánicos tienen que girar.</p>
            </div>

            <div style="background-color: #0f172a; border-radius: 20px; padding: 25px; color: white; box-shadow: 0 10px 25px rgba(0,0,0,0.15);">
                
                <div style="margin-bottom: 25px;">
                    <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-weight: bold;">
                        <span style="color: #2ecc71;"><i class="bi bi-lightning-charge-fill"></i> Unidad SSD (Electrónica)</span>
                        <span style="color: #2ecc71;"><span id="ssd-pct">0</span>% Cargado</span>
                    </div>
                    <div style="background-color: #334155; height: 25px; border-radius: 12px; overflow: hidden; border: 1px solid #475569;">
                        <div id="ssd-progress-bar" style="width: 0%; height: 100%; background: linear-gradient(90deg, #2ecc71, #27ae60); transition: width 0.1s ease;"></div>
                    </div>
                </div>

                <div style="margin-bottom: 30px;">
                    <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-weight: bold;">
                        <span style="color: #e67e22;"><i class="bi bi-disc-fill"></i> Disco HDD (Mecánico con Aguja)</span>
                        <span style="color: #e67e22;"><span id="hdd-pct">0</span>% Cargado</span>
                    </div>
                    <div style="background-color: #334155; height: 25px; border-radius: 12px; overflow: hidden; border: 1px solid #475569;">
                        <div id="hdd-progress-bar" style="width: 0%; height: 100%; background: linear-gradient(90deg, #e67e22, #d35400); transition: width 0.1s ease;"></div>
                    </div>
                </div>

                <div style="text-align: center; display: flex; flex-direction: column; align-items: center; gap: 15px;">
                    <p id="race-instructions" style="color: #94a3b8; font-size: 0.9rem; margin: 0;">Presiona el botón verde para iniciar la simulación de lectura de archivos.</p>
                    
                    <div style="display: flex; gap: 15px;">
                        <button id="btn-race-control" onclick="playSound('sound-success'); startRaceSimulation()" style="background-color: #2ecc71; border: none; color: white; padding: 12px 25px; border-radius: 12px; font-weight: bold; cursor: pointer; font-family: 'Poppins',sans-serif; font-size: 1rem;">
                            <i class="bi bi-play-circle-fill"></i> Iniciar Carrera de Carga
                        </button>
                        
                        <button id="btn-turbo-hdd" onclick="injectTurboHDD()" style="background-color: #3498db; border: none; color: white; padding: 12px 25px; border-radius: 12px; font-weight: bold; cursor: not-allowed; font-family: 'Poppins',sans-serif; font-size: 1rem;" disabled>
                            <i class="bi bi-arrow-repeat"></i> ¡Girar Disco HDD Más Rápido!
                        </button>
                    </div>
                </div>

            </div>
        </section>

    </main>

    <footer class="main-footer" style="background-color: #9b59b6;">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware Especial para Niños</p>
    </footer>

    <script>
        // FUNCIÓN GLOBAL PARA REPRODUCIR EFECTOS DE AUDIO SIN REPETICIÓN
        function playSound(id) {
            const sound = document.getElementById(id);
            if (sound) {
                sound.currentTime = 0; // Reinicia el audio si ya se estaba reproduciendo
                sound.play().catch(e => console.log("Audio esperando interacción del usuario."));
            }
        }

        function showInfo(type) {
            const screen = document.getElementById('info-screen');
            screen.style.display = "block";
            
            if(type === 'hdd') {
                screen.innerHTML = "<h4>💿 Disco Duro (HDD): El Armario de Discos Giratorios</h4><p>Funciona con un disco de metal que gira muy rápido dentro de una caja, como si fuera un tocadiscos mecánico. Es un armario gigante donde cabe muchísimo, pero es un poco lento para encontrar los juguetes y hace un poquito de ruido.</p>";
            } else if(type === 'ssd') {
                screen.innerHTML = "<h4>⚡ Unidad de Estado Sólido (SSD): El Armario Eléctrico Ultra Veloz</h4><p>No tiene ninguna pieza que se mueva por dentro. Utiliza chips electrónicos inteligentes (como los de un pendrive). Es súper silencioso y tan veloz como un rayo; hace que tus juegos e informática carguen al instante.</p>";
            }
        }

        let ssdProgress = 0;
        let hddProgress = 0;
        let raceInterval;
        let raceActive = false;

        function startRaceSimulation() {
            if (raceActive) return;
            
            raceActive = true;
            ssdProgress = 0;
            hddProgress = 0;
            
            document.getElementById('ssd-progress-bar').style.width = '0%';
            document.getElementById('hdd-progress-bar').style.width = '0%';
            document.getElementById('ssd-pct').innerText = '0';
            document.getElementById('hdd-pct').innerText = '0';
            
            document.getElementById('btn-turbo-hdd').disabled = false;
            document.getElementById('btn-turbo-hdd').style.cursor = 'pointer';
            document.getElementById('btn-race-control').disabled = true;
            document.getElementById('btn-race-control').style.backgroundColor = '#64748b';
            document.getElementById('race-instructions').innerText = "¡La carrera comenzó! El SSD avanza solo de forma digital. ¡Ayuda al viejo HDD presionando el botón azul rápidamente para que sus platos giren más rápido!";

            raceInterval = setInterval(() => {
                ssdProgress += Math.floor(Math.random() * 3) + 2; 
                hddProgress += 0.4; 

                if (ssdProgress > 100) ssdProgress = 100;
                if (hddProgress > 100) hddProgress = 100;

                document.getElementById('ssd-progress-bar').style.width = ssdProgress + '%';
                document.getElementById('hdd-progress-bar').style.width = hddProgress + '%';
                document.getElementById('ssd-pct').innerText = Math.floor(ssdProgress);
                document.getElementById('hdd-pct').innerText = Math.floor(hddProgress);

                if (ssdProgress >= 100 || hddProgress >= 100) {
                    endRaceSimulation();
                }
            }, 100);
        }

        function injectTurboHDD() {
            if (!raceActive) return;
            
            // Añadido sonido de turbo mecánico en cada click dinámico
            playSound('sound-turbo');
            
            hddProgress += 2.5;
            if (hddProgress > 100) hddProgress = 100;
            
            document.getElementById('hdd-progress-bar').style.width = hddProgress + '%';
            document.getElementById('hdd-pct').innerText = Math.floor(hddProgress);
        }

        function endRaceSimulation() {
            clearInterval(raceInterval);
            raceActive = false;
            
            // Sonido de victoria / fin de simulación
            playSound('sound-success');
            
            document.getElementById('btn-turbo-hdd').disabled = true;
            document.getElementById('btn-turbo-hdd').style.cursor = 'not-allowed';
            document.getElementById('btn-race-control').disabled = false;
            document.getElementById('btn-race-control').style.backgroundColor = '#2ecc71';
            
            if (ssdProgress >= 100 && hddProgress < 100) {
                document.getElementById('race-instructions').innerHTML = "🏆 <strong>¡Ganó el SSD!</strong> El SSD terminó de cargar el mapa en tiempo récord gracias a sus chips de silicio. El HDD se quedó atrás dando vueltas mecánicas. ¡Por eso los SSD son mejores para instalar juegos!";
            } else {
                document.getElementById('race-instructions').innerHTML = "⚡ <strong>¡Increíble!</strong> Lograste hacer girar el disco HDD tan rápido con tus clics que completaste la carga. Sin embargo, tuviste que esforzarte mucho, ¿viste cómo el SSD lo hace de forma automática y sin cansarse?";
            }
        }
    </script>

</body>
</html>