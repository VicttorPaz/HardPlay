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
    // Recuperamos al alumno de la sesión
    String alumnoActivo = (String) session.getAttribute("usuarioLogueado");
    
    if (alumnoActivo != null) {
        // Si hay una sesión activa, guardamos su movimiento en la base de datos
        com.usuarios.seguridad.Usuario bitacoraHelper = new com.usuarios.seguridad.Usuario();
        bitacoraHelper.registrarAccionBitacora(alumnoActivo, "El estudiante ingresó e interactuó con el Laboratorio 3D");
    }
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Laboratorio 3D</title>
    <link rel="stylesheet" href="style/style.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/3.5.0/model-viewer.min.js"></script>
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

    <main class="lab-container">
        
        <section class="lab-header">
            <h1><i class="bi bi-box-seam-fill"></i> Laboratorio de Modelos 3D</h1>
            <p>¡Interactúa directamente con el hardware en tres dimensiones! Haz zoom, gira y examina cada detalle electrónico.</p>
        </section>

        <section class="lab-grid">
            
            <article class="lab-card">
                <div class="viewer-container">
                    <span class="badge-explore">Cerebro</span>
                    <model-viewer src="3d/processor.glb" auto-rotate camera-controls disable-pan
                        interaction-prompt="none" shadow-intensity="1">
                    </model-viewer>
                </div>
                <div class="lab-card-body">
                    <h3><i class="bi bi-cpu"></i> Procesador (CPU)</h3>
                    <p>Usa el mouse para arrastrar, rotar y hacer zoom sobre la estructura física de la pieza. ¡Mira sus pequeños pines!</p>
                    <a href="procesador.jsp" class="btn-lab">Explorar Teoría <i class="bi bi-arrow-right-short"></i></a>
                </div>
            </article>

            <article class="lab-card">
                <div class="viewer-container">
                    <span class="badge-explore">Memoria</span>
                    <model-viewer src="3d/ram.glb" auto-rotate camera-controls disable-pan
                        interaction-prompt="none" shadow-intensity="1">
                    </model-viewer>
                </div>
                <div class="lab-card-body">
                    <h3><i class="bi bi-memory"></i> Memoria RAM</h3>
                    <p>Usa el mouse para arrastrar, rotar y hacer zoom sobre la estructura física de la pieza. ¡Observa los módulos negros!</p>
                    <a href="ram.jsp" class="btn-lab">Explorar Teoría <i class="bi bi-arrow-right-short"></i></a>
                </div>
            </article>

            <article class="lab-card">
                <div class="viewer-container">
                    <span class="badge-explore">Conectividad</span>
                    <model-viewer src="3d/motherboard.glb" auto-rotate camera-controls disable-pan
                        interaction-prompt="none" shadow-intensity="1">
                    </model-viewer>
                </div>
                <div class="lab-card-body">
                    <h3><i class="bi bi-device-ssd"></i> Tarjeta Madre</h3>
                    <p>Usa el mouse para arrastrar, rotar y hacer zoom. Aquí es donde se conectan absolutamente todos los componentes del PC.</p>
                    <a href="index.jsp" class="btn-lab">Ver Más <i class="bi bi-arrow-right-short"></i></a>
                </div>
            </article>

            <article class="lab-card">
                <div class="viewer-container">
                    <span class="badge-explore">Almacenamiento</span>
                    <model-viewer src="3d/ssd.glb" auto-rotate camera-controls disable-pan
                        interaction-prompt="none" shadow-intensity="1">
                    </model-viewer>
                </div>
                <div class="lab-card-body">
                    <h3><i class="bi bi-hdd-fill"></i> Disco SSD M.2</h3>
                    <p>Usa el mouse para arrastrar, rotar y hacer zoom. Es un tipo de disco ultra veloz que guarda tus juegos y fotos.</p>
                    <a href="almacenamiento.jsp" class="btn-lab">Explorar Teoría <i class="bi bi-arrow-right-short"></i></a>
                </div>
            </article>
            
        </section>

       

    </main>

    <footer class="main-footer">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware</p>
    </footer>

</body>
</html>