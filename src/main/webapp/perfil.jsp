<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.usuarios.datos.Conexion" %>
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

    // CANDADO DE SEGURIDAD: Si no hay sesión iniciada, directo al login
    if (apodoLogueado == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    if (avatarLogueado == null) {
        avatarLogueado = "robot";
    }

    String emailBD = "";
    String estadoBD = "ACTIVO";
    int rolBD = 2;

    Conexion con = new Conexion();
    Connection c = con.getConexion();

    if (c != null) {
        try {
            String sql = "SELECT parent_email, estado, id_per FROM tb_usuarios WHERE username = ?";
            try (PreparedStatement ps = c.prepareStatement(sql)) {
                ps.setString(1, apodoLogueado);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        emailBD = rs.getString("parent_email");
                        estadoBD = rs.getString("estado");
                        rolBD = rs.getInt("id_per");
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al cargar perfil: " + e.getMessage());
        } finally {
            try { c.close(); } catch (Exception e) {}
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Mi Perfil</title>
    <link rel="stylesheet" href="style/style.css">
    <link rel="stylesheet" href="style/perfil.css">
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
            
            <div class="user-profile-logged">
                <div class="user-info-text">
                    <span class="user-welcome">¡Hola!</span>
                    <span class="user-nickname"><%= apodoLogueado %></span>
                </div>
                <div class="avatar-container-nav">
                    <img id="nav-avatar-img" src="https://api.dicebear.com/7.x/bottts/svg?seed=<%= "gato".equals(avatarLogueado) ? "cat" : avatarLogueado %>" alt="Avatar">
                </div>
                <div class="profile-dropdown-menu">
                    <a href="perfil.jsp"><i class="bi bi-person-bounding-box"></i> Mi Perfil</a>
                    <a href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Salir del Juego</a>
                </div>
            </div>
        </nav>
    </header>

    <main class="profile-main-layout">
        
        <section class="profile-left-column">
            <div class="main-identity-card">
                <div class="avatar-glow-ring">
                    <img id="main-avatar-display" src="https://api.dicebear.com/7.x/bottts/svg?seed=<%= "gato".equals(avatarLogueado) ? "cat" : avatarLogueado %>" alt="Avatar Grande">
                </div>
                
                <h2 class="profile-username">@<%= apodoLogueado %></h2>
                <span class="badge-role <%= rolBD == 1 ? "badge-admin" : "badge-student" %>">
                    <i class="bi <%= rolBD == 1 ? "bi-shield-fill-check" : "bi-controller" %>"></i>
                    <%= rolBD == 1 ? "Administrador" : "Cadete de Hardware" %>
                </span>

                <div class="level-system-container">
                    <div class="level-tags">
                        <span class="current-level-text">Nivel 4</span>
                        <span class="xp-numeric">350 / 500 XP</span>
                    </div>
                    <div class="xp-progress-bar">
                        <div class="xp-fill-line" style="width: 70%;"></div>
                    </div>
                    <p class="next-rank-hint">¡Te faltan 150 XP para subir al rango **Ingeniero Junior**!</p>
                </div>

                <div class="parent-contact-box">
                    <i class="bi bi-envelope-heart-fill"></i>
                    <div>
                        <label>Correo del Representante</label>
                        <span><%= emailBD != null && !emailBD.isEmpty() ? emailBD : "No asociado" %></span>
                    </div>
                </div>

                <a href="index.jsp" class="btn-exit-profile">
                    <i class="bi bi-house-door-fill"></i> Volver a la Base
                </a>
            </div>
        </section>

        <section class="profile-right-column">
            
            <div class="interactive-panel-box">
                <h3><i class="bi bi-palette-fill text-green"></i> Laboratorio de Avatares</h3>
                <p>Personaliza tu apariencia robótica para el juego. Elige tu aspecto base favorito:</p>
                
                <div class="avatar-options-grid">
                    <button class="avatar-seed-btn" onclick="changeAvatarPreview('cat')">🐱 GatoBot</button>
                    <button class="avatar-seed-btn" onclick="changeAvatarPreview('robot')">🤖 Classic</button>
                    <button class="avatar-seed-btn" onclick="changeAvatarPreview('sparky')">⚡ Sparky</button>
                    <button class="avatar-seed-btn" onclick="changeAvatarPreview('rex')">🦖 DinoBot</button>
                    <button class="avatar-seed-btn" onclick="changeAvatarPreview('shadow')">🥷 Shadow</button>
                    <button class="avatar-seed-btn" onclick="changeAvatarPreview('luna')">🚀 Luna</button>
                </div>

                <form action="ActualizarAvatarServlet" method="POST" class="save-avatar-form">
                    <input type="hidden" id="selected-avatar-input" name="nuevoAvatar" value="<%= avatarLogueado %>">
                    <button type="submit" class="btn-save-custom">
                        <i class="bi bi-cloud-arrow-up-fill"></i> Guardar Traje en la Base de Datos
                    </button>
                </form>
            </div>

            <div class="interactive-panel-box">
                <h3><i class="bi bi-trophy-fill text-gold"></i> Tus Medallas de Misión</h3>
                <p>Cada vez que completas laboratorios o destruyes errores de la RAM, desbloqueas insignias:</p>
                
                <div class="badges-showcase-grid">
                    <div class="medal-card unlocked">
                        <div class="medal-icon-shell"><i class="bi bi-cpu-fill"></i></div>
                        <h4>Primer Procesador</h4>
                        <p>Abriste el módulo central del procesador.</p>
                    </div>

                    <div class="medal-card unlocked">
                        <div class="medal-icon-shell"><i class="bi bi-lightning-charge-fill"></i></div>
                        <h4>Limpiador de RAM</h4>
                        <p>Evitaste un pantallazo azul en el juego de velocidad.</p>
                    </div>

                    <div class="medal-card locked">
                        <div class="medal-icon-shell"><i class="bi bi-motherboard-fill"></i></div>
                        <h4>Armador Maestro</h4>
                        <p>Completa el Quiz final sin cometer ningún error.</p>
                        <span class="lock-tag"><i class="bi bi-lock-fill"></i> Bloqueado</span>
                    </div>
                </div>
            </div>

        </section>
    </main>

    <footer class="main-footer">
        <p>&copy; 2026 HardLearn - Proyecto Educativo de Hardware Especial para Niños</p>
    </footer>

    <script>
        function changeAvatarPreview(seedName) {
            // Re-renderizar las imágenes en la interfaz al instante para feedback visual del niño
            const newUrl = "https://api.dicebear.com/7.x/bottts/svg?seed=" + seedName;
            document.getElementById('main-avatar-display').src = newUrl;
            document.getElementById('nav-avatar-img').src = newUrl;
            
            // Guardar el nombre seleccionado en el input oculto del formulario
            document.getElementById('selected-avatar-input').value = seedName;
        }
    </script>
<%@ include file="asistente.jsp" %>
</body>
</html>