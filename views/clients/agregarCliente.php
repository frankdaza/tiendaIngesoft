<form method="POST" action="../controllers/clients/addClientController.php" class="form-horizontal" role="form">
	<legend><h2 class="text-center">Agregar Cliente</h2></legend>
	<?php 
		if (isset($_SESSION["exito"])) {
			unset($_SESSION["exito"]);
			echo "<script>alert('¡El cliente ha sido agregado exitosamente!')</script>";
		}
		if (isset($_SESSION["error"])) {
			unset($_SESSION["error"]);
			echo "<script>alert('¡Error al ingresar el cliente!')</script>";
		}
	?>
  <div class="form-group">
    <label for="id_cliente" class="col-sm-4 control-label">Id Cliente</label>
    <div class="col-sm-4">
      <input name="id_cliente" type="number" maxlength="20" class="form-control" id="id_cliente" required>
    </div>
  </div>
  <div class="form-group">
    <label for="tel_cliente" class="col-sm-4 control-label">Teléfono</label>
    <div class="col-sm-4">
      <input name="tel_cliente" type="tel" maxlength="12" class="form-control" id="tel_cliente" required>
    </div>
  </div>
  <div class="form-group">
    <label for="nombre_cliente" class="col-sm-4 control-label">Nombre</label>
    <div class="col-sm-4">
      <input name="nombre_cliente" type="text" maxlength="40" class="form-control" id="nombre_cliente" required>
    </div>
  </div>  
  <div class="form-group">
    <label for="id_ciudad" class="col-sm-4 control-label">Ciudad</label>
    <div class="col-sm-4">
    	<select name="id_ciudad" class="form-control" id="id_ciudad" required>
    		<?php 
          require "../models/medoo.min.php";

          // Creo una instancia de la clase medoo
          $db = new medoo();

          // Selecciono las ciudades con sus id de la db
          $ciudades = $db->select("ciudades", "*");

          for ($i=0; $i < count($ciudades); $i++) { 
            echo "<option value='".$ciudades[$i]["id_ciudad"]."'>".utf8_encode($ciudades[$i]["nombreciudad"])."</option>";
          }
        ?>
    	</select>      
    </div>
  </div>  
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-10">
      <button type="submit" class="btn btn-primary">Agregar</button>
    </div>
  </div>
</form>
<script>
  var li = document.getElementById('addClient');
  li.className += "active";
</script>