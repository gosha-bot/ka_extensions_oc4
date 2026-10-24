<?php
/*
	$Project: Ka Extensions $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 4.1.1.0 $ ($Revision: 269 $)
*/
	
namespace Opencart\Extension\KaExtensions\System;

/**
	Extended pagination class. It renders the standard pagination and the results text.

	@package Controller
*/
class Pagination {

	public $total = 0;
	public $page  = 1;
	public $limit = 20;
	public $url   = '';
	protected $registry;
	protected $load;
	protected $config;
	protected $language;

	/**
	 $params — array with keys: total — total number of records; page — current page;
	 limit — records per page (the admin pagination setting by default); url — page url with '{page}'.
	*/
	public function __construct($params) {
		$this->registry = KaGlobal::getRegistry();
		$this->load     = $this->registry->get('load');
		$this->language = $this->registry->get('language');
		$this->config   = $this->registry->get('config');
		
		$this->total = $params['total'];
		$this->page  = $params['page'];

		if (!empty($params['limit'])) {
			$this->limit = $params['limit'];
		} else {
			$store_limit = $this->config->get('config_pagination_admin');
		 	if (!empty($store_limit)) {
		 		$this->limit = $store_limit;
		 	}
		}
		
		if (!empty($params['url'])) {
			$this->url = $params['url'];
		}
	}

	/**
	 Renders the pagination with the 'common/pagination' controller.

	 @return string
	*/
	public function getPagination() {
		$pagination = $this->load->controller('common/pagination', [
			'total' => $this->total,
			'page'  => $this->page,
			'limit' => $this->limit,
			'url'   => $this->url
		]);
		
		return $pagination;
	}
	
	/**
	 Returns a text like 'Showing 1 to 20 of 100 (5 Pages)'.

	 $text — sprintf format; the 'text_pagination' language string by default.

	 @return string
	*/
	public function getResults($text = '') {
	
		if (empty($text)) {
			$text = $this->language->get('text_pagination');
		}
	
		$from  = ($this->total) ? (($this->page - 1) * $this->limit) + 1 : 0;
		$to    = ((($this->page - 1) * $this->limit) > ($this->total - $this->limit)) ? $this->total : ((($this->page - 1) * $this->limit) + $this->limit);
		if ($this->limit <= 0) {
			$pages = 1;
		} else {
			$pages = ceil($this->total / $this->limit);
		}
	
		// 'Showing %d to %d of %d (%d Pages)'
		//
		$str = sprintf($text, $from, $to, $this->total, $pages);
		
		return $str;
	}
}