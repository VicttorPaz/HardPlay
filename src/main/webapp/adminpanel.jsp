<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.usuarios.datos.Conexion" %>
<%
    HttpSession sesion = request.getSession(false);
    Integer rol = (sesion != null) ? (Integer) sesion.getAttribute("rolLogueado") : null;
    
    if (sesion == null || rol == null || rol != 1) {
        response.sendRedirect("login.jsp");
        return;
    }

    String apodoAdmin = (String) sesion.getAttribute("usuarioLogueado");
    Conexion con = new Conexion();
    Connection c = con.getConexion();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Panel de Administración</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f4f7f6; }
        .nav-admin { background-color: #2c3e50; }
        .card-custom { border: none; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg nav-admin navbar-dark shadow-sm py-3">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#"><i class="bi bi-shield-lock-fill me-2"></i>HardLearn Admin</a>
            <div class="d-flex align-items-center text-white">
                <span class="me-3"><i class="bi bi-person-circle me-1"></i> <%= apodoAdmin %></span>
                <a href="logout.jsp" class="btn btn-sm btn-outline-light"><i class="bi bi-box-arrow-right"></i> Salir</a>
            </div>
        </div>
    </nav>

    <div class="container-fluid my-5 px-4">
        <div class="row">
            
            <div class="col-12 col-lg-8 mb-4">
                <div class="card card-custom p-4 bg-white">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 class="fw-bold text-dark mb-0"><i class="bi bi-people-fill text-primary me-2"></i>Gestión de Usuarios</h4>
                        <button class="btn btn-primary btn-sm rounded-3" data-bs-toggle="modal" data-bs-target="#modalUsuario" onclick="prepararCrear()">
                            <i class="bi bi-person-plus-fill me-1"></i> Nuevo Usuario
                        </button>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Avatar</th>
                                    <th>Apodo (Username)</th>
                                    <th>Correo Electrónico</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (c != null) {
                                        String sqlUser = "SELECT username, avatar, parent_email, estado, password FROM tb_usuarios WHERE id_per = 2 ORDER BY username ASC";
                                        try (Statement st = c.createStatement(); ResultSet rs = st.executeQuery(sqlUser)) {
                                            while(rs.next()) {
                                                String user = rs.getString("username");
                                                String av = rs.getString("avatar");
                                                String email = rs.getString("parent_email");
                                                String est = rs.getString("estado");
                                                String pass = rs.getString("password");
                                                boolean isBloqueado = "BLOQUEADO".equalsIgnoreCase(est);
                                %>
                                <tr>
                                    <td>
                                        <img src="https://api.dicebear.com/7.x/bottts/svg?seed=<%= "gato".equals(av) ? "cat" : av %>" class="rounded-circle bg-light" width="40" height="40" alt="Avatar">
                                    </td>
                                    <td class="fw-bold text-secondary"><%= user %></td>
                                    <td><%= email %></td>
                                    <td>
                                        <span class="badge <%= isBloqueado ? "bg-danger" : "bg-success" %>"><%= est %></span>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-warning me-1" title="Editar" 
                                                onclick="prepararEditar('<%= user %>', '<%= email %>', '<%= pass %>', '<%= av %>')">
                                            <i class="bi bi-pencil-fill"></i>
                                        </button>

                                        <form action="proccess_user.jsp" method="POST" class="d-inline">
                                            <input type="hidden" name="accion" value="cambiarEstado">
                                            <input type="hidden" name="txtNombre" value="<%= user %>">
                                            <input type="hidden" name="estadoActual" value="<%= est %>">
                                            <% if (isBloqueado) { %>
                                                <button type="submit" class="btn btn-sm btn-success" title="Desbloquear"><i class="bi bi-unlock-fill"></i></button>
                                            <% } else { %>
                                                <button type="submit" class="btn btn-sm btn-danger" title="Bloquear"><i class="bi bi-lock-fill"></i></button>
                                            <% } %>
                                        </form>
                                    </td>
                                </tr>
                                <% 
                                            }
                                        } catch(SQLException e) { out.print("<tr><td colspan='5'>Error: "+e.getMessage()+"</td></tr>"); }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-4 mb-4">
                <div class="card card-custom p-4 bg-white" style="max-height: 600px; overflow-y: auto;">
                    <h4 class="fw-bold text-dark mb-4"><i class="bi bi-journal-text text-warning me-2"></i>Bitácora Histórica</h4>
                    <div class="timeline-container">
                        <%
                            if (c != null) {
                                String sqlBit = "SELECT usuario_apodo, accion, fecha_registro FROM bitacora ORDER BY id DESC LIMIT 30";
                                try (Statement st = c.createStatement(); ResultSet rs = st.executeQuery(sqlBit)) {
                                    while(rs.next()) {
                                        String bUser = rs.getString("usuario_apodo");
                                        String bAccion = rs.getString("accion");
                                        Timestamp bFecha = rs.getTimestamp("fecha_registro");
                        %>
                        <div class="p-3 mb-2 bg-light rounded-3 border-start border-4 <%= bAccion.contains("cambió") || bAccion.contains("Bloqueado") ? "border-danger" : "border-info" %>">
                            <div class="d-flex justify-content-between">
                                <strong class="text-primary">@<%= bUser %></strong>
                                <small class="text-muted" style="font-size: 0.75rem;"><%= bFecha != null ? bFecha.toString().substring(5, 16) : "" %></small>
                            </div>
                            <p class="mb-0 text-secondary mt-1" style="font-size: 0.85rem;"><%= bAccion %></p>
                        </div>
                        <%
                                    }
                                } catch(SQLException e) { out.print("<p class='text-danger'>Error: "+e.getMessage()+"</p>"); }
                            }
                        %>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="modal fade" id="modalUsuario" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow">
                <div class="modal-header border-0 pb-0">
                    <h5 class="fw-bold text-primary" id="modalTitulo">Registrar Estudiante</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="procesar_usuario.jsp" method="POST" class="p-4">
                    <input type="hidden" name="accion" id="formAccion" value="crear">
                    <input type="hidden" name="txtAvatar" id="formAvatar" value="robot">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" name="txtNombre" id="formNombre" placeholder="Apodo" required>
                        <label for="formNombre">Súper Apodo (Username)</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" name="txtClave" id="formClave" placeholder="Clave" minlength="8" required>
                        <label for="formClave">Contraseña (Mínimo 8 caracteres)</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="email" class="form-control rounded-3" name="txtEmail" id="formEmail" placeholder="correo@papa.com" required>
                        <label for="formEmail">Correo del Representante</label>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 rounded-3 fw-bold py-2" id="formBoton">Guardar Cambios</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Funciones JavaScript para reutilizar el modal dinámicamente
        function prepararCrear() {
            document.getElementById('modalTitulo').innerText = "Registrar Nuevo Estudiante";
            document.getElementById('formAccion').value = "crear";
            document.getElementById('formNombre').value = "";
            document.getElementById('formNombre').readOnly = false;
            document.getElementById('formEmail').value = "";
            document.getElementById('formClave').value = "";
            document.getElementById('formBoton').className = "btn btn-primary w-100 rounded-3 fw-bold py-2";
        }

        function prepararEditar(user, email, pass, avatar) {
            document.getElementById('modalTitulo').innerText = "Actualizar Información de @" + user;
            document.getElementById('formAccion').value = "actualizar";
            document.getElementById('formNombre').value = user;
            document.getElementById('formNombre').readOnly = true; // El nombre de usuario no se cambia por consistencia
            document.getElementById('formEmail').value = email;
            document.getElementById('formClave').value = pass;
            document.getElementById('formAvatar').value = avatar;
            document.getElementById('formBoton').className = "btn btn-warning w-100 rounded-3 fw-bold py-2";
            
            // Abrir el modal manualmente
            var myModal = new bootstrap.Modal(document.getElementById('modalUsuario'));
            myModal.show();
        }
    </script>
</body>
</html>