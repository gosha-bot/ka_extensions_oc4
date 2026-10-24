<?php
/* 
 $Project: Ka Extensions $
 $Author: karapuz team <support@ka-station.com> $
 $Version: 4.1.0.21 $ ($Revision: 206 $) 
*/

namespace Opencart\Extension\KaExtensions\System;

/**
	Formats and parses values (numbers, prices, dates, weights, lengths, sizes) with language based settings.

	@package Service
*/
class Format {

	protected $registry;
	protected $db;
	protected $config;

	protected $model_localisation_language;
	
	protected $language;     // language object
	protected $language_id;
	
	protected $length_classes_by_id;
	protected $length_classes_by_unit;

	protected $weight_classes_by_id;
	protected $weight_classes_by_unit;
	
	/**
	 Loads language strings and length and weight classes.

	 $language_id — language ID; the current admin or store language by default.
	*/
	public function __construct($language_id = null) {

		$this->registry = KaGlobal::getRegistry();
		$this->db       = $this->registry->get('db');
		$this->config   = $this->registry->get('config');

		setlocale(LC_NUMERIC, 'C');
		
		$this->registry->get('load')->model('localisation/language');
		$this->model_localisation_language = $this->registry->get('model_localisation_language');

		$language = false;
		if (empty($language_id)) {
			$language_id = $this->config->get('config_language_id');
		}
		$language = $this->model_localisation_language->getLanguage($language_id);

		if (empty($language)) {
			trigger_error("KaFormat::__construct: language ($language_id) not found", E_USER_ERROR);
			return false;
		}
		
		$this->language_id = $language['language_id'];
		$this->language = new \Opencart\System\Library\Language($language['code']);

		// first we add a main directory
		$this->language->addPath(DIR_APPLICATION);
		
		// later we add possible paths from extensions
		// it might be sufficient here to add just the main path but we decided to implement multi-load just as
		// an example for further references
		//
		if (KaGlobal::isAdminArea()) {
			$this->language->addPath('extension/ka_extensions', DIR_OPENCART . 'extension/ka_extensions/admin/language/');
		} else {
			$this->language->addPath('extension/ka_extensions', DIR_OPENCART . 'extension/ka_extensions/catalog/language/');
		}
		$this->language->load('extension/ka_extensions/format');

		// init length classes for quick access
		//
		$length_classes = $this->db->query("SELECT * FROM " . DB_PREFIX .  "length_class_description")->rows;
		foreach ($length_classes as $k => $class) {
			if (!empty($class['unit'])) {
				$this->length_classes_by_unit[mb_strtolower($class['unit'])] = $class;
			}

			if ($this->language_id == $class['language_id']) {
				$this->length_classes_by_id[$class['length_class_id']] = $class; 
			}
		}

		// init weight classes for quick access
		//
		$weight_classes = $this->db->query("SELECT * FROM " . DB_PREFIX .  "weight_class_description")->rows;
		foreach ($weight_classes as $k => $class) {
			if (!empty($class['unit'])) {
				$this->weight_classes_by_unit[mb_strtolower($class['unit'])] = $class;
			}
			
			if ($this->language_id == $class['language_id']) {
				$this->weight_classes_by_id[$class['weight_class_id']]   = $class; 
			}
		}
		
		return true;
	}
	
	/**
	 Trims the string and removes the characters from its beginning and end.

	 $str — string.
	 $chars — a character or array of characters.

	 @return string
	*/
	public function strip($str, $chars) {
		$str = trim($str);

		if (empty($chars)) {
			return $str;
		}

		if (!is_array($chars)) {
			$chars = array($chars);
		}

		$pat = array();
		$rep = array();
		foreach($chars as $char) {
			$pat[] = "/(" . preg_quote($char, '/') . ")*$/";
			$rep[] = '';
			$pat[] = "/^(" . preg_quote($char, '/') . ")*/";
			$rep[] = '';
		}

		$res = preg_replace($pat, $rep, $str);
		
		return $res;
	}

	/**
	 Removes all characters except digits, '-', '.', ',' and '`' and replaces commas with dots.

	 $number — value to parse.

	 @return string
	*/
	public static function parseNumber($number) {

		// remove all useless characters from the price
		//
		$number = preg_replace("([^\d\-\.`,])", "", $number);

		$number = str_replace(',', '.', $number);
		
		return $number;
	}
		
	/**
	 Parses a price. Supports values like '.99', '0,99', '$1,200.00', '123,456.78' => '123456.78'.

	 $price — value to parse.

	 @return float|string
	*/
	public static function parsePrice($price) {
	
		$price = static::parseNumber($price);
	
		if (!preg_match("/([\d\-,\.` ]*)([\.,])(\d*)$/U", $price, $matches)) {
			return $price;
		}

		$matches[1] = preg_replace("/[^\d\-]/", "", $matches[1]);
		$res = doubleval($matches[1] . '.' . $matches[3]);
		
		return $res;
	}

	/**
	 Converts a price to float.

	 $price — price value.

	 @return float
	*/
	public function formatPrice($price) {
		
		$price = (float) $price;
		
		return $price;
	}
	
    /**
     Parses a date string.

     $str — date string.

     @return string Date in 'Y-m-d H:i:s' format; empty string on error.
    */
    public function parseDate($str) {
    
    	$res = '';

    	$date = strtotime($str);
    	if (!empty($date)) {
	    	$res = date("Y-m-d H:i:s", $date);
	    }
	    
	    return $res;
    }
    
		
	/**
	 Converts a date to YYYY-MM-DD format. Supports 'yyyy-mm-dd', 'mm/dd/yyyy' and 'dd.mm.yyyy'.

	 $date — date string, it is replaced with the formatted date.

	 @return bool True if the date was recognized.
	*/
	public function formatDate(&$date) {
	
		$date = trim($date);
		
		// yyyy-mm-dd
		if (preg_match("/^\d{4}-\d{1,2}-\d{1,2}$/", $date, $matches)) {
			return true;

		// mm/dd/yyyy
		} elseif (preg_match("/^(\d{1,2})\/(\d{1,2})\/(\d{2,4})$/", $date, $matches)) {
			if ($matches[3] < 100) {
				$matches[3] += 2000;
			}
			$date = sprintf("%04d-%02d-%02d", $matches[3], $matches[1], $matches[2]);			
			return true;
			
		// dd.mm.yyyy
		} elseif (preg_match("/^(\d{1,2})\.(\d{1,2})\.(\d{2,4})$/", $date, $matches)) {
			if ($matches[3] < 100) {
				$matches[3] += 2000;
			}
			$date = sprintf("%04d-%02d-%02d", $matches[3], $matches[2], $matches[1]);
			return true;
		}
		
		return false;
	}
	
	/**
	 Formats a time interval like '1 days 2 hours 3 minutes 4 seconds'.

	 $diff — number of seconds since specific moment.

	 @return string
	*/
	public function formatPassedTime($diff) {

 		$periods = array( //suffixes
	    	'd' => array(86400, $this->language->get('text_days')),
	   		'h' => array(3600, $this->language->get('text_hours')),
      		'm' => array(60, $this->language->get('text_minutes')),
			's' => array(1, $this->language->get('text_seconds'))
  		);

		$ret = '';
		foreach ($periods as $k => $v) {
			$num = floor($diff / $v[0]);
				if ($num || !empty($ret) || $k == 's') {
					$ret .= $num . ' ' . $v[1] . ' ';
				}
				$diff -= $v[0] * $num;
		}

	    return $ret;
	}

	
	/**
	 Converts values like 10M to bytes. Supports 'k', 'm' and 'g' suffixes.

	 $file_size — size string.

	 @return int
	*/
	public function convertToByte($file_size) {
		$val = trim($file_size);
		$numeric_value = (int)strtolower(substr($val, 0, -1));
		switch (strtolower(substr($val, -1))) {
			case 'g':
				$numeric_value *= 1024;
			case 'm':
				$numeric_value *= 1024;
			case 'k':
				$numeric_value *= 1024;
		}
		return $numeric_value;
	}


	/**
	 Converts a value to human readable format like 10.1 Mb.

	 $val — number of bytes or a size string like 10M.

	 @return string
	*/
	public function convertToMegabyte($val) {
	
		if (!is_numeric($val)) {
			$val = $this->convertToByte($val);
		}

		if ($val >= 1073741824) {
			$val = round($val/1073741824, 1) . " Gb";

		} elseif ($val >= 1048576) {
			$val = round($val/1048576, 1) . " Mb";

		} elseif ($val >= 1024) {
			$val = round($val/1024, 1) . " Kb";
		} else {
			$val = $val . " bytes";
		}

		return $val;
	}
	
	
	/**
	 Parses a weight value like '0.0234g'. The function does NOT create a new weight class.

	 $weight — weight string.

	 @return array Array like array('value' => 0.0234, 'weight_class_id' => 4).
	*/
	public function parseWeight($weight) {

		$pair = array();
	
		$matches = array();
		if (preg_match("/([\d\.\,]*)([\D]*)$/", $weight, $matches)) {
			$pair['value'] = static::parseNumber($matches[1]);
			$pair['weight_class_id'] = $this->getWeightClassIdByUnit($matches[2]);
		}
		
		return $pair;
	}

	
	/**
	 Parses a length value like '10cm'. The function does NOT create a new length class.

	 $length — length string.

	 @return array Array with 'value' and 'length_class_id' keys.
	*/
	public function parseLength($length) {
	
		$pair = array();
	
		$matches = array();
		if (preg_match("/(.*)([\D]*)$/U", $length, $matches)) {
			$pair['value']           = static::parseNumber($matches[1]);
			$pair['length_class_id'] = $this->getLengthClassIdByUnit($matches[2]);
		}

		return $pair;
	}

	
	/**
	 Returns a length class ID by its unit.

	 $unit — unit like 'cm'.

	 @return int|string Empty string if the unit is not found.
	*/
	public function getLengthClassIdByUnit($unit) {

		$unit = mb_strtolower($unit);	
		$class_id = '';
	
		if (!empty($this->length_classes_by_unit[$unit])) {
			$class_id = $this->length_classes_by_unit[$unit]['length_class_id'];
		}
		
		return $class_id;
	}
	

	/**
	 Returns a weight class ID by its unit.

	 $unit — unit like 'kg'.

	 @return int|string Empty string if the unit is not found.
	*/
	public function getWeightClassIdByUnit($unit) {
	
		$unit = mb_strtolower($unit);
		$class_id = '';
	
		if (!empty($this->weight_classes_by_unit[$unit])) {
			$class_id = $this->weight_classes_by_unit[$unit]['weight_class_id'];
		}
		
		return $class_id;
	}
	
	/**
	 Formats a weight with 2 decimals and its unit.

	 $val — weight value.
	 $class_id — weight class ID.
	 $decimal_point — decimal separator.
	 $thousand_point — thousands separator.

	 @return string
	*/
	public function formatWeight($val, $class_id, $decimal_point = '.', $thousand_point = '') {
		
		$val = doubleval($val);
		$unit = $this->getWeightUnit($class_id);
		
		$val = number_format($val, 2, $decimal_point, $thousand_point) . $unit;

		return $val;
	}
		
	/**
	 Returns a weight unit by the weight class ID.

	 $class_id — weight class ID.

	 @return string
	*/
	public function getWeightUnit($class_id) {
		$unit = '';
		if (!empty($this->weight_classes_by_id[$class_id])) {
			$unit = $this->weight_classes_by_id[$class_id]['unit'];
		}
		
		return $unit;
	}
	
	/**
	 Formats a length with 2 decimals and its unit.

	 $val — length value.
	 $class_id — length class ID.
	 $decimal_point — decimal separator.
	 $thousand_point — thousands separator.

	 @return string
	*/
	public function formatLength($val, $class_id, $decimal_point = '.', $thousand_point = '') {

		$val = doubleval($val);
		$unit = $this->getLengthUnit($class_id);
		
		$val = number_format($val, 2, $decimal_point, $thousand_point) . $unit;

		return $val;
	}
	
	/**
	 Returns a length unit by the length class ID.

	 $class_id — length class ID.

	 @return string
	*/
	public function getLengthUnit($class_id) {

		$unit = '';
		if (!empty($this->length_classes_by_id[$class_id])) {
			$unit = $this->length_classes_by_id[$class_id]['unit'];
		}
		
		return $unit;
	}
}