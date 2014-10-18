<?php session_start();

require "../../models/Provider.php";

// Optengo el id del proveedor a eliminar
$id = $_GET["id"];

if ($id >= 0) {
	// Creo una instancia de la clase Cliente
	$provider = new Provider(null, null, null, null, null);	

	if ($provider->deleteProvider($id)) {
		$_SESSION["exito"] = true;
		header("Location: ../../site/admin.php?op=8");
	}
	else {
		$_SESSION["error"] = true;
		header("Location: ../../site/admin.php?op=8");	
	}
}
else {
	$_SESSION["error"] = true;
	header("Location: ../../site/admin.php?op=8");	
}