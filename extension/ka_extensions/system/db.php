<?php
/*
	$Project: Ka Extensions $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 4.1.1.0 $ ($Revision: 269 $)
*/
	
namespace Opencart\Extension\KaExtensions\System;

/**
	A wrapper around the OpenCart database object with helper methods for building and running
	insert, update and select queries.

	@package DB
*/
class Db {

	protected $db = null;
	
	/**
	 Creates the wrapper around the OpenCart database object.

	 $db — OpenCart database object.
	*/
	public function __construct($db) {
		$this->db = $db;
	}
		
	/**
	 Runs an SQL query.

	 $sql — SQL query.

	 @return array|object Array of result rows, or the original result object when there are no rows.
	*/
 	public function query($sql) {
 		$res = $this->db->query($sql);

		if (empty($res->rows)) {
			return $res;
		}
 		
		return $res->rows;
 	}

 	
	/**
	 Inserts a record or updates it when a duplicate key exists (INSERT ... ON DUPLICATE KEY UPDATE).

	 $table — table name without DB_PREFIX.
	 $data — field => value pairs.

	 @return int|false Last insert id or false on failure.
	*/
 	public function insertOrUpdate($table, $data) {
 	
 		return $this->insert($table, $data, false, true);
 	}

 	
	/**
	 Deprecated, use insert() instead.

	 $tbl — table name without DB_PREFIX.
	 $arr — field => value pairs.
	 $is_replace — use REPLACE instead of INSERT.

	 @return int|false Last insert id or false on failure.
	*/
	public function queryInsert($tbl, $arr, $is_replace = false) { 	
		return $this->insert($tbl, $arr, $is_replace);
	}
	
 	
	/**
	 Builds and runs an INSERT (or REPLACE) query from an array. Values are escaped, null becomes NULL, numeric keys are added as raw SQL expressions.

	 $tbl — table name without DB_PREFIX.
	 $arr — field => value pairs.
	 $is_replace — use REPLACE instead of INSERT.
	 $update_on_duplicate — add ON DUPLICATE KEY UPDATE with the same values.

	 @throws \Exception If the table name or the data array is empty.
	 @return int|false Last insert id or false on failure.
	*/
	public function insert($tbl, $arr, $is_replace = false, $update_on_duplicate = false) {

	    if (empty($tbl) || empty($arr) || !is_array($arr)) {
	    	throw new \Exception(__METHOD__ . ": Wrong parameters");
	    }

	    $query = $is_replace ? 'REPLACE' : 'INSERT';

    	$r = array();
    	
	    foreach ($arr as $k => $v) {
	    	if (is_numeric($k)) {
	    		$r[] = $v;
	    		continue;
	    	}
	    
	    	if (!(($k[0] == '`') && ($k[strlen($k) - 1] == '`'))) {
    	        $k = "`$k`";
        	}

        	if (!is_null($v)) {
		        $v = "'" . $this->db->escape($v) . "'";
			} else {
				$v = 'NULL';
			}
    		$r[] = $k . "=" . $v;
    	}

    	$tbl = DB_PREFIX . $tbl;
    	$query .= ' INTO `' . $tbl . '` SET ' . implode(', ', $r);

    	if ($update_on_duplicate) {
    		$query .= " ON DUPLICATE KEY UPDATE " . implode(', ', $r);
    	}
    	
    	if (!$this->db->query($query)) {
	    	return false;
		}

		return $this->db->getLastId();
	}

	/**
	 Deprecated, use update() instead.

	 $tbl — table name without DB_PREFIX.
	 $arr — field => value pairs.
	 $where — WHERE condition without the WHERE keyword.
	*/
	public function queryUpdate($tbl, $arr, $where = '') {
		$this->update($tbl, $arr, $where);
	}
	
	/**
	 Builds and runs an UPDATE query from an array. Values are escaped, null becomes NULL, numeric keys are added as raw SQL expressions.

	 $tbl — table name without DB_PREFIX.
	 $arr — field => value pairs.
	 $where — WHERE condition without the WHERE keyword; empty updates all rows.

	 @throws \Exception If the table name or the data array is empty.
	 @return mixed Result of the database query.
	*/
	public function update($tbl, $arr, $where = '') {
	    if (empty($tbl) || empty($arr) || !is_array($arr)) {
    	    throw new \Exception(__METHOD__ . ": wrong parameters");
	    }

		$tbl = DB_PREFIX . $tbl;

    	$r = array();

	    foreach ($arr as $k => $v) {
	    	if (is_numeric($k)) {
	    		$r[] = $v;
	    		continue;
	    	}
	    
	    	if (!(($k[0] == '`') && ($k[strlen($k) - 1] == '`'))) {
    	        $k = "`$k`";
        	}

        	if (!is_null($v)) {
		        $v = "'" . $this->db->escape($v) . "'";
			} else {
				$v = 'NULL';
			}
    		$r[] = $k . "=" . $v;
    	}

	    $query = 'UPDATE `' . $tbl . '` SET ' . implode(', ', $r) . ($where ? ' WHERE ' . $where : '');

    	return $this->db->query($query);
	}

	/**
	 Deprecated. Runs a query and returns the first row.

	 $qry — SQL query.

	 @return array First row of the result.
	*/
	public function queryFirst($qry) {
		$res = $this->db->query($qry);
		return $res->row;
	}

	/**
	 Runs a query, replacing DB_PREFIX with the MijoShop prefix when MijoShop is present.

	 $query — SQL query.

	 @return mixed Result of the database query.
	*/
	public function safeQuery($query) {
	
		if (in_array('MijoShop', get_declared_classes())) {
			$prefix = DB_PREFIX;
			$prefix = MijoShop::get('db')->getDbo()->replacePrefix($prefix);
			$query = str_replace(DB_PREFIX, $prefix, $query);
		}
		
		$result = $this->db->query($query);
		
		return $result;
	}
	
	/**
	 Runs a query and returns rows indexed by the value of the given column.

	 $qry_string — SQL query.
	 $key — column whose value is used as the array key.

	 @throws \Exception If the key column is missing.
	 @return array|false Rows indexed by the key or false if there are no rows.
	*/
	public function queryHash($qry_string, $key) {
	
		$qry = $this->db->query($qry_string);
		if (empty($qry->rows)) {
			return false;
		}
		
		$res = array();
		if (!isset($qry->row[$key])) {
			throw new \Exception(__METHOD__ . ": key not found ($key)");
		}
		
		foreach ($qry->rows as $row) {
			if (isset($row[$key])) {
				$res[$row[$key]] = $row;
			}
		}
		
		return $res;
	}
	
	
	/**
	 Returns the maximum lengths of varchar fields in a table. Only varchar(...) fields are supported, others get 0.

	 $table — full table name.
	 $fields — list of field names.

	 @return array|false Field => length pairs or false if the table or fields are empty.
	*/
	public function getFieldLengths($table, $fields) {
	
		$qry = $this->db->query("DESCRIBE `$table`");
		if (empty($qry->rows) || empty($fields)) {
			return false;
		}
		
		$ret = array_combine($fields, array_fill(0, count($fields), 0));
		foreach ($qry->rows as $f) {

			if (!in_array($f['Field'], $fields)) {
				continue;
			}
		
			if (!preg_match("/varchar\((\d*)\)/", $f['Type'], $matches)) {
				continue;
			}
			
			$ret[$f['Field']] = intval($matches[1]);
		}
		
		return $ret;	
	}
	
}