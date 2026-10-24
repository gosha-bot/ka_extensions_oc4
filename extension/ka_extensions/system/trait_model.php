<?php
/*
	$Project: Ka Extensions $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 4.1.1.0 $ ($Revision: 287 $)
*/
	
namespace Opencart\Extension\KaExtensions\System;

use extension\KaExtensions\Tables;

/**
	Helpful functions for models.

	@package Core
*/
trait TraitModel {

	protected $lastError;
	
	/**
	 Returns the last error.

	 @return mixed Last error.
	*/
	public function getLastError() {
		return $this->lastError;
	}
}