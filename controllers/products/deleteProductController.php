<?php session_start();

require "../../models/Product.php";

// Optengo el id del producto a eliminar
$id = $_GET["id"];

if ($id >= 1000) {
	// Creo una instancia de la clase Producto
	$prod = new Product(null, null, null, null, null);	

	if ($prod->deleteProduct($id)) {
		$_SESSION["exito"] = true;
		header("Location: ../../site/admin.php?op=2");
	}
	else {
		$_SESSION["error"] = true;
		header("Location: ../../site/admin.php?op=2");	
	}
}
else {
	$_SESSION["error"] = true;
	header("Location: ../../site/admin.php?op=2");	
}