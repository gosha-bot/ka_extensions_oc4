<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
	
	This file replaces standard Opencart autoloader.
	
	The file installs our kamodmanager as a handler of the class load routine that helps to replace required classes
	with modified kamod copies.
*/

namespace extension\ka_extensions;

include_once(__DIR__ . '/kamodmanager.php');

/**
	Replaces the standard OpenCart autoloader and loads modified kamod copies of classes.

	@internal
*/
class Autoloader {

	protected $parent_autoloader;
	protected $kamod_manager;

	public function __construct($org_autoloader) {

		$this->kamod_manager = KamodManager::getInstance();

		if (defined('KAMOD_DEBUG')) {
		
			$this->kamod_manager->rebuildKamodCache();
			
		} elseif (!$this->kamod_manager->isKamodCacheValid()) {
	
			// the cache directory may contain diferent files: 
			// locked.kamod  - another process is rebuilding the cache
			// valid.kamod   - the cache is valid and up to date
			// invalid.kamod - just for user's information, do not rely on it
			//
			$this->kamod_manager->rebuildKamodCache();
			
			if (!$this->kamod_manager->isKamodCacheValid()) {
				throw new \Exception("Kamod cache is not valid");
			}
		}
		
		$this->parent_autoloader = $org_autoloader;
		
		spl_autoload_register([$this, 'load'], true, true);
	}

	
	public function load(string $class): bool {

		// we try to load the class from ka_cache directory
		//
		if ($this->kamod_manager->loadClass($class)) {
			return true;
		}
/*		
		$class_name = strtolower($class);
		
		$parts = explode($class_name, '\\');
		if ($parts[0] == 'Opencart') {
			
			switch ($parts[1]) {
				case 'admin':
				case 'catalog':
					if ($parts[2] == 'extension') {
						
					}
					
				case 'system':
				default:
					break;
			}
			
		
			$file = strtolower(str_replace('\\', '/', $class_name)) . '.php';
			var_dump($file); die;
		}
*/		
		return $this->parent_autoloader->load($class);
	}

	
	function __call($name, $args) {
		return call_user_func_array(array($this->parent_autoloader, $name), $args);
	}
	
/*	
	public function ka_loadAreaClass($class) {

		if (APPLICATION == 'Admin') {
			$file = 'admin\\' . $class . '.php';
		} else {
			$file = 'catalog\\' . $class . '.php';
		}
		
		if (!$this->kamod_manager->loadCacheFile($file)) {
			return false;
		}

		if (!class_exists($class)) {
			return false;
		}
		
		return true;
	}
*/	
}