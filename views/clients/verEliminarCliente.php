<h2 class="text-center">Ver/Eliminar Cliente</h2>
<hr>
<?php 
	if (isset($_SESSION["exito"])) {
		unset($_SESSION["exito"]);
		echo "<script>alert('¡El cliente ha sido eliminado exitosamente!')</script>";
	}
	if (isset($_SESSION["error"])) {
		unset($_SESSION["error"]);
		echo "<script>alert('¡Error al eliminar el cliente!')</script>";
	}
?>
<div class="table-responsive">
	<table class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<th class="text-center">#</th>
				<th class="text-center">ID Cliente</th>
				<th class="text-center">Teléfono</th>
				<th class="text-center">Nombre</th>
				<th class="text-center">Ciudad</th>
				<th class="text-center">Fecha</th>
				<th class="text-center">Eliminar</th>
				<th class="text-center">Actualizar</th>
			</tr>
		</thead>
		<tbody>			
		<?php 
			require "../models/medoo.min.php";

			// Creo una instancia de la clase medoo
			$db = new medoo();		

			// Obtengo todos los clientes en un array
			$clientes = $db->select("clientes", "*");

			for ($i=0; $i < count($clientes) ; $i++) { 
				if ($i % 2 != 0) {
					echo "<tr class='text-center' bgcolor='#31B0D5'>";
				}
				else {
					echo "<tr class='text-center'>";
				}				

				// Obtengo la cuidad de un cliente
				$ciudades = $db->get("ciudades", "nombreciudad", ["id_ciudad" => $clientes[$i]["id_ciudad"]]);

				echo "<td>".($i+1)."</td><td>".$clientes[$i]["id_cliente"]."</td><td>".$clientes[$i]["tel_cliente"]."</td>".
						"<td>".utf8_encode($clientes[$i]["nombre_cliente"])."</td><td>".$ciudades."</td>".
						"<td>".$clientes[$i]["date_cliente"]."</td>".
						"<td><a href='../controllers/clients/deleteClientController.php?id=".$clientes[$i]["id_cliente"]."' class='btn btn-danger'>X</a></td>

						<td><a href='admin.php?op=6&id_cliente=".$clientes[$i]["id_cliente"].
						"&tel_cliente=".$clientes[$i]["tel_cliente"].
						"&nombre_cliente=".utf8_encode($clientes[$i]["nombre_cliente"]).
						"&id_ciudad=".$clientes[$i]["id_ciudad"]."' class='btn btn-primary'>A</a></td></tr>";
			}
		?>			

		</tbody>
	</table>
</div>
<script>
  var li = document.getElementById('deleteClient');
  li.className += "active";
</script>