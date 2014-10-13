<?php require "medoo.min.php";
/**
* Class Login.
* Author: Frank Edward Daza González.
*/
class Login {

	private $email = null;
	private $password = null;
	private $db = null;
	
	function __construct($email, $password) {
		$this->email = $email;
		$this->password = $password;
		$this->db = new medoo();
	}

	/**
	* @return bool true si el ingreso al sistema es correcto,
	* false de lo contrario.
	*/
	public function login() {
		if ($this->db->has("usuarios", ["AND" => [
				"email" => $this->email,
				"clave" => $this->password
			]])) {
			return true;
		}
		else return false;
	}

	/**
	* @return bool true si se cerró la sesión correctamente, 
	* false de lo contrario.
	*/
	public function logout() {		
		if (session_destroy()) return true;
		else return false;
	}

	/**
	* @return string Retorna el nombre de un usuario.	
	*/
	public function getName() {
		return $this->db->get(["usuarios", "nombre", ["email" => $this->email]]);
	}
}
?>