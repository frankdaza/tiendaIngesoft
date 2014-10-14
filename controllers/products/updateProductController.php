<?php session_start();

require "../../models/Product.php";

// Obtengo los datos del producto a actualizar
$id_producto 			= $_POST["id_producto"];
$id_tipoproducto		= $_POST["id_tipoproducto"];	// int(10)
$descripcion_producto 	= utf8_decode($_POST["descripcion_producto"]);	// varchar(100)
$precio_producto 		= $_POST["precio_producto"];	// int(11)
$ref_producto 			= $_POST["ref_producto"];	// bigint(10)
$presentacion_producto	= $_POST["presentacion_producto"];	// varchar(30)

if (strlen($id_tipoproducto) > 0 && strlen($id_tipoproducto) <= 10 && strlen($descripcion_producto) > 0
	&& strlen($descripcion_producto) <= 100 && strlen($precio_producto) > 0 && strlen($precio_producto) <= 11
	&& strlen($ref_producto) > 0 && strlen($ref_producto) <= 10 && strlen($presentacion_producto) > 0
	&& strlen($presentacion_producto) <= 30 && strlen($id_producto) > 0 && strlen($id_producto) <= 11 ) {

	// Creo una instancia de la clase Product
	$prod = new Product($id_tipoproducto, $descripcion_producto, $precio_producto, $ref_producto, $presentacion_producto);

	if ($prod->updateProduct($id_producto)) {
		$_SESSION["exito"] = true;
		header("Location: ../../site/admin.php?op=3");
	}
	else {
		$_SESSION["error"] = true;
		header("Location: ../../site/admin.php?op=3");
	}
}
else {
	$_SESSION["error"] = true;
	header("Location: ../../site/admin.php?op=3");
}