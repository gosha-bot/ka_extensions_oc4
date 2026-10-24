<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
	
	This file adds the 'Ka Extensions' menu item to the main menu.
	
*/
namespace Opencart\Admin\Controller\Extension\KaExtensions\Common;

use Opencart\Extension\KaExtensions\System\Arrays;

/**
	Kamod override of the admin left column controller. Adds the Ka Extensions menu.

	@internal
*/
class ControllerColumnLeft extends \Opencart\Admin\Controller\Common\ColumnLeft {

	use \Opencart\Extension\KaExtensions\System\TraitController;

	public function index(): string {
	
		$this->load->disableRender();
		parent::index();
		$this->load->enableRender();
		
		$data = $this->getRenderData();
		$template = $this->getRenderTemplate();		

		$data['menus'] = $this->injectKaExtensionsMenu($data['menus']);
		
		return $this->load->view($template, $data);
	}
	
	
	protected function injectKaExtensionsMenu($menus) {

		foreach ($menus as $mk => $menu) {

			if ($menu['id'] != 'menu-extension') {
				continue;
			}		

			foreach ($menu['children'] as $ck => $cv) {
			
				if (!strpos($cv['href'], 'marketplace/extension')) {
					continue;
				}

				$new_item = array(
					'name' => $this->language->get('Ka Extensions'),
					'href' => $this->url->link('extension/ka_extensions/extensions', 'user_token=' . $this->session->data['user_token']),
				);
				
				$menus[$mk]['children'] = Arrays::insertAfterKey($menus[$mk]['children'], $ck, [$new_item]);
				
				break 2;
			}
		}

		return $menus;
	}
}