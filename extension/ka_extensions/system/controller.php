<?php
/*
	$Project: Ka Extensions $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 4.1.1.0 $ ($Revision: 287 $)
*/
	
namespace Opencart\Extension\KaExtensions\System;

/**
	Replaces the standard OpenCart Controller class with extended functionality. Recommended as a base
	class for all controllers of Ka extensions.

	@package Core
*/
abstract class Controller extends \Opencart\System\Engine\Controller {

	use TraitSession, TraitController;

	protected $kadb = null;
	
	/**
	 Creates the controller, initializes the Ka database wrapper, adds the Ka Extensions stylesheet in the admin area and calls onLoad().

	 $registry — OpenCart registry.
	*/
	function __construct($registry) {
		parent::__construct($registry);

		$this->kadb = new Db($this->db);

		if (KaGlobal::isAdminArea()) {
			
			$this->document->addStyle(HTTP_CATALOG . 'extension/ka_extensions/admin/view/stylesheet/stylesheet.css');
		}
		
		$this->onLoad();
	}

	
	/**
	 Hook called at the end of the constructor. Override it in child classes to run initialization code.

	 @return bool Always true.
	*/
	protected function onLoad() {
		return true;
	}
}
