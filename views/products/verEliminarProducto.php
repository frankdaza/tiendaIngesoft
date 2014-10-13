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
				<th class="text-center">ID Tipo</th>
				<th class="text-center">Descripción</th>
				<th class="text-center">Precio</th>
				<th class="text-center">Referencia</th>
				<th class="text-center">Presentación</th>
				<th class="text-center">Eliminar</th>
			</tr>
		</thead>
		<tbody>			
				<?php 
					require "../models/medoo.min.php";

					// Creo una instancia de la clase medoo
					$db = new medoo();

					// Obtengo todos los productos en un array
					$productos = $db->select("productos", "*");

					for ($i=0; $i < count($productos) ; $i++) { 
						if ($i % 2 != 0) {
							echo "<tr class='text-center' bgcolor='#00A1F1'>";
						}
						else {
							echo "<tr class='text-center'>";
						}
						echo "<td>".($i+1)."</td><td>".$productos[$i]["id_tipoproducto"]."</td><td>".utf8_encode($productos[$i]["descripcion_producto"])."</td>".
								 "<td>".$productos[$i]["precio_producto"]."</td><td>".$productos[$i]["ref_producto"]."</td>".
								 "<td>".$productos[$i]["presentacion_producto"]."</td>
								 <td><a href='../controllers/products/deleteProductController.php?id=".$productos[$i]["id_producto"]."' class='btn btn-danger'>X</a></td></tr>";
					}
				?>			
		</tbody>
	</table>
</div>