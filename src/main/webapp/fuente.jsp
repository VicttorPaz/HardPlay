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
        bitacoraHelper.registrarAccionBitacora(alumnoActivo, "El estudiante jugó al Laboratorio de Voltaje de la Fuente de Poder");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - La Fuente de Poder</title>
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

    <audio id="sound-click" src="https://assets.mixkit.co/active_storage/sfx/2568/2568-84.wav" preload="auto"></audio>
    <audio id="sound-success" src="https://assets.mixkit.co/active_storage/sfx/1435/1435-84.wav" preload="auto"></audio>
    <audio id="sound-zap" src="https://assets.mixkit.co/active_storage/sfx/2869/2869-84.wav" preload="auto"></audio>

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
            <h2>La Fuente de Poder: El Corazón Eléctrico ⚡</h2>
            <p>Imagina que la computadora es un cuerpo humano. El procesador es el cerebro... ¿pero quién es el corazón que envía la energía para que todo funcione? ¡Es la <strong>Fuente de Poder (o PSU)</strong>!</p>
            <p>Ella recibe la electricidad súper fuerte del enchufe de tu pared, la transforma en energía suave y limpia, y la reparte a través de cables de colores a cada rincón de la PC. ¡Sin ella, ningún juego podría encender!</p>
            
            <div class="processor-box psu-theme-color" style="font-size: 4rem; text-align: center; margin: 20px 0;">
                <i class="bi bi-lightning-charge-fill"></i>
            </div>
            
            <h3>¿Qué transformaciones mágicas hace la Fuente?</h3>
            <p>Haz clic en los botones para descubrir los dos tipos de corrientes que maneja este componente:</p>
            
            <div class="power-buttons" style="display: flex; gap: 15px; justify-content: center; margin: 20px 0;">
                <button class="btn-power" style="background-color:#fff3e0; color:#e67e22; border: 2px solid #e67e22; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="playSound('sound-click'); showPsuInfo('ac')"><i class="bi bi-activity"></i> Corriente Alterna (Peligrosa)</button>
                <button class="btn-power" style="background-color:#fff3e0; color:#e67e22; border: 2px solid #e67e22; padding: 10px 20px; border-radius: 12px; font-weight: bold; cursor: pointer;" onclick="playSound('sound-click'); showPsuInfo('dc')"><i class="bi bi-align-middle"></i> Corriente Continua (Segura)</button>
            </div>

            <div id="psu-info-screen" style="border-left: 5px solid #e67e22; background-color: #fffaf0; padding: 15px; border-radius: 8px; margin-top: 15px; display: none; color: #334155;"></div>
        </section>

        <section class="interactive-section" style="margin-top: 40px;">
            <h2><i class="bi bi-play-btn-fill" style="color: #e74c3c;"></i> ¡Mira la corriente fluir por los cables!</h2>
            <p>¿Quieres ver cómo se distribuyen los cables de colores dentro de una computadora real? Mira este increíble video explicativo:</p>
            
            <div class="video-container">
                <iframe src="https://www.youtube.com/embed/5D_unmYvMJI" title="Cómo funciona la fuente de poder" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </section>

        <section class="interactive-section" style="margin-top: 40px;">
            <h2><i class="bi bi-shield-fill-check" style="color: #e67e22;"></i> ¿Cómo protege la Fuente a tu PC?</h2>
            <p class="mb-3">La fuente de poder no solo da energía, ¡también actúa como un escudo protector! Gira las tarjetas para descubrir sus superpoderes:</p>
            
            <div class="features-grid">
                <div class="part-flip-card" onclick="playSound('sound-click')">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #ff9f43; color: white; padding: 20px; border-radius: 15px; text-align: center; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                            <img src="https://images.unsplash.com/photo-1620288627223-53302f4e8c74?w=150&auto=format&fit=crop&q=60" alt="Filtro" class="hardware-img" style="border-radius:10px;">
                            <h4>Limpiador Eléctrico</h4>
                            <span>(Filtro de Ruido)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>La corriente de la calle a veces viene con pequeñas olas sucias. La fuente las aplana y limpia para que los chips internos no sufran dolores de cabeza.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card" onclick="playSound('sound-click')">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #ee5253; color: white; padding: 20px; border-radius: 15px; text-align: center; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                            <img src="https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=150&auto=format&fit=crop&q=60" alt="Corto" class="hardware-img" style="border-radius:10px;">
                            <h4>Escudo Anti-Cortos</h4>
                            <span>(Fusible de Apagado)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Si un rayo cae cerca de casa o un cable choca, la fuente se apaga a sí misma al instante para salvar la vida de toda la computadora.</p>
                        </div>
                    </div>
                </div>

                <div class="part-flip-card" onclick="playSound('sound-click')">
                    <div class="card-inner">
                        <div class="card-front" style="background-color: #10ac84; color: white; padding: 20px; border-radius: 15px; text-align: center; display:flex; flex-direction:column; align-items:center; justify-content:center;">
                            <img src="https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=150&auto=format&fit=crop&q=60" alt="Certificación" class="hardware-img" style="border-radius:10px;">
                            <h4>Ahorro de Energía</h4>
                            <span>(Certificado 80 Plus)</span>
                        </div>
                        <div class="card-back" style="padding: 20px;">
                            <p>Las fuentes buenas no desperdician luz ni calientan de más la habitación, aprovechando hasta el último electrón de energía de forma ecológica.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="psu-simulation-container">
            <div style="text-align: center; margin-bottom: 25px;">
                <h2>🔌 ¡Laboratorio Avanzado: Conecta y Regula el Voltaje!</h2>
                <p style="color: #cbd5e1;">Misión doble: 1️⃣ Arrastra los cables a su componente correspondiente. 2️⃣ Gira el potenciómetro hasta lograr el voltaje ideal (**12 Voltios**) para que los motores arranquen.</p>
            </div>

            <div class="cable-toolbox">
                <div class="draggable-cable" id="cable-atx" draggable="true" ondragstart="startCableDrag(event)">
                    <i class="bi bi-bezier2"></i> Cable de Tarjeta
                </div>
                <div class="draggable-cable" id="cable-pcie" draggable="true" ondragstart="startCableDrag(event)">
                    <i class="bi bi-cpu-fill"></i> Cable de Cerebro
                </div>
            </div>

            <div class="psu-drop-grid">
                
                <div class="psu-receiver-card" id="target-atx" ondragover="allowCableDrop(event)" ondrop="handleCableDrop(event, 'atx')">
                    <i class="bi bi-gpu-card"></i>
                    <h4>Ranura de la Placa</h4>
                    <span id="label-atx" style="font-size: 0.8rem; color:#94a3b8;">[Suelta el Cable de Tarjeta aquí]</span>
                </div>

                <div class="psu-receiver-card" id="target-pcie" ondragover="allowCableDrop(event)" ondrop="handleCableDrop(event, 'pcie')">
                    <i class="bi bi-cpu"></i>
                    <h4>Ranura del Procesador</h4>
                    <span id="label-pcie" style="font-size: 0.8rem; color:#94a3b8;">[Suelta el Cable de Cerebro aquí]</span>
                </div>

            </div>

            <div class="voltage-control-box">
                <h3 style="margin-bottom: 5px;"><i class="bi bi-speedometer"></i> Potenciómetro Regulador: <span id="val-volt" style="color: #ef4444;">0V</span></h3>
                <p style="font-size: 0.85rem; color: #a7f3d0; margin: 0;">Mueve la barra para calibrar la salida de los transformadores internos:</p>
                
                <input type="range" min="0" max="24" value="0" class="voltage-slider" id="slider-voltage" oninput="evaluateCircuitState()">
                
                <div id="psu-feedback" style="margin-top: 15px; padding: 12px; border-radius: 8px; background: #0f172a; border-left: 5px solid #e67e22;">
                    🛠️ Primero toma los cables de la caja superior y conéctalos en las ranuras vacías.
                </div>
            </div>

            <div style="text-align: center; margin-top: 25px;">
                <i class="bi bi-fan psu-fan-spin" id="psu-fan" style="font-size: 4rem; color: #475569;"></i>
                <div style="font-size: 0.8rem; color: #94a3b8; margin-top: 5px;">Extractor de Calor de la Fuente de Poder</div>
            </div>
        </section>

    </main>

    <footer class="main-footer" style="background-color: #e67e22;">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware Especial para Niños</p>
    </footer>

    <script>
        let cablesPuestos = { atx: false, pcie: false };
        let conteoConexiones = 0;

        function playSound(id) {
            const sound = document.getElementById(id);
            if (sound) {
                sound.currentTime = 0;
                sound.play().catch(e => {});
            }
        }

        function showPsuInfo(type) {
            const screen = document.getElementById('psu-info-screen');
            screen.style.display = "block";
            
            if(type === 'ac') {
                screen.innerHTML = "<h4>🔌 Corriente Alterna (AC): El Toro Salvaje de la Pared</h4><p>Es la energía que viaja por los cables postes de la calle y entra a los enchufes de tu casa. Se mueve dando saltos gigantescos muy rápidos. ¡Es muy fuerte y peligrosa para los circuitos pequeños de una computadora!</p>";
            } else if(type === 'dc') {
                screen.innerHTML = "<h4>🔋 Corriente Continua (DC): El Río Suave y Seguro</h4><p>Es la energía limpia y ordenada en línea recta que usan las baterías y los juguetes. La Fuente de Poder calma al 'toro salvaje' (AC) y lo convierte en este río tranquilo de electrones para alimentar la PC de forma segura.</p>";
            }
        }

        function startCableDrag(ev) {
            ev.dataTransfer.setData("cableId", ev.target.id);
        }

        function allowCableDrop(ev) {
            ev.preventDefault();
        }

        function handleCableDrop(ev, tipoRanura) {
            ev.preventDefault();
            const idCable = ev.dataTransfer.getData("cableId");

         
            if (idCable === 'cable-' + tipoRanura && !cablesPuestos[tipoRanura]) {
                cablesPuestos[tipoRanura] = true;
                conteoConexiones++;
                playSound('sound-zap');

                document.getElementById(idCable).style.visibility = "hidden";
                
                const card = document.getElementById('target-' + tipoRanura);
                card.classList.add('connected-ok');
                document.getElementById('label-' + tipoRanura).innerHTML = "⚡ ¡CABLE ENERGIZADO!";

                evaluateCircuitState();
            } else {
                const feedback = document.getElementById('psu-feedback');
                feedback.innerHTML = "❌ <strong>¡Error de Conexión!</strong> Ese cable no tiene la forma ni las patitas adecuadas para esa ranura del circuito.";
                feedback.style.borderLeftColor = "#ef4444";
            }
        }

       
        function evaluateCircuitState() {
            const voltValue = parseInt(document.getElementById('slider-voltage').value);
            document.getElementById('val-volt').innerText = voltValue + "V";
            
            const feedback = document.getElementById('psu-feedback');
            const fan = document.getElementById('psu-fan');

     
            if (conteoConexiones < 2) {
                feedback.innerHTML = "🔗 ¡Excelente! Has conectado (" + conteoConexiones + "/2) cables. Sigue conectando el resto antes de subir el voltaje.";
                document.getElementById('slider-voltage').value = 0;
                document.getElementById('val-volt').innerText = "0V";
                return;
            }

            
            if (voltValue === 0) {
                feedback.innerHTML = "🔋 Cables listos. Gira la barra de voltaje hacia la derecha para alimentar las líneas de cobre.";
                fan.style.animationPlayState = "paused";
                fan.style.color = "#475569";
            } else if (voltValue > 0 && voltValue < 12) {
                feedback.innerHTML = "⏳ El voltaje de " + voltValue + "V es muy bajito. Los ventiladores intentan moverse pero no tienen suficiente fuerza. ¡Sube más!";
                fan.style.animationPlayState = "running";
                fan.style.animationDuration = "2s"; 
                fan.style.color = "#f59e0b";
            } else if (voltValue === 12) {
          
                playSound('sound-success');
                feedback.innerHTML = "🎉 <strong>¡PERFECTO! 12 VOLTIOS EXACTOS.</strong> Es el voltaje estándar ideal. La placa madre encendió de forma estable, los motores giran al 100% y la PC está a salvo de sobrecargas. ¡Eres un gran electricista! 🚀🌟";
                feedback.style.borderLeftColor = "#2ecc71";
                fan.style.animationPlayState = "running";
                fan.style.animationDuration = "0.4s"; 
                fan.style.color = "#2ecc71";
            } else if (voltValue > 12 && voltValue <= 18) {
                feedback.innerHTML = "⚠️ <strong>¡CUIDADO!</strong> " + voltValue + "V es demasiado alto. Los circuitos están empezando a calentarse y a soltar pequeñas chispas virtuales. ¡Regrésalo a 12V!";
                feedback.style.borderLeftColor = "#e67e22";
                fan.style.color = "#e67e22";
                fan.style.animationDuration = "0.2s";
            } else if (voltValue > 18) {
        
                feedback.innerHTML = "💥 <strong>¡BUMM! ¡FUSIBLE QUEMADO!</strong> Enviaste " + voltValue + "V. La Fuente de Poder activó su protección anti-cortos y cortó la energía para que nada explote. ¡Bájalo a 0V para reiniciar el fusible!";
                feedback.style.borderLeftColor = "#ef4444";
                fan.style.animationPlayState = "paused";
                fan.style.color = "#ef4444";
            }
        }
    </script>
    <%@ include file="asistente.jsp" %>
</body>
</html>