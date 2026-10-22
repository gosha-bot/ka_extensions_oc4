<?php
/*
	Basic install tests of Ka Extensions on a clean OpenCart 4 store.

	The script builds the package from this working copy, installs a clean OpenCart store from
	the official archive and installs Ka Extensions through the admin area over HTTP, the way
	readme.ka_extensions.txt describes it. Then it checks the menu, the pages and the error log
	and uninstalls the package.

	Usage:
		php tests/run.php --oc=<opencart dir or zip> [--port=8096] [--work-dir=...] [--db=...]

	Environment:
		KA_TEST_DB_HOST (localhost), KA_TEST_DB_USER (root), KA_TEST_DB_PASSWORD ('')
*/

error_reporting(E_ALL);

class KaExtTest {

	protected $opt;
	protected $db;
	protected $base_url;
	protected $store_dir;
	protected $cookie_file;
	protected $token;
	protected $failures = 0;
	protected $passed   = 0;

	public function __construct($opt) {
		$this->opt = $opt;
	}

	/////////////////////// helpers ///////////////////////

	protected function log($msg) {
		echo $msg . "\n";
	}

	protected function fail($msg) {
		fwrite(STDERR, "FATAL: $msg\n");
		$this->stopServer();
		exit(1);
	}

	protected function check($cond, $msg) {
		if ($cond) {
			$this->passed++;
			$this->log("  ok   $msg");
		} else {
			$this->failures++;
			$this->log("  FAIL $msg");
		}
		return $cond;
	}

	protected function sh($cmd) {
		exec($cmd . ' 2>&1', $out, $ret);
		if ($ret) {
			$this->fail("Command failed: $cmd\n" . implode("\n", $out));
		}
		return implode("\n", $out);
	}

	protected function query($sql) {
		$res = $this->db->query($sql);
		if ($res === true) {
			return array();
		}
		return $res->fetch_all(MYSQLI_ASSOC);
	}

	protected function value($sql) {
		$rows = $this->query($sql);
		if (empty($rows)) {
			return null;
		}
		return reset($rows[0]);
	}

	protected function http($route, $post = null, $get = '') {
		$url = $this->base_url . 'admin/index.php?route=' . $route;
		if (!empty($this->token)) {
			$url .= '&user_token=' . $this->token;
		}
		if ($get !== '') {
			$url .= '&' . $get;
		}
		return $this->httpUrl($url, $post);
	}

	protected function httpUrl($url, $post = null) {
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_COOKIEJAR, $this->cookie_file);
		curl_setopt($ch, CURLOPT_COOKIEFILE, $this->cookie_file);
		curl_setopt($ch, CURLOPT_HEADER, true);
		curl_setopt($ch, CURLOPT_TIMEOUT, 300);
		curl_setopt($ch, CURLOPT_USERAGENT, 'ka-ext-tests');
		if (!is_null($post)) {
			curl_setopt($ch, CURLOPT_POST, true);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
		}
		$resp = curl_exec($ch);
		if ($resp === false) {
			$this->fail("HTTP request failed: $url " . curl_error($ch));
		}
		$header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
		$ret = array(
			'code'     => curl_getinfo($ch, CURLINFO_HTTP_CODE),
			'location' => '',
			'body'     => substr($resp, $header_size),
		);
		if (preg_match('/^Location:\s*(.*)$/mi', substr($resp, 0, $header_size), $m)) {
			$ret['location'] = html_entity_decode(trim($m[1]));
		}
		return $ret;
	}

	/*
		Returns PHP errors found in a page and new lines of the store error log.
	*/
	protected function getErrors($body = '') {
		$errors = array();
		if (preg_match_all('/<b>(Warning|Notice|Fatal error|Deprecated|Parse error)<\/b>:.*?<br \/>|(?:PHP )?(Warning|Notice|Deprecated|Fatal Error|Error): .{0,300}? in .{0,200}? on line \d+/s', $body, $m)) {
			$errors = array_merge($errors, array_map('strip_tags', $m[0]));
		}
		$log = $this->store_dir . '/system/storage/logs/error.log';
		if (is_file($log)) {
			$text = trim(file_get_contents($log));
			if ($text !== '') {
				$errors[] = 'error.log: ' . substr($text, 0, 1500);
				file_put_contents($log, '');
			}
		}
		return $errors;
	}

	protected function checkNoErrors($resp, $title) {
		$errors = $this->getErrors($resp['body']);
		$this->check($resp['code'] == 200 && empty($errors), "$title: HTTP $resp[code]" . (empty($errors) ? '' : ', errors: ' . implode(' | ', $errors)));
	}

	/////////////////////// store setup ///////////////////////

	public function setup() {

		$port = $this->opt['port'];
		$this->base_url    = "http://localhost:$port/";
		$this->store_dir   = $this->opt['work-dir'] . '/store';
		$this->cookie_file = $this->opt['work-dir'] . '/cookies.txt';

		$this->sh('rm -rf ' . escapeshellarg($this->opt['work-dir']));
		mkdir($this->opt['work-dir'], 0777, true);
		$oc = $this->opt['oc'];
		if (is_file($oc)) {
			$this->sh('cd ' . escapeshellarg($this->opt['work-dir']) . ' && unzip -q ' . escapeshellarg(realpath($oc)) . ' -d oc_src');
			$oc = $this->opt['work-dir'] . '/oc_src';
		}
		$upload = trim($this->sh('find ' . escapeshellarg($oc) . ' -maxdepth 3 -type d -name upload | head -1'));
		if (empty($upload)) {
			$this->fail("'upload' directory is not found in $oc");
		}
		$this->sh('cp -r ' . escapeshellarg($upload) . ' ' . escapeshellarg($this->store_dir));
		rename($this->store_dir . '/config-dist.php', $this->store_dir . '/config.php');
		rename($this->store_dir . '/admin/config-dist.php', $this->store_dir . '/admin/config.php');

		$this->db = new mysqli($this->opt['db_host'], $this->opt['db_user'], $this->opt['db_password']);
		$this->db->query("DROP DATABASE IF EXISTS `" . $this->opt['db'] . "`");
		$this->db->query("CREATE DATABASE `" . $this->opt['db'] . "`");
		$this->db->select_db($this->opt['db']);

		$out = $this->sh('php ' . escapeshellarg($this->store_dir . '/install/cli_install.php') . ' install'
			. ' --username admin --password Admin12345 --email admin@example.com'
			. ' --http_server ' . escapeshellarg($this->base_url)
			. ' --language en-gb --db_driver mysqli'
			. ' --db_hostname ' . escapeshellarg($this->opt['db_host'])
			. ' --db_username ' . escapeshellarg($this->opt['db_user'])
			. ' --db_password ' . escapeshellarg($this->opt['db_password'])
			. ' --db_database ' . escapeshellarg($this->opt['db'])
			. ' --db_port 3306 --db_prefix oc_'
		);
		if (strpos($out, 'SUCCESS') === false) {
			$this->fail("OpenCart installation failed:\n$out");
		}
		$this->sh('rm -rf ' . escapeshellarg($this->store_dir . '/install'));
		$this->log("OpenCart " . $this->getOcVersion() . " installed");

		$this->stopServer();
		exec('cd ' . escapeshellarg($this->store_dir) . " && nohup php -S localhost:$port -t . > ../server.log 2>&1 &");
		usleep(700000);

		$this->login();
	}

	protected function stopServer() {
		// the bracket keeps pkill from matching its own shell
		$port = (string)$this->opt['port'];
		exec("pkill -f 'php -S localhost:[" . $port[0] . "]" . substr($port, 1) . "'");
	}

	protected function getOcVersion() {
		$src = file_get_contents($this->store_dir . '/admin/index.php');
		if (preg_match("/define\('VERSION', '([^']+)'\)/", $src, $m)) {
			return $m[1];
		}
		return '?';
	}

	protected function login() {
		$this->token = '';
		@unlink($this->cookie_file);
		$resp = $this->http('common/login');
		if (!preg_match('/action="([^"]*login\.login[^"]*)"/', $resp['body'], $m)) {
			$this->fail('Login form is not found');
		}
		$resp = $this->httpUrl(html_entity_decode($m[1]), array('username' => 'admin', 'password' => 'Admin12345'));
		if (!preg_match('/user_token=([a-z0-9]+)/i', $resp['body'], $m)) {
			$this->fail('Cannot log in: ' . $resp['body']);
		}
		$this->token = $m[1];
	}

	protected function getInstallId() {
		return $this->value("SELECT extension_install_id FROM oc_extension_install WHERE code = 'ka_extensions' ORDER BY extension_install_id DESC LIMIT 1");
	}

	/*
		Follows the 'next' chain of installer json responses. Returns the error or an empty string.
	*/
	protected function runInstaller($route) {
		$url = $this->base_url . 'admin/index.php?route=' . $route . '&user_token=' . $this->token . '&extension_install_id=' . $this->getInstallId();
		while (!empty($url)) {
			$resp = $this->httpUrl($url);
			$json = json_decode($resp['body'], true);
			if (!is_array($json)) {
				return 'wrong response: ' . substr(strip_tags($resp['body']), 0, 1000);
			}
			if (!empty($json['error'])) {
				return is_array($json['error']) ? json_encode($json['error']) : $json['error'];
			}
			$url = isset($json['next']) ? html_entity_decode($json['next']) : '';
		}
		return '';
	}

	/*
		The modification page patches system/framework.php and kamod builds its cache on the next request.
		With opcache (revalidate_freq=2 by default) the old framework.php may still run for a moment, so
		the page is reloaded a few times like readme.ka_extensions.txt suggests.
	*/
	protected function getMenuHtml($expected = true) {
		for ($i = 0; $i < 5; $i++) {
			$resp = $this->http('common/dashboard');
			if ($this->hasMenuItem($resp['body']) == $expected) {
				break;
			}
			sleep(1);
		}
		if ($i) {
			$this->log("  (dashboard loaded " . ($i + 1) . " times)");
		}
		return $resp;
	}

	protected function hasMenuItem($body) {
		return strpos($body, 'route=extension/ka_extensions/extensions') !== false;
	}

	/////////////////////// tests ///////////////////////

	protected function testPackage() {
		$zip = new ZipArchive();
		$this->check($zip->open($this->opt['package']) === true, 'package is a valid zip');
		$names = array();
		for ($i = 0; $i < $zip->numFiles; $i++) {
			$names[] = $zip->getNameIndex($i);
		}
		$expected = array('install.json', 'ocmod/ka_extensions.ocmod.xml', 'engine/startup.php',
			'admin/controller/extensions.php', 'kamod/admin/controller/common/column_left.php', 'system/controller.php'
		);
		foreach ($expected as $file) {
			$this->check(in_array($file, $names), "package contains $file");
		}
		$this->check(!in_array('active.kamod', $names), 'package does not contain active.kamod');
		$this->check(empty(preg_grep('#^(upload|extension|tests|mod1|mod2)/#', $names)), 'package files are at the archive root, no mod1/mod2/tests');

		$json = json_decode($zip->getFromName('install.json'), true);
		$this->check(!empty($json['version']), 'install.json is valid, version ' . (isset($json['version']) ? $json['version'] : '?'));
		$this->check(@simplexml_load_string($zip->getFromName('ocmod/ka_extensions.ocmod.xml')) !== false, 'ocmod xml is valid');
	}

	protected function testInstall() {
		$resp = $this->http('marketplace/installer.upload', array('file' => new CURLFile($this->opt['package'], 'application/zip', 'ka_extensions.ocmod.zip')));
		$this->check(strpos($resp['body'], 'success') !== false, 'package is uploaded: ' . substr(strip_tags($resp['body']), 0, 300));
		$this->check(!empty($this->getInstallId()), 'package is registered in oc_extension_install');

		$error = $this->runInstaller('marketplace/installer.install');
		$this->check($error === '', 'package is installed' . ($error ? ": $error" : ''));
		$this->check(is_file($this->store_dir . '/extension/ka_extensions/engine/startup.php'), 'files are copied to extension/ka_extensions');
		$this->check($this->value("SELECT status FROM oc_extension_install WHERE code = 'ka_extensions'") == 1, 'extension_install status is 1');
		$errors = $this->getErrors();
		$this->check(empty($errors), 'no errors in log after install' . ($errors ? ': ' . implode(' | ', $errors) : ''));
	}

	protected function testModification() {
		$id = $this->value("SELECT modification_id FROM oc_modification WHERE code = 'ka_extensions'");
		if (!$this->check(!empty($id), 'Ka Extensions Ocmod is registered in oc_modification')) {
			return;
		}
		$this->checkNoErrors($this->http('marketplace/modification.enable', null, 'modification_id=' . $id), 'modification is enabled');
		$this->check($this->value("SELECT status FROM oc_modification WHERE modification_id = '$id'") == 1, 'modification status is 1');

		$resp = $this->http('marketplace/modification.refresh');
		$json = json_decode($resp['body'], true);
		$this->check(is_array($json) && empty($json['error']), 'modification refresh: ' . substr(strip_tags($resp['body']), 0, 300));

		$cache = $this->store_dir . '/extension/ocmod/system/framework.php';
		$this->check(is_file($cache) && strpos(file_get_contents($cache), 'ka_extensions/engine/startup.php') !== false, 'framework.php is patched in the modification cache');

		$log = $this->store_dir . '/system/storage/logs/ocmod.log';
		$text = is_file($log) ? file_get_contents($log) : '';
		// operations marked error="skip" are logged as "NOT FOUND - OPERATION SKIPPED!" and are allowed
		$failed = preg_match('/NOT FOUND(?! - OPERATION SKIPPED)/', $text);
		$this->check(!$failed, 'all required ocmod operations are applied' . ($failed ? ":\n" . $text : ''));

		// readme: reload the Modification page two times
		$this->checkNoErrors($this->http('marketplace/modification'), 'modification page, 1st load');
		$this->checkNoErrors($this->http('marketplace/modification'), 'modification page, 2nd load');
	}

	protected function testMenu() {
		$resp = $this->getMenuHtml();
		$this->checkNoErrors($resp, 'admin dashboard');
		$this->check($this->hasMenuItem($resp['body']), "'Ka Extensions' item is in the Extensions menu");

		$resp = $this->http('extension/ka_extensions/extensions');
		$this->checkNoErrors($resp, 'Ka Extensions page');
		$this->check(strpos($resp['body'], '<h1>Ka Extensions') !== false, 'Ka Extensions page has the title');

		$resp = $this->http('marketplace/extension', null, 'type=module');
		$this->checkNoErrors($resp, 'Extensions > Modules page');
	}

	protected function testStorefront() {
		$this->checkNoErrors($this->httpUrl($this->base_url . 'index.php'), 'storefront home');
		$this->checkNoErrors($this->httpUrl($this->base_url . 'index.php?route=product/category&path=20'), 'storefront category');
	}

	protected function testUninstall() {
		$id = $this->value("SELECT modification_id FROM oc_modification WHERE code = 'ka_extensions'");
		if ($id) {
			$this->http('marketplace/modification.disable', null, 'modification_id=' . $id);
		}
		$error = $this->runInstaller('marketplace/installer.uninstall');
		$this->check($error === '', 'package is uninstalled' . ($error ? ": $error" : ''));
		$this->check(!is_dir($this->store_dir . '/extension/ka_extensions/engine'), 'extension files are removed');
		$this->check($this->value("SELECT COUNT(*) FROM oc_modification WHERE code = 'ka_extensions'") == 0, 'modification is removed');
		$this->http('marketplace/modification.refresh');

		$resp = $this->getMenuHtml(false);
		$this->checkNoErrors($resp, 'admin dashboard after uninstall');
		$this->check(!$this->hasMenuItem($resp['body']), "'Ka Extensions' menu item is gone");
		$this->checkNoErrors($this->httpUrl($this->base_url . 'index.php'), 'storefront home after uninstall');
	}

	public function run() {
		$this->testPackage();
		$this->setup();
		$tests = array('testInstall', 'testModification', 'testMenu', 'testStorefront', 'testUninstall');
		if (isset($this->opt['keep'])) {
			array_pop($tests);
		}
		foreach ($tests as $test) {
			$this->log($test);
			$this->$test();
		}
		if (!isset($this->opt['keep'])) {
			$this->stopServer();
		}
		$this->log(sprintf("\nOpenCart %s: %d passed, %d failed", $this->getOcVersion(), $this->passed, $this->failures));
		return $this->failures ? 1 : 0;
	}
}

$opt = getopt('', array('oc:', 'work-dir:', 'port:', 'db:', 'keep'));
if (empty($opt['oc'])) {
	fwrite(STDERR, "Usage: php tests/run.php --oc=<opencart zip or dir> [--port=8096] [--work-dir=...] [--db=...]\n");
	exit(1);
}
$opt += array('port' => '8096');
$opt += array(
	'work-dir'    => sys_get_temp_dir() . '/ka_ext_test_' . $opt['port'],
	'db'          => 'kat_ext_' . $opt['port'],
	'db_host'     => getenv('KA_TEST_DB_HOST') ?: 'localhost',
	'db_user'     => getenv('KA_TEST_DB_USER') ?: 'root',
	'db_password' => getenv('KA_TEST_DB_PASSWORD') ?: '',
);

$opt['package'] = $opt['work-dir'] . '_ka_extensions.ocmod.zip';
passthru('php ' . escapeshellarg(__DIR__ . '/build-package.php') . ' ' . escapeshellarg($opt['package']), $ret);
if ($ret) {
	exit(1);
}

$test = new KaExtTest($opt);
exit($test->run());
