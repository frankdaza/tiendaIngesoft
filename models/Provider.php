<?php require "medoo.min.php";

/**
* Class Provider.
* Author: Frank Edward Daza González.
*/
class Provider {

	private $nombre;
	private $nit;
	private $idCiudad;
	private $telefono;
	private $direccion;
	private $db;
	
	function __construct($nombre, $nit, $idCiudad, $telefono, $direccion) {
		$this->nombre = $nombre;
		$this->nit = $nit;
		$this->idCiudad = $idCiudad;
		$this->telefono = $telefono;
		$this->direccion = $direccion;
		$this->db = new medoo();
	}

	/**
	* @return bool true si agrega el proveedor,
	* false de lo contrario.
	*/
	public function addProvider() {
		if ($this->db->insert("proveedores", [
			"nombre_proveedor"		=> $this->nombre,
			"nit_proveedor" 			=> $this->nit,
			"id_ciudad"						=> $this->idCiudad,
			"tel_proveedor"				=> $this->telefono,						
			"direccion_proveedor"	=> $this->direccion			
		])) {
			return true;
		}
		else return false;
	}

	/**
	* @param $id ID del proveedor a eliminar.
	* @return bool true si se elimina el proveedor,
	* false de lo contrario.
	*/
	public function deleteProvider($id) {
		if ($this->db->delete("proveedores", ["id_proveedor" => $id])) {
			return true;
		}
		else return false;
	}

	/**
	* @param $id ID del proveedor a actualizar.
	* @return bool true si se actualiza el proveedor,
	* false de lo contrario.
	*/
	public function updateProveedor($id) {
		if ($this->db->update("proveedores", [
			"nombre_proveedor"		=> $this->nombre,
			"id_ciudad"						=> $this->idCiudad,
			"tel_proveedor"				=> $this->telefono,
			"direccion_proveedor"	=> $this->direccion
		], [
			"id_proveedor" 				=> $this->id
		])) {
			return true;
		}
		else return false;
	}
}