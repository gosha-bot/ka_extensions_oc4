<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/

namespace Opencart\Admin\Model\Extension\KaExtensions;

/**
	Admin model for the kamod cache: rebuilds the theme cache and counts kamod errors.

	@internal
*/
class Kamod extends \Opencart\Extension\KaExtensions\System\Model {

	protected $kamod_manager;

	protected function onLoad() {
		$this->kamod_manager = \extension\ka_extensions\KamodManager::getInstance();
	}

	/*
		Complete rebuild of the theme cache and saving it in theme.kamod directory. Keeping templates there
		helps us to patch them and inherite. Also they are supposed to work slightly faster because there is no
		need to generate a cache for them everytime.
	*/
	public function rebuildThemeCache() {
	
		$this->kamod_manager->emptyThemeCache();
		
		$this->load->model('design/theme');
		
		// all themes, getThemes() returns 10 records by default
		$themes = $this->model_design_theme->getThemes(0, max(1, $this->model_design_theme->getTotalThemes()));
		
		foreach ($themes as $theme) {
			// disabled templates are not used by OpenCart
			if (empty($theme['status'])) {
				continue;
			}
			$code = html_entity_decode($theme['code'], ENT_QUOTES, 'UTF-8');
			$this->kamod_manager->storeThemeFile($theme['store_id'], $theme['route'], $code);
		}
		
		$this->kamod_manager->rebuildTwigCache();
	}
	
	
	public function getLastErrorsTotal() {
		$total = $this->kamod_manager->getLastErrorsTotal();
		
		return $total;
	}
	
}