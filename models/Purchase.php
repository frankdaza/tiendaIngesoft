<?php require "medoo.min.php";

/**
* Class: Purchase.
* Author: Frank edward Daza González.
*/
class Purchase {

	private $db;
	
	function __construct() {		
		$this->db = new medoo();
	}

	/**
	* @param $id_proveedor int
	* @param $fecha_compra date
	* @param $ref_compra int
	* @return bool true si realiza la compra exitosamente,
	* false de lo contrario.
	*/
	public function makePurchase($id_proveedor, $fecha_compra) {
		if ($this->db->insert("compra", [
				"id_proveedor"	=> $id_proveedor,
				"fecha_compra"	=> $fecha_compra				
			])) {
			return true;
		}
		else return false;
	}

	/**
	* @param $id_producto int
	* @param $cant_compra_producto int
	* @param $valor_compra_producto int
	* @return bool true si realiza la compra producto exitosamente,
	* false de lo contrario.
	*/
	public function makePurchaseProduct($id_producto, $cant_compra_producto, $valor_compra_producto) {
		if ($this->db->insert("compra_producto", [				
				"id_producto"							=> $id_producto,
				"cant_compra_producto"		=> $cant_compra_producto,
				"valor_compra_producto"	=> $valor_compra_producto
			])) {
			return true;
		}
		else return false;
	}

	/**
	* @param $idProduct int
	* @return int precio del producto.
	*/
	public function getPriceProduct($idProduct) {
		return $this->db->get("productos", "precio_producto", ["id_producto" => $idProduct]);
	}
}