<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardLearn - Entrar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #e8f4fd;
        }
    </style>
</head>
<body class="d-flex align-items-center min-vh-100 py-5">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-10 col-md-8 col-lg-5">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="card-body p-5 text-center">
                        
                        <div class="mb-4">
                            <h2 class="fw-bold text-primary">¡Hola de nuevo!</h2>
                            <p class="text-muted">Ingresa tus datos para seguir jugando</p>
                        </div>

                        <form action="respuestalogin.jsp" method="POST">
                            
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control rounded-3" id="username" name="username" placeholder="SuperGamer" required>
                                <label for="username"><i class="bi bi-joystick text-primary me-2"></i>Tu Súper Apodo</label>
                            </div>

                            <div class="form-floating mb-4">
                                <input type="password" class="form-control rounded-3" id="password" name="password" placeholder="1234" required>
                                <label for="password"><i class="bi bi-key-fill text-primary me-2"></i>Contraseña Secreta</label>
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg w-100 rounded-3 fw-bold shadow-sm mb-3">¡Entrar al Laboratorio!</button>
                            
                            <p class="mb-0 text-muted">¿Eres nuevo por aquí? <a href="register.jsp" class="text-decoration-none fw-bold">Regístrate aquí</a></p>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>