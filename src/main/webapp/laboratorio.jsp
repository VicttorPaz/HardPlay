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
        bitacoraHelper.registrarAccionBitacora(alumnoActivo, "El estudiante ingresó e interactuó con el Laboratorio 3D Avanzado");
    }
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Estación Holográfica 3D</title>
    <link rel="stylesheet" href="style/style.css">
    <link rel="stylesheet" href="style/hardware.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/3.5.0/model-viewer.min.js"></script>
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
                        <a href="madre.jsp"><i class="bi bi-circuit"></i> Tarjeta Madre</a>
                        <a href="procesador.jsp"><i class="bi bi-cpu"></i> El Procesador</a>
                        <a href="ram.jsp"><i class="bi bi-memory"></i> Memoria RAM</a>
                        <a href="almacenamiento.jsp"><i class="bi bi-hdd-fill"></i> Almacenamiento</a>
                        <a href="grafica.jsp"><i class="bi bi-gpu-card"></i> Tarjeta Gráfica</a>
                        <a href="fuente.jsp"><i class="bi bi-lightning-charge-fill"></i> Fuente de Poder</a>
                    </div>
                </li>
                <li><a href="laboratorio.jsp" class="active">Laboratorio 3D</a></li>
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

    <main class="lab-premium-container">
        
        <header class="lab-dynamic-header">
            <h1><i class="bi bi-shield-shaded text-neon"></i> Estación de Escaneo Cyber-3D</h1>
            <p>Selecciona un componente de la bahía inferior para cargarlo en el escáner holográfico principal.</p>
        </header>

        <section class="hologram-workspace">
            
            <div class="main-hologram-viewer">
                <div class="laser-scanner-line"></div>
                
                <model-viewer id="main-scanned-model" src="3d/processor.glb" auto-rotate camera-controls 
                    disable-pan interaction-prompt="none" shadow-intensity="1.5" exposure="1.2">
                    
                    <button class="hotspot-node" id="hotspot-1" slot="hotspot-core" data-position="0m 0.02m 0m" data-normal="0m 1m 0m">
                        <div class="hotspot-annotation" id="annotation-1">Núcleo Central: El cerebro donde ocurren los cálculos súper rápidos.</div>
                    </button>
                    <button class="hotspot-node" id="hotspot-2" slot="hotspot-pins" data-position="0m -0.01m 0.05m" data-normal="0m -1m 0m">
                        <div class="hotspot-annotation" id="annotation-2">Pines de Contacto: Patitas de oro que envían datos a la tarjeta madre.</div>
                    </button>
                </model-viewer>
            </div>

            <div class="hologram-data-sidebar" id="scanned-sidebar-data">
                <div class="tech-matrix-header">
                    <span class="status-indicator-blink"></span>
                    <h2 id="meta-title">Procesador (CPU)</h2>
                </div>
                
                <div class="data-scroll-body">
                    <div class="stat-badge-row">
                        <span class="cyber-badge" id="meta-category">Cerebro del Sistema</span>
                        <span class="cyber-badge code-color">ID: HARD-01</span>
                    </div>
                    
                    <p class="tech-description" id="meta-description">
                        Es el encargado de ejecutar todas las órdenes que le das al ordenador. Cada clic, movimiento del mouse o bloque que pones en tus videojuegos pasa por aquí primero.
                    </p>

                    <div class="spec-list-panel">
                        <h4><i class="bi bi-activity"></i> Análisis de Frecuencia</h4>
                        <ul id="meta-specs">
                            <li><i class="bi bi-cpu-fill"></i> **Función:** Pensar y calcular órdenes muy rápido.</li>
                            <li><i class="bi bi-thermometer-half"></i> **Cuidado especial:** ¡Se calienta mucho! Requiere ventilador.</li>
                            <li><i class="bi bi-lightning-fill"></i> **Súper Dato:** ¡Puede procesar miles de millones de tareas en un solo segundo!</li>
                        </ul>
                    </div>
                </div>

                <a href="procesador.jsp" id="meta-link" class="btn-cyber-action">
                    Estudiar Módulo Teórico <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </section>

        <h3 class="bay-title"><i class="bi bi-hdd-rack"></i> Bahía de Componentes Disponibles</h3>
        <section class="hardware-selection-bay">
            
            <div class="bay-card active" onclick="loadComponentInScanner('processor', this)">
                <div class="bay-preview-icon"><i class="bi bi-cpu"></i></div>
                <div class="bay-info">
                    <h4>Procesador</h4>
                    <span>Unidad CPU</span>
                </div>
            </div>

            <div class="bay-card" onclick="loadComponentInScanner('ram', this)">
                <div class="bay-preview-icon"><i class="bi bi-memory"></i></div>
                <div class="bay-info">
                    <h4>Memoria RAM</h4>
                    <span>Almacenamiento Volátil</span>
                </div>
            </div>

            <div class="bay-card" onclick="loadComponentInScanner('motherboard', this)">
                <div class="bay-preview-icon"><i class="bi bi-circuit"></i></div>
                <div class="bay-info">
                    <h4>Tarjeta Madre</h4>
                    <span>Estructura Base</span>
                </div>
            </div>

            <div class="bay-card" onclick="loadComponentInScanner('ssd', this)">
                <div class="bay-preview-icon"><i class="bi bi-device-ssd-fill"></i></div>
                <div class="bay-info">
                    <h4>Disco SSD M.2</h4>
                    <span>Almacenamiento Masivo</span>
                </div>
            </div>

            <div class="bay-card" onclick="loadComponentInScanner('gpu', this)">
                <div class="bay-preview-icon"><i class="bi bi-gpu-card"></i></div>
                <div class="bay-info">
                    <h4>Tarjeta Gráfica</h4>
                    <span>Procesamiento de Video</span>
                </div>
            </div>

            <div class="bay-card" onclick="loadComponentInScanner('power_supply', this)">
                <div class="bay-preview-icon"><i class="bi bi-lightning-charge-fill"></i></div>
                <div class="bay-info">
                    <h4>Fuente de Poder</h4>
                    <span>Energía del Sistema</span>
                </div>
            </div>

        </section>

    </main>

    <footer class="main-footer">
        <p>&copy; 2026 HardLearn - Estación de Simulación de Hardware</p>
    </footer>

    <script>
       
        const hardwareDatabase = {
            processor: {
                title: "Procesador (CPU)",
                category: "Cerebro del Sistema",
                file3d: "3d/processor.glb",
                description: "Es el encargado de ejecutar todas las órdenes que le das al ordenador. Cada clic, movimiento del mouse o bloque que pones en tus videojuegos pasa por aquí primero.",
                link: "procesador.jsp",
                specs: [
                    "**Función:** Pensar y calcular órdenes muy rápido.",
                    "**Cuidado especial:** ¡Se calienta mucho! Requiere ventilador.",
                    "**Súper Dato:** ¡Puede procesar miles de millones de tareas en un solo segundo!"
                ],
                hotspots: [
                    { id: "hotspot-1", pos: "0m 0.02m 0m", text: "Núcleo Central: El cerebro donde ocurren los cálculos súper rápidos." },
                    { id: "hotspot-2", pos: "0m -0.01m 0.05m", text: "Pines de Contacto: Patitas de oro que envían datos a la tarjeta madre." }
                ]
            },
            ram: {
                title: "Memoria RAM",
                category: "Mesa de Trabajo Rápida",
                file3d: "3d/ram.glb",
                description: "Una memoria ultra-veloz que guarda temporalmente las aplicaciones abiertas. Si apagas el computador, recuerda que esta tarjeta lo olvida todo de inmediato.",
                link: "ram.jsp",
                specs: [
                    "**Función:** Tener muchas pestañas y apps abiertas al mismo tiempo.",
                    "**Estado Eléctrico:** Es volátil (necesita energía para recordar cosas).",
                    "**Velocidad:** Súper veloz comparada con cualquier tipo de disco duro."
                ],
                hotspots: [
                    { id: "hotspot-1", pos: "0.04m 0.01m 0m", text: "Chips de Memoria: Bloques negros de silicio que retienen las texturas de tus juegos." },
                    { id: "hotspot-2", pos: "-0.05m -0.01m 0m", text: "Pines de Conexión: Se insertan a presión en las ranuras de la tarjeta madre." }
                ]
            },
            motherboard: {
                title: "Tarjeta Madre",
                category: "Sistema de Autopistas",
                file3d: "3d/motherboard.glb",
                description: "Es la placa de circuito más grande del equipo. Su única y gran misión es funcionar como una gran ciudad conectando todas las partes mediante caminos de cobre.",
                link: "madre.jsp",
                specs: [
                    "**Función:** Unir el procesador, la RAM, los discos y la energía.",
                    "**Componentes:** Llena de condensadores, resistencias y ranuras PCIe.",
                    "**Importancia:** Sin ella, las piezas individuales no sabrían cómo comunicarse."
                ],
                hotspots: [
                    { id: "hotspot-1", pos: "0m 0.01m 0m", text: "Socket del CPU: El asiento especial con palanca metálica donde encaja el procesador." },
                    { id: "hotspot-2", pos: "0.06m 0.02m 0.03m", text: "Puertos Traseros: Entradas para los cables USB, pantallas y de internet." }
                ]
            },
            ssd: {
                title: "Disco SSD M.2",
                category: "Baúl de Archivos Seguro",
                file3d: "3d/ssd.glb",
                description: "A diferencia de la RAM, este disco es un baúl súper seguro que retiene de forma permanente tus juegos, fotos y sistema operativo aunque la PC esté apagada.",
                link: "almacenamiento.jsp",
                specs: [
                    "**Función:** Guardar todo permanentemente para que no se pierda.",
                    "**Evolución:** No tiene partes móviles internas, por eso no hace ruido.",
                    "**Velocidad:** Enciende la computadora en menos de 10 segundos."
                ],
                hotspots: [
                    { id: "hotspot-1", pos: "0m 0m 0m", text: "Memoria NAND Flash: El espacio físico real donde se empaquetan tus archivos." },
                    { id: "hotspot-2", pos: "-0.04m 0m 0m", text: "Chip Controlador: El director de orquesta que organiza dónde se escribe cada foto." }
                ]
            },
            gpu: {
                title: "Tarjeta Gráfica (GPU)",
                category: "Fábrica de Colores y Mundos",
                file3d: "3d/grafica.glb",
                description: "Es una pieza ultra-potente especializada en pintar los gráficos en tu pantalla. Se encarga de dar vida a los mundos 3D de tus juegos favoritos de forma fluida y sin trabas.",
                link: "grafica.jsp",
                specs: [
                    "**Función:** Dibujar imágenes y entornos en 3D súper detallados a gran velocidad.",
                    "**Memoria propia:** Cuenta con su propia memoria ultra-rápida llamada VRAM.",
                    "**Poder:** ¡Puede procesar los reflejos de luz y las sombras en tiempo real!"
                ],
                hotspots: [
                    { id: "hotspot-1", pos: "0m 0.03m 0m", text: "Ventiladores de Enfriamiento: Giran velozmente para sacar el calor cuando juegas en máxima resolución." },
                    { id: "hotspot-2", pos: "-0.06m 0m 0.02m", text: "Conector PCIe: La línea dorada que encaja en la tarjeta madre para pasar datos multimedia." }
                ]
            },
            power_supply: {
                title: "Fuente de Poder",
                category: "Corazón Energético",
                file3d: "3d/fuente.glb",
                description: "Es el motor de energía. Toma la corriente de la pared de tu casa y la transforma en una electricidad suave y segura que todos los componentes necesitan para encender.",
                link: "fuente.jsp",
                specs: [
                    "**Función:** Darle energía y vida a todo el computador.",
                    "**Certificación:** Regula el voltaje para evitar que los circuitos se quemen.",
                    "**Poder:** Se mide en Watts (W); entre más potentes tus piezas, más Watts necesitas."
                ],
                hotspots: [
                    { id: "hotspot-1", pos: "0m 0m 0.05m", text: "Manojo de Cables: Autopistas de energía de colores que viajan a la placa base y discos." },
                    { id: "hotspot-2", pos: "0m 0m -0.05m", text: "Ventilador Interno: Mantiene la fuente fresca para que nunca deje de mandar energía." }
                ]
            }
        };

        function loadComponentInScanner(key, cardElement) {
            const data = hardwareDatabase[key];
            if (!data) return;

            document.querySelectorAll('.bay-card').forEach(card => card.classList.remove('active'));
            cardElement.classList.add('active');

            document.getElementById('meta-title').innerText = data.title;
            document.getElementById('meta-category').innerText = data.category;
            document.getElementById('meta-description').innerText = data.description;
            document.getElementById('meta-link').href = data.link;

            const specsContainer = document.getElementById('meta-specs');
            specsContainer.innerHTML = '';
            
            const icons = ['bi-activity', 'bi-shield-check', 'bi-rocket-takeoff-fill'];
            data.specs.forEach((spec, index) => {
                const li = document.createElement('li');
                li.innerHTML = `<i class="bi \${icons[index] || 'bi-dot'}"></i> \${spec}`;
                specsContainer.appendChild(li);
            });

            const viewer = document.getElementById('main-scanned-model');
            viewer.src = data.file3d;

            if(data.hotspots && data.hotspots.length >= 2) {
                const h1 = document.getElementById('hotspot-1');
                const h2 = document.getElementById('hotspot-2');
                
                h1.setAttribute('data-position', data.hotspots[0].pos);
                document.getElementById('annotation-1').innerText = data.hotspots[0].text;
                
                h2.setAttribute('data-position', data.hotspots[1].pos);
                document.getElementById('annotation-2').innerText = data.hotspots[1].text;
            }
        }
    </script>
  
</body>
</html>