<h2 class="text-center">Historial de Compras</h2> <hr>
<div class="table-responsive">
  <table class="table table-hover table-condensed">
    <thead>
      <tr>
        <th class="text-left">Proveedor</th>        
        <th class="text-left">Fecha compra</th>
        <th class="text-left">Producto</th>
        <th class="text-left">Precio</th>
        <th class="text-left">Cantidad</th>
        <th class="text-left">Total</th>
      </tr>
    </thead>
    <tbody>
        <?php 
          require "../models/medoo.min.php";

          // Creo una instancia de la clase medoo
          $db = new medoo();

          // Obtengo todas las compras, compra producto, proveedores y productos
          $compras = $db->select("compra", "*");
          $compras_producto = $db->select("compra_producto", "*");                    

          for ($i=0; $i < count($compras); $i++) { 
            if ($i % 2 != 0) {
              echo "<tr class='text-left' bgcolor='#31B0D5'>";
            }
            else {
              echo "<tr class='text-left'>";
            }
            $nombreProveedor = $db->get("proveedores", "nombre_proveedor", ["id_proveedor" => $compras[$i]["id_proveedor"]]);
            $nombreProducto = $db->get("productos", "descripcion_producto", ["id_producto" => $compras_producto[$i]["id_producto"]]);
            
            echo "<td>".utf8_encode($nombreProveedor)."</td><td>".$compras[$i]["fecha_compra"]."</td>
            <td>".utf8_encode($nombreProducto)."</td><td>$".$compras_producto[$i]["valor_compra_producto"]."</td>
            <td>".$compras_producto[$i]["cant_compra_producto"]."</td>
            <td>$".($compras_producto[$i]["valor_compra_producto"] * $compras_producto[$i]["cant_compra_producto"])."</td></tr>";
          }

        ?>      
    </tbody>
  </table>
</div>