<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/

namespace Opencart\Admin\Controller\Extension\KaExtensions\Common;

/**
	Kamod override of the admin header controller.

	@internal
*/
class Header extends \Opencart\Admin\Controller\Common\Header {

	use \Opencart\Extension\KaExtensions\System\TraitController;

	private $kamodel_kamod;
	
	public function index(): string {

		// our scripts
		$this->document->addScript('../extension/ka_extensions/admin/view/javascript/common.js');	
	
		$this->disableRender();
		parent::index();
		$this->enableRender();
		
		$data     = $this->getRenderData();
		$template = $this->getRenderTemplate();
	
		$this->kamodel_kamod = $this->load->kamodel('extension/ka_extensions/kamod');
		
		$last_errors_total = $this->kamodel_kamod->getLastErrorsTotal();
		$data['kalog_errors_total'] = $last_errors_total;
		$data['kalog_errors_link'] = $this->url->linka('tool/log');
	
		return $this->load->view($template, $data);
	}
}