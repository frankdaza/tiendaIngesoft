<?php session_start();

require "../../models/Client.php";

// Optengo el id del cliente a eliminar
$id = $_GET["id"];

if ($id >= 0) {
	// Creo una instancia de la clase Cliente
	$client = new Client(null, null, null, null, null);	

	if ($client->deleteClient($id)) {
		$_SESSION["exito"] = true;
		header("Location: ../../site/admin.php?op=5");
	}
	else {
		$_SESSION["error"] = true;
		header("Location: ../../site/admin.php?op=5");	
	}
}
else {
	$_SESSION["error"] = true;
	header("Location: ../../site/admin.php?op=5");	
}