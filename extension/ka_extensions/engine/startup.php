<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)

	here we come from system/vendor.php. That file is loaded at the very beginning of opencart startup.
*/

namespace extension\ka_extensions;

// safe mode, disable all kamod features for the current admin session.
// It is turned on by the admin/index.php?route=ka_safe_mode&code=<code> URL where the code
// is defined on the 'Ka Extensions' page and stored in config/kamod.php.
// admin/index.php?route=ka_safe_mode without a code turns it off.
//
if (defined('APPLICATION') && APPLICATION == 'Admin') {

	$ka_safe_mode_code = '';
	$ka_safe_mode_url  = (!empty($_GET['route']) && $_GET['route'] == 'ka_safe_mode');
	if ($ka_safe_mode_url) {
		if (isset($_GET['code']) && is_string($_GET['code'])) {
			$ka_safe_mode_code = $_GET['code'];
		}
	} elseif (isset($_COOKIE['ka_safe_mode_code']) && is_string($_COOKIE['ka_safe_mode_code'])) {
		$ka_safe_mode_code = $_COOKIE['ka_safe_mode_code'];
	}

	if ($ka_safe_mode_code !== '' || $ka_safe_mode_url) {

		$ka_cookie_options = array(
			'path'     => rtrim(dirname($_SERVER['SCRIPT_NAME']), '/\\') . '/',
			'secure'   => (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off'),
			'httponly' => true,
			'samesite' => 'Lax',
		);

		$ka_config = (function() {
			$_ = array();
			if (is_file(DIR_CONFIG . 'kamod.php')) {
				include(DIR_CONFIG . 'kamod.php');
			}
			return $_;
		})();

		if ($ka_safe_mode_code !== '' && !empty($ka_config['safe_mode_code']) && is_string($ka_config['safe_mode_code'])
			&& hash_equals($ka_config['safe_mode_code'], $ka_safe_mode_code)
		) {
			/**
				@internal
			*/
			define('IS_KAMOD_SAFE_MODE', 1);

			if ($ka_safe_mode_url) {
				setcookie('ka_safe_mode_code', $ka_safe_mode_code, $ka_cookie_options);
				header('Location: index.php');
				exit;
			}

			// kamod pages do not work in safe mode, show a short notice instead of the 'Ka Extensions' page
			//
			if (!empty($_GET['route']) && is_string($_GET['route']) && strpos($_GET['route'], 'extension/ka_extensions/') === 0) {
				$ka_lang = 'en-gb';
				if (isset($_COOKIE['language']) && is_string($_COOKIE['language'])
					&& preg_match('/^[a-z]{2}-[a-z]{2}$/', $_COOKIE['language'])
					&& is_file(__DIR__ . '/../admin/language/' . $_COOKIE['language'] . '/extensions.php')
				) {
					$ka_lang = $_COOKIE['language'];
				}
				$_ = array();
				include(__DIR__ . '/../admin/language/en-gb/extensions.php');
				if ($ka_lang != 'en-gb') {
					include(__DIR__ . '/../admin/language/' . $ka_lang . '/extensions.php');
				}
				$ka_html = function($key) use ($_) {
					return htmlspecialchars(isset($_[$key]) ? $_[$key] : $key, ENT_QUOTES, 'UTF-8');
				};
				header('Content-Type: text/html; charset=utf-8');
				echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>' . $ka_html('txt_safe_mode') . '</title></head>'
					. '<body style="font-family: sans-serif; margin: 40px;"><h1>' . $ka_html('txt_safe_mode') . '</h1>'
					. '<p id="ka-safe-mode-active">' . $ka_html('txt_safe_mode_active') . '</p>'
					. '<p><a href="index.php">' . $ka_html('txt_safe_mode_dashboard') . '</a> | '
					. '<a href="index.php?route=ka_safe_mode">' . $ka_html('txt_safe_mode_exit') . '</a></p>'
					. '</body></html>';
				exit;
			}
			return;
		}

		// a wrong or outdated code
		if (isset($_COOKIE['ka_safe_mode_code'])) {
			setcookie('ka_safe_mode_code', '', array_merge($ka_cookie_options, array('expires' => time() - 3600)));
		}

		if ($ka_safe_mode_url) {
			header('Location: index.php');
			exit;
		}
	}
}

// if the extension was included twice for some reason
if (class_exists('KamodLockedException')) {
	return;
}

/**
	Thrown when the kamod cache is locked by another process.

	@internal
*/
class KamodLockedException extends \Exception {};
/**
	Thrown when the kamod cache cannot be built.

	@internal
*/
class KamodFailedException extends \Exception {};

// replace the original Opencart loader with our loader supporting kamod cache
//
try {

	include_once(__DIR__ . '/autoloader.php');
	$autoloader = new Autoloader($autoloader);

} catch (KamodLockedException $e) {

	if (defined('KAMOD_DEBUG')) {
		// it is ok to skip the locked cache in development
	} elseif (APPLICATION == 'Admin') {
		echo "Kamod cache is locked. The store is closed.";
	} else {
//		die('We are rebuilding the store cache. Please try again in several minutes.');
	}

} catch (KamodFailedException $e) {

	if (APPLICATION == 'Admin') {
		echo "Kamod malfunction: " . $e->getMessage();
	} else {
//		die('Sorry, the store is not operable at this moment.');
	}
	
} catch (\Throwable $e) {

	// record the failure event to a log file
	file_put_contents(DIR_LOGS . "kamod.log", date('Y-m-d G:i:s') . ": Ka Extensions autoloader failed (Error: " . $e->getMessage() . ")\n", FILE_APPEND);

	if (defined('KAMOD_DEBUG')) {
	
		die("KAMOD DEBUG: " . $e->getMessage());
		
	} elseif (APPLICATION == 'Admin') {	
		echo ("WARNING: The store is not operating properly. Something wrong. Kamod error: " . $e->getMessage());
	} else {
//		die('Sorry, the store is not operable at this moment.');
	}
}