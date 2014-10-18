<h2 class="text-center">Ver/Eliminar Producto</h2>
<hr>
<?php 
	if (isset($_SESSION["exito"])) {
		unset($_SESSION["exito"]);
		echo "<script>alert('¡El producto ha sido eliminado exitosamente!')</script>";
	}
	if (isset($_SESSION["error"])) {
		unset($_SESSION["error"]);
		echo "<script>alert('¡Error al eliminar el producto!')</script>";
	}
?>
<div class="table-responsive">
	<table class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<th class="text-center">#</th>
				<th class="text-center">Tipo</th>
				<th class="text-center">Descripción</th>
				<th class="text-center">Precio</th>
				<th class="text-center">Referencia</th>
				<th class="text-center">Presentación</th>
				<th class="text-center">Eliminar</th>
				<th class="text-center">Actualizar</th>
			</tr>
		</thead>
		<tbody>			
		<?php 
			require "../models/medoo.min.php";

			// Creo una instancia de la clase medoo
			$db = new medoo();

			// Obtengo todos los productos en un array
			$productos = $db->select("productos", "*");
			$tipoProducto = $db->select("tipo_productos", "*");

			for ($i=0; $i < count($productos) ; $i++) { 
				if ($i % 2 != 0) {
					echo "<tr class='text-center' bgcolor='#31B0D5'>";
				}
				else {
					echo "<tr class='text-center'>";
				}
				$tmp = $productos[$i]["id_tipoproducto"];				

				echo "<td>".($i+1)."</td><td>".$tipoProducto[($tmp-1)]["desc_tipoproducto"]."</td><td>".utf8_encode($productos[$i]["descripcion_producto"])."</td>".
						 "<td>".$productos[$i]["precio_producto"]."</td><td>".$productos[$i]["ref_producto"]."</td>".
						 "<td>".$productos[$i]["presentacion_producto"]."</td>						 
							<td><a href='../controllers/products/deleteProductController.php?id=".$productos[$i]["id_producto"]."' class='btn btn-danger'>X</a></td>

							<td><a href='admin.php?op=3&id=".$productos[$i]["id_producto"].
							"&idTipo=".$productos[$i]["id_tipoproducto"].
							"&descripcion=".$productos[$i]["descripcion_producto"].
							"&precio=".$productos[$i]["precio_producto"].
							"&referencia=".$productos[$i]["ref_producto"].
							"&presentacion=".$productos[$i]["presentacion_producto"]."' class='btn btn-primary'>A</a></td></tr>";
			}
		?>			

		</tbody>
	</table>
</div>
<script>
  var li = document.getElementById('deleteProduct');
  li.className += "active";
</script>