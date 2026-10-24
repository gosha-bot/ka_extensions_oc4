<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/

namespace Opencart\Admin\Controller\Extension\KaExtensions\Design;

class Theme extends \Opencart\Admin\Model\Design\Theme {

	public function addTheme(array $data): int {
	
		$theme_id = parent::addTheme($data);
		
		$kamodel_kamod = $this->load->kamodel('extension/ka_extensions/kamod');
		$kamodel_kamod->rebuildThemeCache();
		
		return $theme_id;
	}

	public function editTheme(int $theme_id, array $data): void {
	
		parent::editTheme($theme_id, $data);
		
		$kamodel_kamod = $this->load->kamodel('extension/ka_extensions/kamod');
		$kamodel_kamod->rebuildThemeCache();
	}

	public function deleteTheme(int $theme_id): void {
	
		parent::deleteTheme($theme_id);
		
		$kamodel_kamod = $this->load->kamodel('extension/ka_extensions/kamod');
		$kamodel_kamod->rebuildThemeCache();
	}

}