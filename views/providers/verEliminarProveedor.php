<h2 class="text-center">Ver/Eliminar Proveedor</h2>
<hr>
<?php 
	if (isset($_SESSION["exito"])) {
		unset($_SESSION["exito"]);
		echo "<script>alert('¡El proveedor ha sido eliminado exitosamente!')</script>";
	}
	if (isset($_SESSION["error"])) {
		unset($_SESSION["error"]);
		echo "<script>alert('¡Error al eliminar el proveedor!')</script>";
	}
?>
<div class="table-responsive">
	<table class="table table-hover table-condensed">
		<thead>
			<tr>
				<th class="text-center">#</th>
				<th class="text-center">Nombre</th>
				<th class="text-center">Nit</th>
				<th class="text-center">Ciudad</th>
				<th class="text-center">Teléfono</th>
				<th class="text-center">Dirección</th>
				<th class="text-center">Eliminar</th>
				<th class="text-center">Actualizar</th>
			</tr>
		</thead>
		<tbody>			
		<?php 
			require "../models/medoo.min.php";

			// Creo una instancia de la clase medoo
			$db = new medoo();		

			// Obtengo todos los proveedores en un array
			$proveedores = $db->select("proveedores", "*");

			for ($i=0; $i < count($proveedores) ; $i++) { 
				if ($i % 2 != 0) {
					echo "<tr class='text-center' bgcolor='#31B0D5'>";
				}
				else {
					echo "<tr class='text-center'>";
				}				

				// Obtengo la cuidad de un proveedor
				$ciudades = $db->get("ciudades", "nombreciudad", ["id_ciudad" => $proveedores[$i]["id_ciudad"]]);

				echo "<td>".($i+1)."</td><td>".utf8_encode($proveedores[$i]["nombre_proveedor"])."</td><td>".$proveedores[$i]["nit_proveedor"]."</td>".
						"<td>".$ciudades."</td><td>".$proveedores[$i]["tel_proveedor"]."</td>".
						"<td>".$proveedores[$i]["direccion_proveedor"]."</td>".
						"<td><a href='../controllers/providers/deleteProviderController.php?id=".$proveedores[$i]["id_proveedor"]."' class='btn btn-danger'>X</a></td>

						<td><a href='admin.php?op=9&nombre_proveedor=".$proveedores[$i]["nombre_proveedor"].
						"&nit_proveedor=".$proveedores[$i]["nit_proveedor"].
						"&id_ciudad=".$proveedores[$i]["id_ciudad"].
						"&tel_proveedor=".$proveedores[$i]["tel_proveedor"].
						"&direccion_proveedor=".$proveedores[$i]["direccion_proveedor"]."' class='btn btn-primary'>A</a></td></tr>";
			}
		?>			

		</tbody>
	</table>
</div>
<script>
  var li = document.getElementById('deleteProvider');
  li.className += "active";
</script>