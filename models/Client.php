<?php require "medoo.min.php";

/**
* Class Client.
* Author: Frank Edward Daza González.
*/
class Client {

	private $id;
	private $telefono;
	private $nombre;
	private $idCiudad;
	private $fecha;
	private $db;
	
	function __construct($id, $telefono, $nombre, $idCiudad, $fecha) {
		$this->id = $id;
		$this->telefono = $telefono;
		$this->nombre = $nombre;
		$this->idCiudad = $idCiudad;
		$this->fecha = $fecha;
		$this->db = new medoo();
	}

	/**
	* @return bool true si agrega el cliente,
	* false de lo contrario.
	*/
	public function addClient() {
		if ($this->db->insert("clientes", [
			"id_cliente" 		=> $this->id,
			"tel_cliente"		=> $this->telefono,
			"nombre_cliente"	=> $this->nombre,
			"id_ciudad"			=> $this->idCiudad,
			"date_cliente" 		=> $this->fecha
		])) {
			return true;
		}
		else return false;
	}

	/**
	* @param $id ID del cliente a eliminar.
	* @return bool true si se elimina el cliente,
	* false de lo contrario.
	*/
	public function deleteClient($id) {
		if ($this->db->delete("clientes", ["id_cliente" => $id])) {
			return true;
		}
		else return false;
	}

}



?>