<?php 
session_start();

?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tienda Virtual IngeSoft.">
    <meta name="author" content="Frank Edward Daza González.">    

    <title>Login | Tienda Virtual</title>

    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../assets/css/signin.css" rel="stylesheet">
 
  </head>

  <body>

    <div class="container">

      <form method="POST" action="../controllers/login/loginController.php" class="form-signin text-center" role="form">
        <img src="../assets/img/login.png" alt="" class>
        <h2 class="form-signin-heading">¡Bienvenidos!</h2>
        <div class="form-group">
          <input name="email" type="email" class="form-control" placeholder="Correo electrónico" required autofocus>
        </div>        
        <div class="form-group">
          <input name="password" type="password" class="form-control" placeholder="Contraseña" required>
        </div>        
        <?php 
          if (isset($_SESSION["error"])) {
            echo "<p class='text-danger'>Correo electrónico o Contraseña incorrectos.</p>";
            unset($_SESSION["error"]);
          }
        ?>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
      </form>    

    </div> <!-- /container -->
  </body>
</html>