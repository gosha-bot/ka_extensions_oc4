<?php

namespace Opencart\Admin\Model\Extension\Mod2\Kamod;

class Test extends \Opencart\Admin\Model\Extension\Mod1\Model {
	
	public function getTitle() {
		$title = parent::getTitle();
		return $title . "22";
	}
}