<?php session_start();

require "../../models/Purchase.php";

// Obtengo los datos de Compra.
$id_proveedor = $_POST["id_proveedor"];
$idProduct = $_POST["idProduct"];
$cantidad = $_POST["cantidad"];
$fecha = date("Y-m-d");

if (strlen($id_proveedor) > 0 && strlen($id_proveedor) <= 11
    && strlen($idProduct) > 0 && strlen($idProduct) <= 11
    && strlen($cantidad) > 0 && strlen($cantidad) <= 4) {

  // Creo una instancia de la clase Purchase
  $pur = new Purchase();

  $price = $pur->getPriceProduct($idProduct);
  
  if ($pur->makePurchase($id_proveedor, $fecha) && $pur->makePurchaseProduct($idProduct, $cantidad, $price) ) {
    $_SESSION["exito"] = true;
    header("Location: ../../site/admin.php?op=10");
  }
  else {
    $_SESSION["error"] = true;
    header("Location: ../../site/admin.php?op=10");
  }
}
else {
  $_SESSION["error"] = true;
  header("Location: ../../site/admin.php?op=10");
}