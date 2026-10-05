<?php
/*
	$Project: Ka Extensions $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 4.1.1.0 $ ($Revision: 287 $)
*/
	
namespace Opencart\Extension\KaExtensions\System;

use extension\KaExtensions\Tables;

trait TraitModel {

	protected $lastError;
	
	public function getLastError() {
		return $this->lastError;
	}
}