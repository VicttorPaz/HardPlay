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
        bitacoraHelper.registrarAccionBitacora(alumnoActivo, "El estudiante abrió el Laboratorio de la Tarjeta Madre");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - La Tarjeta Madre</title>
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
            <h2>La Tarjeta Madre: La Súper Ciudad Conectada 🏙️</h2>
            <p>La <strong>Tarjeta Madre (o Placa Base)</strong> es como una gigantesca ciudad llena de carreteras y puentes de cobre. Ningún componente del computador puede trabajar solo; por eso, todos se conectan a esta gran placa.</p>
            <p>Ella organiza el tráfico de datos, asegurándose de que los pensamientos del procesador lleguen a la memoria RAM y que los dibujos de la tarjeta gráfica aparezcan a tiempo en tu pantalla. ¡Es la base de todo el sistema!</p>
            
            <div class="processor-box motherboard-theme-color" style="font-size: 4rem; text-align: center; margin: 20px 0;">
                <i class="bi bi-circuit"></i>
            </div>
            
            <h3>¿Qué autopistas corren por la Placa?</h3>
            <p>Haz clic en los botones para descubrir los dos caminos secretos de comunicación:</p>
            
            <div class="power-buttons" style="display: flex; gap: 15px; justify-content: center; margin: 20px 0;">
                <button class="btn-power" style="background-color:#e0f7f4; color:#1abc9c; border: 2px solid #1abc9c; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="playSound('sound-click'); showMbInfo('bus')"><i class="bi bi-vector-pen"></i> Los Buses de Datos</button>
                <button class="btn-power" style="background-color:#e0f7f4; color:#1abc9c; border: 2px solid #1abc9c; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="playSound('sound-click'); showMbInfo('chipset')"><i class="bi bi-router-fill"></i> El Chipset (El Policía de Tránsito)</button>
            </div>

            <div id="mb-info-screen" style="border-left: 5px solid #1abc9c; background-color: #f2fbf9; padding: 15px; border-radius: 8px; margin-top: 15px; display: none; color: #2c3e50;"></div>
        </section>

        <section class="interactive-section" style="margin-top: 40px;">
            <h2><i class="bi bi-play-btn-fill" style="color: #e74c3c;"></i> ¡Mira los circuitos en pleno viaje!</h2>
            <p>¿Quieres ver un recorrido microscópico animado por encima de una tarjeta madre real? Disfruta este video instructivo:</p>
            
            <div class="video-container">
                <iframe src="https://www.youtube.com/embed/P_P8Z_gLd74" title="Cómo funciona la tarjeta madre" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </section>

        <section class="mb-simulation-container">
            <div style="text-align: center; margin-bottom: 25px;">
                <h2><i class="bi bi-circuit"></i> ¡Laboratorio de Ensamblaje: Arma la Placa Base!</h2>
                <p style="color: #b3d1cb;">La ciudad está vacía. Arrastra cada componente de hardware desde la caja de herramientas y encájalo en su conector correcto de la Tarjeta Madre.</p>
            </div>

            <div class="mb-inventory-box" id="inventory-box">
                <div class="mb-draggable-item" id="part-cpu" draggable="true" ondragstart="startMbDrag(event)">
                    <i class="bi bi-cpu"></i> Cerebro CPU
                </div>
                <div class="mb-draggable-item" id="part-ram" draggable="true" ondragstart="startMbDrag(event)">
                    <i class="bi bi-memory"></i> Memoria RAM
                </div>
                <div class="mb-draggable-item" id="part-gpu" draggable="true" ondragstart="startMbDrag(event)">
                    <i class="bi bi-gpu-card"></i> Placa Gráfica
                </div>
            </div>

            <div class="mb-sockets-grid">
                
                <div class="mb-socket-slot" id="slot-cpu" ondragover="allowMbDrop(event)" ondrop="handleMbDrop(event, 'cpu')">
                    <i class="bi bi-square-fill"></i>
                    <h4>Zócalo (Socket)</h4>
                    <span id="lbl-cpu" style="font-size: 0.75rem; color:#84a9a0;">[Pon el Cerebro aquí]</span>
                </div>

                <div class="mb-socket-slot" id="slot-ram" ondragover="allowMbDrop(event)" ondrop="handleMbDrop(event, 'ram')">
                    <i class="bi bi-grid-3x2-gap-fill"></i>
                    <h4>Ranuras DIMM</h4>
                    <span id="lbl-ram" style="font-size: 0.75rem; color:#84a9a0;">[Pon la RAM aquí]</span>
                </div>

                <div class="mb-socket-slot" id="slot-gpu" ondragover="allowMbDrop(event)" ondrop="handleMbDrop(event, 'gpu')">
                    <i class="bi bi-pci-card"></i>
                    <h4>Puerto PCI-Express</h4>
                    <span id="lbl-gpu" style="font-size: 0.75rem; color:#84a9a0;">[Pon la Gráfica aquí]</span>
                </div>

            </div>

            <div class="bus-data-tracks" id="mb-feedback">
                ⚡ Estado de la Placa: Esperando componentes básicos para iniciar el escaneo POST...
            </div>
        </section>

    </main>

    <footer class="main-footer" style="background-color: #1abc9c;">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware Especial para Niños</p>
    </footer>

    <script>
        let componentesInstalados = { cpu: false, ram: false, gpu: false };
        let totalInstalados = 0;

        function playSound(id) {
            const sound = document.getElementById(id);
            if (sound) {
                sound.currentTime = 0;
                sound.play().catch(e => {});
            }
        }

        function showMbInfo(type) {
            const screen = document.getElementById('mb-info-screen');
            screen.style.display = "block";
            
            if(type === 'bus') {
                screen.innerHTML = "<h4>🚌 Los Buses: Las Súper Autopistas de Cobre</h4><p>Son los miles de pelitos e hilos dorados que ves pintados en la placa. Funcionan como cables microscópicos que llevan cartas digitales llenas de ceros y unos de un componente a otro a la velocidad de la luz.</p>";
            } else if(type === 'chipset') {
                screen.innerHTML = "<h4>👮 El Chipset: El Policía de Tránsito Inteligente</h4><p>Es un pequeño chip pegado a la tarjeta madre que se encarga de dirigir el tráfico de datos. Si la RAM y el disco duro hablan a la vez, el Chipset decide quién pasa primero para que no choquen ni se pierdan los archivos.</p>";
            }
        }

        function startMbDrag(ev) {
            ev.dataTransfer.setData("textPartId", ev.target.id);
        }

        function allowMbDrop(ev) {
            ev.preventDefault();
        }

        function handleMbDrop(ev, tipoSlot) {
            ev.preventDefault();
            const idArrastrado = ev.dataTransfer.setData ? ev.dataTransfer.getData("textPartId") : ev.dataTransfer.getData("text");
            const idReal = idArrastrado || window.event.dataTransfer.getData("textPartId");

            if (idReal === 'part-' + tipoSlot && !componentesInstalados[tipoSlot]) {
                componentesInstalados[tipoSlot] = true;
                totalInstalados++;
                playSound('sound-click-part');

                document.getElementById(idReal).style.display = "none";
                
                const conector = document.getElementById('slot-' + tipoSlot);
                conector.classList.add('installed');
                
                if(tipoSlot === 'cpu') conector.querySelector('i').className = "bi bi-cpu-fill";
                if(tipoSlot === 'ram') conector.querySelector('i').className = "bi bi-memory";
                if(tipoSlot === 'gpu') conector.querySelector('i').className = "bi bi-gpu-card";

                document.getElementById('lbl-' + tipoSlot).innerHTML = "✅ ¡INSTALADO CORRECTAMENTE!";

                verificarSistemaPost();
            } else {
                const feedback = document.getElementById('mb-feedback');
                feedback.innerHTML = "❌ ¡ERROR DE MONTAJE! Esa pieza no entra en este conector. ¡Mira bien las patitas!";
                feedback.style.color = "#ef4444";
            }
        }

        function verificarSistemaPost() {
            const feedback = document.getElementById('mb-feedback');
            
            if (totalInstalados === 1) {
                feedback.innerHTML = "📡 [Pistas de Cobre Activas] Detectado el primer flujo de datos en el canal Norte.";
                feedback.style.color = "#38bdf8";
            } else if (totalInstalados === 2) {
                feedback.innerHTML = "⚡ [Energía Estable] Conexiones en paralelo listas. Falta un componente para cerrar el circuito total.";
                feedback.style.color = "#fbbf24";
            } else if (totalInstalados === 3) {
                playSound('sound-success');
                feedback.className = "bus-data-tracks data-stream-active";
                feedback.style.color = "#2ecc71";
                feedback.style.borderColor = "#2ecc71";
                feedback.innerHTML = "🎉 <strong>¡PRUEBA POST COMPLETA: SISTEMA OPERATIVO OK!</strong> La tarjeta madre ha enlazado el cerebro, la memoria y el video con éxito. Las pistas de cobre brillan y la información corre libre a billones de procesos por segundo. ¡Eres un maestro de la arquitectura técnica! 👩‍💻👨‍💻⚡";
                
                document.getElementById('inventory-box').style.display = "none";
            }
        }
    </script>
</body>
</html>