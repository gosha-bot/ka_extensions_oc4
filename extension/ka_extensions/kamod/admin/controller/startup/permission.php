<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)

	We always allow to see the 'Ka Extensions' page. Probably it will be hidden later by the permissions.
*/

namespace Opencart\Admin\Controller\Extension\KaExtensions\Startup;

/**
	Kamod override of the admin permission check. The 'Ka Extensions' page is always allowed.

	@internal
*/
class Permission extends \Opencart\Admin\Controller\Startup\Permission {

	public function index(): ?\Opencart\System\Engine\Action {

		if (!empty($this->request->get['route'])) {
			if (strpos($this->request->get['route'], 'extension/ka_extensions/extensions') !== false) {
			
				// we always allow those users to see the ka extensions page who can grant access to 
				// that page ourselves
				//
				if ($this->user->hasPermission('access', 'user/user_permission')
				 && $this->user->hasPermission('modify', 'user/user_permission')
				) {
					return null;
				}
			}
		}
		
		return parent::index();
	}
}
