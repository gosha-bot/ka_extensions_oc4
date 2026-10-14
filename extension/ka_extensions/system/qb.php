<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/
	
namespace Opencart\Extension\KaExtensions\System;

// Query Builder
class QB {

	var $select    = array();
	var $from      = array();
	var $innerJoin = array();
	var $leftJoin  = array();
	var $where     = array();
	var $limit     = array();
	var $orderBy   = array();
	var $groupBy   = array();
	
	protected $db = null;

	/**
	 Creates the query builder using the database object from the registry.
	*/
	public function __construct() {
		$this->db = KaGlobal::getRegistry()->get('db');
	}
	
	/**
	 Adds a table to the FROM clause.

	 $from — table name without DB_PREFIX.
	 $from_key — table alias.

	 @return QB This object.
	*/
	public function from($from, $from_key = '') {
		if (!empty($from_key)) {
			$this->from[$from_key] = $from;
		} else {
			$this->from[$from] = $from;
		}
		
		return $this;
	}

	
	/**
	 Adds an expression to the SELECT clause and optionally a table to FROM.

	 $what — field list or expression.
	 $from — table name without DB_PREFIX.
	 $from_key — table alias.

	 @return QB This object.
	*/
	public function select($what, $from = '', $from_key = '') {
		
		$this->select[] = $what;
		
		if (!empty($from)) {
			$this->from($from, $from_key);
		}
		
		return $this;
	}
	
	
	/**
	 Adds an INNER JOIN.

	 $from — table name without DB_PREFIX.
	 $from_key — table alias.
	 $condition — ON condition.

	 @return QB This object.
	*/
	public function innerJoin($from, $from_key = '', $condition = '') {
		
		$arr = array(
			'table' => $from,
			'on' => $condition
		);
	
		if (!empty($from_key)) {
			$this->innerJoin[$from_key] = $arr;
		} else {
			$this->innerJoin[$from] = $arr;
		}
		
		return $this;
	}

	/**
	 Adds a join meant as LEFT JOIN. Note: getSql() currently outputs it as INNER JOIN.

	 $from — table name without DB_PREFIX.
	 $from_key — table alias.
	 $condition — ON condition.

	 @return QB This object.
	*/
	public function leftJoin($from, $from_key = '', $condition = '') {
		
		$arr = array(
			'table' => $from,
			'on' => $condition
		);
	
		if (!empty($from_key)) {
			$this->leftJoin[$from_key] = $arr;
		} else {
			$this->leftJoin[$from] = $arr;
		}
		
		return $this;
	}
	
	/**
	 Adds a WHERE condition. Conditions are joined with AND, the elements of an array condition with OR.

	 $where — condition string, array of conditions, or a field name when $value is given.
	 $value — value compared with the field; escaped.

	 @return QB This object.
	*/
	public function where($where, $value = null) {
		if (!is_null($value)) {
			$where = "$where = '" . $this->db->escape($value) . "'";
		}
		$this->where[] = $where;
		
		return $this;
	}	
	
	/**
	 Sets the LIMIT clause.

	 $start — offset.
	 $limit — number of rows.

	 @return QB This object.
	*/
	public function limit($start, $limit) {
		$this->limit = array(
			'start' => $start,
			'limit' => $limit
		);
		
		return $this;
	}
	
	/**
	 Adds an ORDER BY expression.

	 $order — order expression.
	 $after — insert after this expression instead of appending.

	 @return QB This object.
	*/
	public function orderBy($order, $after = '') {
	
		if (empty($after)) {
			$this->orderBy[$order] = $order;
		} else {
			$this->orderBy = Arrays::insertAfterKey($this->orderBy, $order, $after);
		}
		
		return $this;
	}

	/**
	 Adds a GROUP BY expression.

	 $groupBy — group expression.
	 $after — insert after this expression instead of appending.

	 @return QB This object.
	*/
	public function groupBy($groupBy, $after = '') {
	
		if (empty($after)) {
			$this->groupBy[$groupBy] = $groupBy;
		} else {
			$this->groupBy = Arrays::insertAfterKey($this->groupBy, $groupBy, $after);
		}
		
		return $this;
	}
	
	/**
	 Builds the SQL query from the collected parts.

	 @return string SQL query.
	*/
	public function getSql() {

		$sql = '';
		
		// select parameters
		//
		if (!empty($this->select)) {
			$sql .= " SELECT " . implode(",", $this->select) . " ";
		}
		
		// from parameters
		//
		if (!empty($this->from)) {
			$sql .= " FROM ";
			foreach ($this->from as $k => $v) {			
				$sql .= DB_PREFIX . $v;
				if ($v != $k) {
					$sql .= " " . $k;
				}
			}
		}
		
		// inner join parameters
		//
		if (!empty($this->innerJoin)) {
			foreach ($this->innerJoin as $k => $v) {
				$sql .= " INNER JOIN " . DB_PREFIX . $v['table'] . ' ' . $k;
				
				if (!empty($v['on'])) {
					$sql .= " ON " . $v['on'] . " ";
				}
			}
		}

		// left join parameters
		//
		if (!empty($this->leftJoin)) {
			foreach ($this->leftJoin as $k => $v) {
				$sql .= " INNER JOIN " . DB_PREFIX . $v['table'] . ' ' . $k;
				
				if (!empty($v['on'])) {
					$sql .= " ON " . $v['on'] . " ";
				}
			}
		}
		
		// where parameters
		//
		if (!empty($this->where)) {
			$where = "";
			foreach ($this->where as $k => $v) {
				if (!empty($where)) {
					$where .= " AND ";
				}
				if (is_array($v)) {
					$where .= ' (' . implode(" OR ", $v) . ') ';
				} else {
					$where .= ' (' . $v . ') ';
				}
			}
			$sql .= " WHERE $where";
		}

		// group by
		//
		if (!empty($this->groupBy)) {
			$sql .= " GROUP BY " . implode($this->groupBy);
		}
		
		// order by
		//
		if (!empty($this->orderBy)) {
			$sql .= " ORDER BY " . implode($this->orderBy);
		}
		
		// limit
		//
		if (!empty($this->limit)) {
			if (isset($this->limit['start'])) {
				$sql .= " LIMIT " . $this->limit['start'];
				
				if (isset($this->limit['limit'])) {
					$sql .= ", " . $this->limit['limit'];
				}
			}
		}
		
		return $sql;
	}
	
	
	/**
	 Builds and runs the query.

	 @return mixed Result of the database query.
	*/
	public function query() {
		return $this->db->query($this->getSql());
	}
	
}