<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/

namespace Opencart\System\Extension\KaExtensions\Library;

use KaGlobal;

/**
	Kamod override of the OpenCart mail library. Adds named attachments and logging.

	@internal
*/
class Mail extends \Opencart\System\Library\Mail {

	public function addNamedAttachment($filename, $name) {
		$this->option['attachments'][$name] = $filename;
	}

	public function addAttachment(string $filename): void {
		$this->addNamedAttachment($filename, basename($filename));
	}
	
	
	protected function logMessage($msg, $type = 'I') {
		static $log = null;
	
		if (is_null($log)) {
			$log = new \Opencart\System\Library\Log('ka_mail_log.log');
		}
		
		$log->write($msg);
		
		if ($type == 'E') {
			KaGlobal::getRegistry()->get('log')->write($msg);
		}		
	}
	
	
	public function send(): bool {

		$log_emails = defined('KA_EXTENSIONS_LOG_EMAILS') && !empty(KA_EXTENSIONS_LOG_EMAILS);
		
		if ($log_emails) {
			$msg = "Email is being sent from (" . $this->option['from'] . ") to (" . var_export($this->option['to'], true) . ") with subject '" . $this->option['subject'] . "'";
			$this->logMessage($msg);
		}
		
		$result = false;		
		try {
			$result = parent::send();
			
		} catch (\Exception $e) {

			$error = "Email submission failed with error: " . $e->getMessage();
		
			if ($log_emails) {
				$this->logMessage($error, 'E');
			}
		
			return $result;
		}

		if ($log_emails) {
			$this->logMessage('The email was sent successfully');
		}
		
		return $result;
	}
}