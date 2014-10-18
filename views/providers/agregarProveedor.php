<form method="POST" action="../controllers/providers/addProviderController.php" class="form-horizontal" role="form">
	<legend><h2 class="text-center">Agregar Proveedor</h2></legend>
	<?php 
		if (isset($_SESSION["exito"])) {
			unset($_SESSION["exito"]);
			echo "<script>alert('¡El proveedor ha sido agregado exitosamente!')</script>";
		}
		if (isset($_SESSION["error"])) {
			unset($_SESSION["error"]);
			echo "<script>alert('¡Error al ingresar el proveedor!')</script>";
		}
	?>
  <div class="form-group">
    <label for="nombre_proveedor" class="col-sm-4 control-label">Nombre</label>
    <div class="col-sm-4">
      <input name="nombre_proveedor" type="text" maxlength="100" class="form-control" id="nombre_proveedor" required>
    </div>
  </div>
  <div class="form-group">
    <label for="nit_proveedor" class="col-sm-4 control-label">Nit</label>
    <div class="col-sm-4">
      <input name="nit_proveedor" type="number" min="1000000000" max="99999999999999999999" class="form-control" id="nit_proveedor" required>
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
    <label for="tel_proveedor" class="col-sm-4 control-label">Teléfono</label>
    <div class="col-sm-4">
      <input name="tel_proveedor" type="tel" maxlength="16" class="form-control" id="tel_proveedor" required>
    </div>
  </div>
  <div class="form-group">
    <label for="direccion_proveedor" class="col-sm-4 control-label">Dirección</label>
    <div class="col-sm-4">
      <input name="direccion_proveedor" type="text" maxlength="100" class="form-control" id="direccion_proveedor" required>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-10">
      <button type="submit" class="btn btn-primary">Agregar</button>
    </div>
  </div>
</form>
<script>
  var li = document.getElementById('addProvider');
  li.className += "active";
</script>