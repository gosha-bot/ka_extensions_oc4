<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/
	
namespace Opencart\Extension\KaExtensions\System;

/**
	Gives access to table objects by their model path or class name. Objects are cached.

	@package DB
*/
class Tables {

	protected static $tables = array();
	
	/**
	 Returns a cached table object. It first tries an area-specific model via kamodel(), otherwise creates the class by name.

	 $tbl — table model path or class name with '/' separators.

	 @throws \Exception If the table class does not exist.
	 @return object Table object.
	*/
	public static function getTable($tbl) {
	
		if (!empty(static::$tables[$tbl])) {
			return static::$tables[$tbl];
		}
			
		$class = $tbl;

		// first we try to find a model dedicated to the area
		//
		$table = null;
		try {
			$table = \KaGlobal::getRegistry()->get('load')->kamodel($tbl);
			
		} catch (\Exception $e) {
		
		}

		// if the area-specific class was not found, we try to create a common table
		//
		if (empty($table)) {
			$class = str_replace('/', '\\', $class);
			if (!class_exists($class)) {
				throw new \Exception('Table class does not exist:' . $class);
			}
			$table = new $class(\KaGlobal::getRegistry());
		}		
		
		static::$tables[$tbl] = $table;
		
		return static::$tables[$tbl];
	}
}