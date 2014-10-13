<?php session_start();

require "../../models/Login.php";

// Obtengo los datos del login
$email = str_replace(" ", "", $_POST["email"]);
$password = str_replace(" ", "", $_POST["password"]);

if (filter_var($email, FILTER_VALIDATE_EMAIL) && strlen($email) > 0
	&& strlen($email) <= 80 && strlen($password) > 6 && strlen($password) <= 20) {
	
	// Creo una instancia de la clase Login
	$log = new Login($email, $password);
	if ($log->login()) {
		// Creo una variable de sesión con el nombre del usuario
		$_SESSION["nombre"] = $log->getName();
	}
	else {
		$_SESSION['error'] = true;
		header("Location: ../../views/login.php");	
	}
	
}
else {
	$_SESSION["error"] = true;
	header("Location: ../../views/login.php");
}
?>