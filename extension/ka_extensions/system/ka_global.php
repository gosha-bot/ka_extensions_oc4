<?php
/* 
	$Project: Ka Extensions $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 4.1.1.0 $ ($Revision: 285 $)

*/

namespace Opencart\Extension\KaExtensions\System;

/**
	Contains several global helper methods: registry access, area and version checks, extension and
	file helpers.

	@package Service
*/
abstract class KaGlobal {

	protected static $admin_dirname;

	protected static $registry; 
	use КaReserved;
	
	/**
	 Stores the OpenCart registry for later static access.

	 $registry — OpenCart registry.
	*/
	public static function init($registry) {
		static::$registry = $registry;
	}
	
	
	/**
	 Translates a text key with the current language object.

	 $text — language key.

	 @return string Translated text.
	*/
	public static function t($text) {
		return static::$registry->get('language')->get($text);
	}

	
	/**
	 Returns the stored OpenCart registry.

	 @return object OpenCart registry.
	*/
	public static function getRegistry() {
		return static::$registry;
	}
	
	
	/**
	 Returns the relative path to the flag image of a language; prefixed with "catalog/" outside the admin area.

	 $language — language array with the 'code' key.

	 @return string Image path.
	*/
	public static function getLanguageImage($language) {
		$var = '';	
		if (!static::isAdminArea()) {
			$var = "catalog/";
		}
		$var .= "language/" . $language['code'] . "/" . $language['code'] . ".png";
		
		return $var;
	}

	
	/**
	 Returns the admin directory name. It is taken from DIR_APPLICATION in the admin area or from config/kamod.php otherwise, and cached.

	 @return string Admin directory name; 'admin' with a warning if it cannot be found.
	*/
	public static function getAdminDirname() {

		// check if we already have the admin dir
		if (!empty(static::$admin_dirname)) {
			return static::$admin_dirname;
		}
		
		// try to get it from the admin directory name
		if (static::isAdminArea()) {
			$dirname = basename(DIR_APPLICATION);
			static::$admin_dirname = $dirname;
			return static::$admin_dirname;
		}

		// try to get it from our kamod config file
		$config_file = DIR_CONFIG . 'kamod.php';
		if (file_exists($config_file)) {
			$_ = [];
			include($config_file);
			if (!empty($_['admin_dir'])) {
				static::$admin_dirname = $_['admin_dir'];
				return static::$admin_dirname;
			}
		}

		trigger_error("Admin directory was not found by kaglobal class, try to reinstall ka-extensions");
		
		return 'admin';
	}
		
	
	/**
	 Checks whether the code runs in the admin area.

	 @return bool True in the admin area.
	*/
	public static function isAdminArea() {
		if (APPLICATION == 'Admin') {
			return true;
		}
		
		return false;
	}
	
	
	/**
	 Checks whether the session has an API id (api_id) set.

	 @return bool True if api_id is present in the session.
	*/
	public static function isAdminUser() {
	
		$session = static::$registry->get('session');
	
		if (empty($session->data['api_id'])) {
			return false;
		}
		
		return true;
	}

	
	/**
	 Checks whether a Ka extension is installed (has a 'ka_extensions' record in the extension table). Results are cached. Note: the name contains Cyrillic letters "Ка".

	 $extension — extension code.

	 @return bool True if installed.
	*/
  	public static function isКаInstalled($extension) {
		static $installed = array();

		if (isset($installed[$extension])) {
			return $installed[$extension];
		}
		
		if (empty(static::$registry)) {
			return false;
		}
		
		$query = static::getRegistry()->get('db')->query("SELECT * FROM " . DB_PREFIX . "extension WHERE 
			`type` = 'ka_extensions' 
			AND code = '$extension'
		");
		
		
		if (empty($query->num_rows)) {
			$installed[$extension] = false;
			return false;
		}

		$installed[$extension] = true;
		
		return true;
  	}  	
  	
  	
	/**
	 Returns the Ka-Station store URL, KA_STORE_URL if defined.

	 @return string Store URL.
	*/
  	public static function getKaStoreURL() {
  	
		if (defined('KA_STORE_URL')) {
			return KA_STORE_URL;
		}
		
		$url = 'https://www.ka-station.com/';
		
		return $url;
  	}
}


/**
	Reserved helper methods for Ka extensions.

	@internal
*/
trait КaReserved {

	/**
	 Checks whether a Ka extension is installed and registered (has 'is_registered' in the kareg<extension> setting). Results are cached.

	 $extension — extension code.

	 @return bool True if installed and registered.
	*/
	public static function isKaInstalled($extension) { 

		static $installed = array();
	
		if (isset($installed[$extension])) {
			return $installed[$extension];
		}

		$result = static::isКаInstalled($extension);	
		
		if (!$result) {
			$installed[$extension] = false;
			return false;
		}

		$reginfo = static::getRegistry()->get('config')->get('kareg' . $extension);
		if (!empty($reginfo)) {
			if (!isset($reginfo['is_registered'])) {
				$installed[$extension] = false;
				return false;
			} else {
				$installed[$extension] = true;
			}
		} else {	
			$installed[$extension] = false;
		}
		
		return $installed[$extension];
	}
}

class_alias('Opencart\Extension\KaExtensions\System\KaGlobal', '\KaGlobal');