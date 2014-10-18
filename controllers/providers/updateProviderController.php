<?php session_start();

require "../../models/Provider.php";

// Obtengo los datos del proveedor a actualizar
$nombre_proveedor			= utf8_decode($_POST["nombre_proveedor"]);
$nit_proveedor 				= $_POST["nit_proveedor"];
$id_ciudad 						= $_POST["id_ciudad"];
$tel_proveedor 				= $_POST["tel_proveedor"];
$direccion_proveedor	= $_POST["direccion_proveedor"];


if (strlen($nombre_proveedor) > 0 && strlen($nombre_proveedor) <= 100
		&& strlen($nit_proveedor) > 0 && strlen($nit_proveedor) <= 20
		&& strlen($id_ciudad) > 0 && strlen($id_ciudad) <= 11
		&& strlen($tel_proveedor) > 0 && strlen($tel_proveedor) <= 16
		&& strlen($direccion_proveedor) > 0 && strlen($direccion_proveedor) <= 100) {

	// Creo una instancia de la clase Provider
	$provider = new Provider($nombre_proveedor, $nit_proveedor, $id_ciudad, $tel_proveedor, $direccion_proveedor);

	if ($provider->updateProvider($nit_proveedor)) {
		$_SESSION["exito"] = true;
		header("Location: ../../site/admin.php?op=9");
	}
	else {
		$_SESSION["error"] = true;
		header("Location: ../../site/admin.php?op=9");
	}
}
else {
	$_SESSION["error"] = true;
	header("Location: ../../site/admin.php?op=9");
}