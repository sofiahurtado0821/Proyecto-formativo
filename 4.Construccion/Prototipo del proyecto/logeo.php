
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://localhost/MVC/assets/css/styles.css">
    <title>Document</title>
    <link rel="shortcut icon" href="../img/imgNaturista.webp" type="image/x-icon">
</head>
<body>
    <main class="padre-container-iniciosesion">
        <img src="../img/tiendita.webp">
        <div class="container-iniciosesion">
        <h2>¡Bienvenido de Nuevo!</h2>
        <div class="formulario-inicio">
            <form action="controlador.php" method="post">
                <input type="email" name="correo" id="" placeholder="Correo electrónico">
                <input type="password" name="contraseña" id="" placeholder="Contraseña">
                <input class="btnIniciar"  type="submit" value="Iniciar Sesión">
            </form>
            <h3>Recordar contraseña</h3>
            <p>¿Todavia no tienes una cuenta? <span id="diseño-registrarse">Regístrate</span></p>
        </div>
</div>
    </main>
</body>
</html>