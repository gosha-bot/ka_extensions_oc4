<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/

namespace Opencart\Extension\KaExtensions\System;

trait TraitController {

	protected $template = '';

	protected $data     = array();
	protected $children = array();

	protected $is_render_disabled = false;

	/**
	 Returns the template data merged with the temporary view data from the loader.

	 @return array Template data.
	*/
	protected function getRenderData() {
		$data = $this->load->getTmpViewData();
		if (!empty($data)) {
			$this->data = array_merge($this->data, $data);
		}
		return $this->data;
	}

	/**
	 Returns the temporary view route from the loader.

	 @return string Template route.
	*/
	protected function getRenderTemplate() {
		return $this->load->getTmpViewRoute();
	}

	/**
	 Disables rendering so child classes can change data or the template before output. Unifies the interface with KaController.
	*/
	protected function disableRender() {
		$this->is_render_disabled = true;
		$this->load->disableRender();
	}

	/**
	 Enables rendering again. Unifies the interface with KaController.
	*/
	protected function enableRender() {
		$this->is_render_disabled = false;
		$this->load->enableRender();
	}
	
	
	/**
	 Adds a message shown at the top of the page; stored in the session.

	 $msg — message text or array of texts.
	 $type — message type, 'S' by default.
	*/
	protected function addTopMessage($msg, $type = 'S') {
	
		if (!is_array($msg)) {
			$msg = array($msg);
		}

		foreach ($msg as $text) {
			$this->session->data['ka_top_messages'][] = array(
				'type'    => $type,
				'content' => $text
			);
		}
	}

	
	/**
	 Returns top page messages from the session.

	 $clear — remove messages from the session.

	 @return array|null Messages or null.
	*/
	protected function getTopMessages($clear = true) {

		if (isset($this->session->data['ka_top_messages'])) {
			$top = $this->session->data['ka_top_messages'];
		} else {
			$top = null;
		}

		if ($clear) {		
			$this->session->data['ka_top_messages'] = null;
		}
		return $top;
	}
	
	/**
	 Renders the template with data and page blocks (children or the standard header, footer and columns). Returns an empty string when rendering is disabled. Example:

	 public function index() {
	     $this->disableRender();
	     parent::index();
	     $this->enableRender();
	     $this->response->setOutput($this->render());
	 }

	 $tpl — template name.
	 $data — template variables merged with existing data.

	 @return string Rendered page.
	*/
	protected function render($tpl = '', $data = array()) {

		if (!empty($data)) {
			$this->data = array_merge($this->data, $data);
		}
		
		if (!empty($tpl)) {
			$this->template = $tpl;
		}
		
		if ($this->is_render_disabled) {
			return '';
		}
	
		if (!empty($this->children)) {
			foreach ($this->children as $child) {
				$this->data[basename($child)] = $this->load->controller($child);
			}
		} else {
			if (KaGlobal::isAdminArea()) {
				$this->loadAdminPageBlocks();
			} else {
				$this->loadCustomerPageBlocks();
			}
		}
	
		$this->data['top_messages'] = $this->getTopMessages();

		$GLOBALS['ka_is_language_injection_disabled'] = true;

		$result = $this->load->view($this->template, $this->data);
		$GLOBALS['ka_is_language_injection_disabled'] = false;
		
		return $result;
	}
	

	/**
	 Renders the page and sets it as the response output. Sets heading_title and page_id when missing and adds Ka Extensions CSS and JS.

	 $template — template name inside the module directory.
	 $data — template variables; replace existing data.
	*/
	protected function showPage($template = '', $data = array()) {

		if (!empty($data)) {
			$this->data = $data;
		}
		
		if (!empty($template)) {
			$this->template = $template;
		}
		
		if (empty($this->data['heading_title'])) {
			$this->data['heading_title'] = $this->document->getTitle();
		}
		
		// the page id is generated from the template name when it is not defined explicitly
		//
		if (empty($this->data['page_id'])) {
			if (!empty($this->request->get['route'])) {
				$this->data['page_id'] = $this->request->get['route'];
			} else {
				$this->data['page_id'] = 'home';
			}
		}

		$this->document->addStyle('../extension/ka_extensions/admin/view/stylesheet/stylesheet.css');
		$this->document->addScript('../extension/ka_extensions/admin/view/javascript/common.js');

		$this->response->setOutput($this->render($this->template));
	}
	
	
	/**
	 Loads admin page blocks (header, left column, footer) and user_token into the data.
	*/
	protected function loadAdminPageBlocks() {
		if (!empty($this->session->data['user_token'])) {
			$this->data['user_token'] = $this->session->data['user_token'];
		}
		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');
	}

	
	/**
	 Loads storefront page blocks (header, footer, columns, content top and bottom) into the data.
	*/
	protected function loadCustomerPageBlocks() {
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['column_right'] = $this->load->controller('common/column_right');
		$this->data['content_top'] = $this->load->controller('common/content_top');
		$this->data['content_bottom'] = $this->load->controller('common/content_bottom');
		$this->data['footer'] = $this->load->controller('common/footer');
		$this->data['header'] = $this->load->controller('common/header');
	}	
	
	protected $lastError;
	
	/**
	 Returns the last error.

	 @return mixed Last error.
	*/
	public function getLastError() {
		return $this->lastError;
	}
}