<?php 
session_start();

if (!isset($_SESSION["nombre"])) {
  header("Location: login.php");
}
?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tienda Virtual Ingesoft.">
    <meta name="author" content="Frank Edward Daza González.">    

    <title>Panel Administrativo | Tienda Virtual</title>

    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../assets/css/dashboard.css" rel="stylesheet">

  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Tienda Virtual</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-left">
            <li><a href="admin.php?op=0">Inicio</a></li>
            <li><a href="">Productos</a></li>
            <li><a href="">Clientes</a></li>
            <li><a href="">Proveedores</a></li>            
            <li><a href="">Compras</a></li>            
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a>
              <?php echo $_SESSION["nombre"]; ?>
            </a></li>            
            <li><a href="../controllers/login/logoutController.php"><button type="button" class="btn btn-xs btn-danger"><b>Cerrar</b></button></a><li>
          </ul>
        </div>                
      </div>
    </div>

    <section class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar  text-center">
          <ul class="nav nav-sidebar">
            <li class="active"><b>Productos</b></li>
            <li><a href="admin.php?op=1">Agregar Producto</a></li>
            <li><a href="admin.php?op=2">Ver/Eliminar Producto</a></li>
            <li><a href="#">Actualizar Producto</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><b>Clientes</b></li>
            <li><a href="#">Agregar Cliente</a></li>
            <li><a href="#">Ver/Eliminar Cliente</a></li>
            <li><a href="#">Actualizar Cliente</a></li>
          </ul><ul class="nav nav-sidebar">
            <li class="active"><b>Proveedores</b></li>
            <li><a href="#">Agregar Proveedor</a></li>
            <li><a href="#">Ver/Eliminar Proveedor</a></li>
            <li><a href="#">Actualizar Proveedor</a></li>
          </ul><ul class="nav nav-sidebar">
            <li class="active"><b>Compras</b></li>
            <li><a href="#">Agregar Compra</a></li>
            <li><a href="#">Ver/Eliminar Compra</a></li>
            <li><a href="#">Actualizar Compra</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">



          <?php           
            if (isset($_GET["op"])) {
              $op = (int) $_GET["op"];

              if ($op == 0) require "../views/start.php";
              elseif ($op == 1) require "../views/products/agregarProducto.php";
              elseif ($op == 2) require "../views/products/verEliminarProducto.php";
              else require "../views/start.php";
            }
            //else require "../views/start.php";
          ?>          

        <footer class="text-center">
          <br><br>
          Desarrollo de software &middot; <a href="http://frankdaza.co" target="_blank">Frank Edward Daza González</a> <br>
          &copy; Tienda Virtual &middot; 2014    
        </footer>  
        </div>        
      </div>
    </section>    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>    
  </body>
</html>