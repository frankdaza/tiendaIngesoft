<form method="POST" action="../controllers/purchases/makePurchaseController.php" class="form-horizontal" role="form">
	<legend><h2 class="text-center">Realizar Compra</h2></legend>
	<?php 
		if (isset($_SESSION["exito"])) {
			unset($_SESSION["exito"]);
			echo "<script>alert('¡Se ha realizado la compra exitosamente!')</script>";
		}
		if (isset($_SESSION["error"])) {
			unset($_SESSION["error"]);
			echo "<script>alert('¡Error al realizar la compra!')</script>";
		}
	?>  
  <div class="form-group">
    <label for="id_proveedor" class="col-sm-4 control-label">Nombre del Proveedor</label>
    <div class="col-sm-4">
    	<select name="id_proveedor" id="id_proveedor" class="form-control" required>
    		<?php 
    			require "../models/medoo.min.php";

    			// Creo una instancia de la clase medoo
    			$db = new medoo();

    			$proveedores = $db->select("proveedores", "*");

    			for ($i=0; $i < count($proveedores); $i++) { 
    				echo "<option value='".$proveedores[$i]["id_proveedor"]."'>".$proveedores[$i]["nombre_proveedor"]."</option>";
    			}
    		?>
    	</select>      
    </div>
  </div>
  <div class="form-group">
    <label for="idProduct" class="col-sm-4 control-label">Producto</label>
    <div class="col-sm-5">
      <select name="idProduct" id="idProduct" class="form-control" required>
        <?php           
          $productos = $db->select("productos", "*");

          for ($i=0; $i < count($productos); $i++) { 
            echo "<option value='".$productos[$i]["id_producto"]."'>".utf8_encode($productos[$i]["descripcion_producto"]." ----> Precio: $".$productos[$i]["precio_producto"])."</option>";
          }
        ?>
      </select>      
    </div>
  </div>
  <div class="form-group">
    <label for="cantidad" class="col-sm-4 control-label">Cantidad</label>
    <div class="col-sm-2">
      <input name="cantidad" type="number" id="cantidad" min="1" max="9999" class="form-control" required>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-10">
      <button type="submit" class="btn btn-primary">Comprar</button>
    </div>
  </div>
</form>
<script>
  var li = document.getElementById('makePurchase');
  li.className += "active";  
</script>