<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/
	
namespace Opencart\Extension\KaExtensions\System;

use \extension\ka_extensions\KaGlobal;

class Language {

	protected $registry;
	protected $db;
	protected $config;
	
	static $cache = array();
	
	public $language = array();
	protected $language_code;
	protected $language_filename;
	protected $language_directory;

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
		$this->language->addPath('extension/ka_extensions');		
		$this->language->load('default');
	}

	
	static public function getLanguage($language_id) {
	
		if (!empty(static::$cache[$language_id])) {
			return static::$cache[$language_id]->language;
		}

		static::$cache[$language_id] = new Language($language_id);
		return static::$cache[$language_id]->language;
	}
	
	
	/*
		code - example: "en-gb"
		
		This function is supposed to fetch the langauge_id from setting variables which are defined in codes.
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