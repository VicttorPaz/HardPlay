<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Crear Cuenta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/mixins/_text-truncate.scss" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #e8f4fd;
        }
        .avatar-radio {
            display: none;
        }
        .avatar-label img {
            border: 4px solid transparent;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        .avatar-radio:checked + .avatar-label img {
            border-color: #3498db;
            transform: scale(1.1);
        }
    </style>
</head>
<body class="d-flex align-items-center min-vh-100 py-5">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-10 col-md-8 col-lg-6">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="card-body p-5 text-center">
                        
                        <div class="mb-4">
                            <h2 class="fw-bold text-primary">¡Únete a HardLearn!</h2>
                            <p class="text-muted">Crea tu cuenta divertida en un minuto</p>
                        </div>

                        <form action="respuesta.jsp" method="POST">
                            
                            <div class="mb-4 text-start">
                                <label class="form-label fw-bold text-secondary">Elige tu Avatar:</label>
                                <div class="d-flex justify-content-around bg-light p-3 rounded-3">
                                    <div>
                                        <input type="radio" name="avatar" value="robot" id="av1" class="avatar-radio" checked>
                                        <label for="av1" class="avatar-label">
                                            <img src="https://api.dicebear.com/7.x/bottts/svg?seed=robot" alt="Robot" class="rounded-circle bg-white shadow-sm" width="70" height="70">
                                        </label>
                                    </div>
                                    <div>
                                        <input type="radio" name="avatar" value="gato" id="av2" class="avatar-radio">
                                        <label for="av2" class="avatar-label">
                                            <img src="https://api.dicebear.com/7.x/bottts/svg?seed=cat" alt="Gato" class="rounded-circle bg-white shadow-sm" width="70" height="70">
                                        </label>
                                    </div>
                                    <div>
                                        <input type="radio" name="avatar" value="alien" id="av3" class="avatar-radio">
                                        <label for="av3" class="avatar-label">
                                            <img src="https://api.dicebear.com/7.x/bottts/svg?seed=alien" alt="Alien" class="rounded-circle bg-white shadow-sm" width="70" height="70">
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="text" class="form-control rounded-3" id="username" name="username" placeholder="SuperGamer" required>
                                <label for="username"><i class="bi bi-joystick text-primary me-2"></i>Tu Súper Apodo (Nickname)</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="password" class="form-control rounded-3" id="password" name="password" placeholder="1234" required>
                                <label for="password"><i class="bi bi-key-fill text-primary me-2"></i>Contraseña Secreta</label>
                            </div>

                            <div class="form-floating mb-4">
                                <input type="email" class="form-control rounded-3" id="parentEmail" name="parentEmail" placeholder="papa@correo.com" required>
                                <label for="parentEmail"><i class="bi bi-shield-lock-fill text-primary me-2"></i>Correo de Papá o Mamá</label>
                                <div class="form-text text-start px-2">Lo usamos para proteger tu cuenta.</div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg w-100 rounded-3 fw-bold shadow-sm mb-3">¡Comenzar la Aventura!</button>
                            
                            <p class="mb-0 text-muted">¿Ya tienes cuenta? <a href="login.jsp" class="text-decoration-none fw-bold">Inicia sesión aquí</a></p>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>