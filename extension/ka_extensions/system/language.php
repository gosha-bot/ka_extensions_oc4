<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/
	
namespace Opencart\Extension\KaExtensions\System;

use \Opencart\Extension\KaExtensions\System\KaGlobal;

class Language {

	protected $registry;
	protected $db;
	protected $config;
	
	static $cache = array();
	
	public $language = array();
	protected $language_code;
	protected $language_filename;
	protected $language_directory;

	/**
	 Loads a language by id and creates an OpenCart language object with the Ka Extensions path and default file loaded.

	 $language_id — language id.
	*/
	protected function __construct($language_id) {

		$this->registry = \KaGlobal::getRegistry();
		$this->db = $this->registry->get('db');

		$row = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language`
		 	WHERE language_id = '" . intval($language_id) . "'"
		)->row;

		if (empty($row)) {
			return false;
		}
		
		$this->language_code      = $row['code'];
		$this->language_filename  = $row['code'];
		$this->language_directory = $row['code'];

		$this->language = new \Opencart\System\Library\Language($this->language_directory);
		$this->language->addPath(DIR_LANGUAGE);
		// common language files of Ka Extensions for emails are in the catalog directory
		$this->language->addPath('extension/ka_extensions', DIR_EXTENSION . 'ka_extensions/catalog/language/');

		// language files of other extensions, like OpenCart adds them for the current area
		$area = KaGlobal::isAdminArea() ? 'admin' : 'catalog';
		foreach (glob(DIR_EXTENSION . '*', GLOB_ONLYDIR) as $dir) {
			$code = basename($dir);
			if ($code != 'ka_extensions') {
				$this->language->addPath('extension/' . $code, $dir . '/' . $area . '/language/');
			}
		}
		$this->language->load('default');
	}

	
	/**
	 Returns a cached language object for the language id, creating it if necessary.

	 $language_id — language id.

	 @return object OpenCart language object.
	*/
	static public function getLanguage($language_id) {
	
		if (!empty(static::$cache[$language_id])) {
			return static::$cache[$language_id]->language;
		}

		static::$cache[$language_id] = new Language($language_id);
		return static::$cache[$language_id]->language;
	}
	
	
	/**
	 Returns the language id by its code.

	 $code — language code, e.g. "en-gb".

	 @return int|false Language id or false if not found.
	*/
	static public function getLanguageIdByCode($code) {
	
		$registry = KaGlobal::getRegistry();
		$db = $registry->get('db');
	
		$language = $db->query("SELECT * FROM " . DB_PREFIX . "language WHERE 
			code = '" . $db->escape($code) . "'
		")->row;
		if (empty($language)) {
			return false;
		}
		
		return $language['language_id'];
	}	
}