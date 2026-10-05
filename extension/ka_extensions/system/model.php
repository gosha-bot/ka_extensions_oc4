<?php
/*
	$Project: Ka Extensions $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 4.1.1.0 $ ($Revision: 287 $)
*/
	
namespace Opencart\Extension\KaExtensions\System;

use Tables;

abstract class Model extends \Opencart\System\Engine\Model {

	use TraitSession, TraitModel;

	protected $kadb;
	
	function __construct($registry) {
		parent::__construct($registry);

		$this->kadb = new Db($this->db);
				
		$this->onLoad();
	}
	
	
	protected function onLoad() {
		return true;
	}
}