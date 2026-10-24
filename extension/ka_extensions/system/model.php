<?php
/*
	$Project: Ka Extensions $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 4.1.1.0 $ ($Revision: 287 $)
*/
	
namespace Opencart\Extension\KaExtensions\System;

use Tables;

/**
	Base model class for models of Ka extensions.

	@package Core
*/
abstract class Model extends \Opencart\System\Engine\Model {

	use TraitSession, TraitModel;

	protected $kadb;
	
	/**
	 Creates the Db helper object and calls onLoad().

	 $registry — OpenCart registry.
	*/
	function __construct($registry) {
		parent::__construct($registry);

		$this->kadb = new Db($this->db);
				
		$this->onLoad();
	}
	
	
	/**
	 Called at the end of the constructor. Override it to initialize the model.

	 @return bool
	*/
	protected function onLoad() {
		return true;
	}
}