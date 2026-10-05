<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)

	This is a controller class for a basic module settings page.
*/
namespace Opencart\Extension\KaExtensions\System;

abstract class ControllerForm extends Controller {

	use TraitControllerForm;
	protected $pagination;
	
	protected function onLoad() {

		$this->load->language('extension/ka_extensions/common');
		
		$this->fields = $this->getFields();
		if (!empty($this->fields)) {
			foreach ($this->fields as $k => $v) {
				if (empty($v['code'])) {
					$this->fields[$k]['code'] = $k;
				}
			}
		}

		// set page url parameters
		//
		$page_url_params = array();
		
		if (!empty($this->session->data['user_token'])) {

			$page_url_params['user_token'] = $this->session->data['user_token'];
			$this->addBreadcrumb($this->language->get('text_home'), $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])); 
			
		} else {
			if (KaGlobal::isAdminArea()) {
				$this->addBreadcrumb($this->language->get('text_home'), $this->url->link('common/dashboard')); 
		   	} else {
		   		$this->addBreadcrumb($this->language->get('text_home'), $this->url->link('common/home')); 
		   	}
		}		
		$page_params = $this->getPageUrlParams();
		if (!empty($page_params)) {
			$page_url_params = array_merge($page_url_params, $page_params);
		}		
		$this->url_params = new UrlParams($this->request, $page_url_params);
		
		parent::onLoad();
	}

	
	abstract protected function getFields();	
	abstract protected function getPageUrlParams();
	
	protected function addBreadcrumb($text, $href = '') {
		if (!isset($this->data['breadcrumbs'])) {
			$this->data['breadcrumbs'] = array();
		}
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $text,
			'href'      => $href,
   		);
	}
	
	protected function showPage($page = '', $data = array()) {
	
		if (!empty($this->pagination)) {
			$this->data['pagination'] = $this->pagination->getPagination();
			$this->data['results']    = $this->pagination->getResults();		
		}

		if (!empty($this->data['fields'])) {
			foreach ($this->data['fields'] as $f) {
				if (!empty($f['type'])) {
					if ($f['type'] == 'file') {
						$data['is_multipart_form'] = true;
						break;
					}
				}
			}
		}

		return parent::showPage($page, $data);
	}
	
	protected function validate() {
	
		if (!$this->validateModify()) {
			return false;
		}

		if (!$this->validateFields($this->fields, $this->request->post)) {
			return false;
		}
	
		return true;
	}	
	
	
  	protected function validateModify() {
  	
  		if (version_compare(VERSION, '4.0.2.0', '>=')) {
			$pos = strrpos($this->request->get['route'], '.');
		} else {
			$pos = strrpos($this->request->get['route'], '|');
		}
		if ($pos) {
			$route = substr($this->request->get['route'], 0, $pos);
		} else {
			$route = $this->request->get['route'];
		}
		
    	if (!$this->user->hasPermission('modify', $route)) {
      		$this->addTopMessage($this->language->get('error_permission'), 'E');
      		return false;
    	}
    	
	  	return true;
  	}	
	
}