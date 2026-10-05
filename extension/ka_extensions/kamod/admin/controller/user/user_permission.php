<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
	
	Hide any paths within kamod directories. They cannot be controlled by permissions and will only
	confuse the admin.
	
*/
namespace Opencart\Admin\Controller\Extension\KaExtensions\User;

class UserPermission extends \Opencart\Admin\Controller\User\UserPermission {

	use \Opencart\Extension\KaExtensions\System\TraitController;

	public function form(): void {
	
		$this->disableRender();
		parent::form();
		$this->enableRender();
		
		$data = $this->getRenderData();
		$template = $this->getRenderTemplate();
		
		$extensions = array();
		foreach ($data['extensions'] as $e) {
			if (preg_match('/extension\/[^\/]*\/kamod\//', $e, $matches)) {
				continue;
			}
		
			$extensions[] = $e;
		}
		$data['extensions'] = $extensions;
		
		$this->response->setOutput($this->load->view($template, $data));
	}
}