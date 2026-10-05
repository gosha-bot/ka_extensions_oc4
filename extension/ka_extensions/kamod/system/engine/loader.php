<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/

namespace Opencart\System\Extension\KaExtensions\Engine;

class Loader extends \Opencart\System\Engine\Loader {

	protected $ka_render_depth = array(0);
	protected $ka_tmp_view_data;
	protected $ka_tmp_view_route;

	public function __construct(\Opencart\System\Engine\Registry $registry) {
		\Opencart\Extension\KaExtensions\System\KaGlobal::init($registry);
		parent::__construct($registry);
	}
	
	public function controller(string $route, mixed ...$args): mixed {
		array_unshift($this->ka_render_depth, 0);
		
		array_unshift($args, $route);
		$result = call_user_func_array([parent::class, 'controller'], $args);
		
		array_shift($this->ka_render_depth);
		
		return $result;
	}
	
	
	public function getTmpViewData() {
		return $this->ka_tmp_view_data;
	}
	
	
	public function getTmpViewRoute() {
		return $this->ka_tmp_view_route;
	}	

	public function view(string $route, array $data = [], string $code = ''): string {

		if ($this->isRenderDisabled()) {
			$this->ka_tmp_view_data  = $data;
			$this->ka_tmp_view_route = $route;
			return '';
		}
		
		return parent::view($route, $data, $code);
	}
	
	
	/*
		$route - example: "extension/ka_extensions/vendor"
	*/
	public function kamodel($route) {

		// Sanitize the call
		
		$route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
		$model_name = 'model_' . str_replace('/', '_', (string)$route);
		
		$object = null;
		
		if ($this->registry->has($model_name)) {
			return $this->registry->get($model_name);
		}
		
		$object = $this->factory->model($route);
		$this->registry->set($model_name, $object);

		return $this->registry->get($model_name);
	}
	
	
	public function isRenderDisabled() {
		if (empty($this->ka_render_depth[0])) {
			return false;
		}
		return true;
	}
	
	public function disableRender() {
		$this->ka_render_depth[0]++;
		return;
	}

	public function enableRender() {
		$this->ka_render_depth[0]--;
		$this->ka_render_depth[0] = max($this->ka_render_depth[0], 0);
		return;		
	}
}