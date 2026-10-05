<?php
/*
	$Project: CSV Product Import $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 6.0.0.2 $ ($Revision: 581 $)
	
	This file adds the 'Ka Extensions' menu item to the main menu.
	
*/
namespace Opencart\Admin\Controller\Extension\KaExtensions\Common;

use \Opencart\Extension\KaExtensions\System\Arrays;

class ColumnLeft extends \Opencart\Admin\Controller\Common\ColumnLeft {

	use \Opencart\Extension\KaExtensions\System\TraitController;

	public function index(): string {

		$this->load->disableRender();
		parent::index();
		$this->load->enableRender();
		
		$data = $this->getRenderData();
		$template = $this->getRenderTemplate();		

		$kamodel = $this->load->kamodel('extension/mod1/test');
		$data['menus'][0]['name'] = $kamodel->getTitle();
		
		return $this->load->view($template, $data);
	}
}