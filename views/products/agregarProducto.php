<form method="POST" action="../controllers/products/addProductController.php" class="form-horizontal" role="form">
	<legend><h2 class="text-center">Agregar Producto</h2></legend>
	<?php 
		if (isset($_SESSION["exito"])) {
			unset($_SESSION["exito"]);
			echo "<script>alert('¡El producto ha sido agregado exitosamente!')</script>";
		}
		if (isset($_SESSION["error"])) {
			unset($_SESSION["error"]);
			echo "<script>alert('¡Error al ingresar el producto!')</script>";
		}
	?>
  <div class="form-group">
    <label for="id_tipoproducto" class="col-sm-4 control-label">Tipo Producto</label>
    <div class="col-sm-4">      
      <select name="id_tipoproducto" id="id_tipoproducto" class="form-control" required>
        <?php 
          require "../models/medoo.min.php";

          // Creo una instancia de la clase medoo
          $db = new medoo();

          // Obtengo todos los tipo productos en un array
          $tipo_productos = $db->select("tipo_productos", "*");

          for ($i=0; $i < count($tipo_productos); $i++) { 
            echo "<option value='".$tipo_productos[$i]["id_tipoproducto"]."'>".utf8_encode($tipo_productos[$i]["desc_tipoproducto"])."</option>";
          }
        ?>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="descripcion_producto" class="col-sm-4 control-label">Descripción Producto</label>
    <div class="col-sm-4">
      <input name="descripcion_producto" type="text" maxlength="100" class="form-control" id="descripcion_producto" required>
    </div>
  </div>
  <div class="form-group">
    <label for="precio_producto" class="col-sm-4 control-label">Precio Producto</label>
    <div class="col-sm-4">
      <input name="precio_producto" type="number" min="50" max="99999999999" class="form-control" id="precio_producto" required>
    </div>
  </div>
  <div class="form-group">
    <label for="ref_producto" class="col-sm-4 control-label">Referencia Producto</label>
    <div class="col-sm-4">
      <input name="ref_producto" type="text" maxlength="10" class="form-control" id="ref_producto" required>
    </div>
  </div>
  <div class="form-group">
    <label for="presentacion_producto" class="col-sm-4 control-label">Presentación Producto</label>
    <div class="col-sm-4">
    	<select name="presentacion_producto" class="form-control" id="presentacion_producto" required>
    		<option>Caja</option>
    		<option>Galon</option>
    		<option>Tubo</option>
    		<option>Individual</option>
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
  var li = document.getElementById('addProduct');
  li.className += "active";
</script>