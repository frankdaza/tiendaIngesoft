<?php session_start();

require "../../models/Client.php";

// Obtengo los datos del cliente a actualizar
$id_cliente			= $_POST["id_cliente"];
$tel_cliente 		= $_POST["tel_cliente"];
$nombre_cliente = utf8_decode($_POST["nombre_cliente"]);
$id_ciudad 			= $_POST["id_ciudad"];


if (strlen($id_cliente) > 0 && strlen($id_cliente) <= 20 && strlen($tel_cliente) > 0
		&& strlen($tel_cliente) <= 16 && strlen($nombre_cliente) > 0 && strlen($nombre_cliente) <= 100
		&& strlen($id_ciudad) > 0 && strlen($id_ciudad) <= 11) {

	// Creo una instancia de la clase Client
	$client = new Client($id_cliente, $tel_cliente, $nombre_cliente, $id_ciudad, null);

	if ($client->updateClient($id_cliente)) {
		$_SESSION["exito"] = true;
		header("Location: ../../site/admin.php?op=6");
	}
	else {
		$_SESSION["error"] = true;
		header("Location: ../../site/admin.php?op=6");
	}
}
else {
	$_SESSION["error"] = true;
	header("Location: ../../site/admin.php?op=6");
}