<?php
/*
	$Project: Ka Extensions $
	$Author: karapuz team <support@ka-station.com> $

	$Version: 4.1.1.0 $ ($Revision: 487 $)
*/
	
namespace Opencart\Extension\KaExtensions\System;

use exception\MailException;

class Mail {

	protected $config;
	protected $db;
	protected $request;
	protected $session;
	protected $log;
	protected $load;
	protected $registry;

	protected $language;
	
	public $mail;
	public $sender;
	public $data;
	public $images;
	public $store_config;

	/**
	 Prepares an email: loads the language, creates the OpenCart mail object and loads store information and settings.

	 $language_code — language id or code (e.g. 'en-gb'); store default if empty.
	 $store_id — store id.
	*/
	function __construct($language_code = null, $store_id = 0) {

		$this->registry = \KaGlobal::getRegistry();	
		$this->config   = $this->registry->get('config');
		$this->db       = $this->registry->get('db');
		$this->request  = $this->registry->get('request');
		$this->session  = $this->registry->get('session');
		$this->log      = $this->registry->get('log');
		$this->load     = $this->registry->get('load');
	
		// init language variable
		//
		if (empty($language_code)) {
			$language_code = $this->config->get('config_language');
		}
		if (!is_numeric($language_code)) { // this case for codes like 'en-gb'
			$language_code = Language::getLanguageIdByCode($language_code);
		}
		$this->language = Language::getLanguage($language_code);
		
		// init standard Opencart mail object
		//
		$mail_option = [
				'parameter'     => $this->config->get('config_mail_parameter'),
				'smtp_hostname' => $this->config->get('config_mail_smtp_hostname'),
				'smtp_username' => $this->config->get('config_mail_smtp_username'),
				'smtp_password' => html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8'),
				'smtp_port'     => $this->config->get('config_mail_smtp_port'),
				'smtp_timeout'  => $this->config->get('config_mail_smtp_timeout')
		];		
		
		if (empty($mail_engine)) {
			$this->mail = new \Opencart\System\Library\Mail();
		} else {
			$this->mail = new \Opencart\System\Library\Mail($mail_engine, $mail_option);
		}	
		
		// get store information
		//
		$store_info = Store::getStoreInfo($store_id);
		
		$this->data['store_name'] = $store_info['store_name'];
		$this->data['sender']     = $store_info['sender'];
		$this->data['store_url']  = $store_info['store_url'] . 'index.php?route=account/login';

		// get store config information
		//
		$this->store_config = Store::getStoreConfig($store_id);
	}


	/**
	 Renders the HTML and text templates and sends the email. Images are embedded or linked depending on the settings.

	 $from — sender email; store email if empty.
	 $to — recipient email.
	 $subject — subject or language key.
	 $tpl — template name without extension, e.g. extension/ka_extensions/product_warranty/mail/product_warranty_created.
	 $extra — options: 'send_content' wraps the content with common header and footer, 'reply_to' sets Reply-To.

	 @return bool True if sent, false if no template was found.
	*/
	public function send($from, $to, $subject, $tpl, $extra = array()) {

		if (empty($from)) {
			$from = $this->store_config->get('config_email');
		}

		if (empty($this->data['sender'])) {
			$sender = html_entity_decode($this->store_config->get('config_name'));
		} else {
			$sender = html_entity_decode($this->data['sender']);
		}

		// HTML Mail
		$this->data['subject'] = $this->language->get($subject);
		$logo = $this->store_config->get('config_logo');
		if (is_file(DIR_IMAGE . $logo)) {
			$this->images['logo'] = $logo;
		}
		
		$html = $text = '';

		// load a text file
		//
		$template = $tpl . '_txt';

		// the view substitutes the current template directory itself
		try {
			$text = $this->loadViewForLanguage($template, $this->data);
					
			if (!empty($extra['send_content'])) {
				$this->language->load('extension/ka_extensions/common/mail/common');
				$this->language->load('extension/ka_extensions/common/mail/common_txt');
				try {
					$this->data['header']  = $this->loadViewForLanguage('extension/ka_extensions/common/mail/header_txt', $this->data);
					$this->data['footer']  = $this->loadViewForLanguage('extension/ka_extensions/common/mail/footer_txt', $this->data);
					$this->data['content'] = $text;
					$text = $this->load->view('extension/ka_extensions/common/mail/content_txt', $this->data);
				} catch (MailException $e) {
					$this->log->write("WARNING: skipped txt content email for: $tpl. Reason: " . $e->getMessage());
				}
			}
		} catch (MailException $e) {
			$text = '';
		}
		
		if (!empty($this->images)) {
			foreach ($this->images as $ik => $iv) {
	      		if (!$this->config->get('ka_extensions_mail_images_are_enclosed')) {
					$this->data[$ik] = $this->data['_images'][$ik] = $this->store_config->get('config_url') . 'image/' . $iv;
	      		} else {
			      	if (!empty($iv) && file_exists(DIR_IMAGE . $iv)) {
			      		$filename = DIR_IMAGE . $iv;
			      		$this->data[$ik] = $this->data['_images'][$ik] = 'cid:' . urlencode(basename($filename));
						$this->mail->addAttachment($filename);
				  	}
				}
		  	}
		}
		
		// load an html file
		try {
			$html = $this->loadViewForLanguage($tpl, $this->data);
			if (!empty($extra['send_content'])) {
				$this->language->load('extension/ka_extensions/common/mail/common');
				
				$this->data['header']  = '';
				$this->data['footer']  = '';
				
				try {
					$this->data['header']  = $this->loadViewForLanguage('extension/ka_extensions/common/mail/header', $this->data);
					$this->data['footer']  = $this->loadViewForLanguage('extension/ka_extensions/common/mail/footer', $this->data);
					$this->data['content'] = $html;
					$html = $this->loadViewForLanguage('extension/ka_extensions/common/mail/content', $this->data);
				} catch (MailException $e) {
					$this->log->write("WARNING: skipped html content email for: $tpl. Reason: " . $e->getMessage());
				}
			}
		} catch (MailException $e) {
			if (empty($text)) {
				$this->log->write("WARNING: failed to load html: $tpl. Error: " . $e->getMessage());
			}
		}
		
		if (empty($html) && empty($text)) {
			$this->log->write("WARNING: email template was not found: $tpl");
			return false;
		}
		
		if (!empty($extra['reply_to'])) {
			$this->mail->setReplyTo($extra['reply_to']);
		}
		
		$this->mail->setTo($to);
		$this->mail->setFrom($from);
		$this->mail->setSender($sender);
		$this->mail->setSubject($subject);
		
		$this->mail->setText($text);
		$this->mail->setHtml($html);
		$this->mail->send();

		return true;
	}
	
	/**
	 Adds a file attachment.

	 $filename — path to the file.
	 $name — attachment name; the file name if empty.
	*/
	public function addAttachment($filename, $name = '') {
		if (!empty($name)) {
			$this->mail->addNamedAttachment($filename, $name);
		} else {
			$this->mail->addAttachment($filename);
		}
	}
	
	/**
	 Sends an email wrapped with the common header and footer templates.

	 $to — recipient email.
	 $subject — subject or language key.
	 $tpl — template name without extension.
	 $from — sender email; store email if empty.
	 $extra — additional options, see send().

	 @return bool True if sent.
	*/
	public function sendContent($to, $subject, $tpl, $from = '', $extra = []) {
		$extra['send_content'] = 1;
		$result = $this->send($from, $to, $subject, $tpl, $extra);
		return $result;
	}

	/**
	 Renders a template for the mail language. First it tries the template with the '_<language code>' suffix (e.g. mail/order_de.twig), then the standard one (mail/order.twig).

	 $template — template name without extension.
	 $data — template variables.

	 @return string Rendered content. Throws MailException if the result is empty.
	*/
	public function loadViewForLanguage($template, $data) {

		$result = '';
	
		$tpl = $template . '_' . $this->language->get('code');

		// supress notices and warnings when the template is not found
		// $old_er = error_reporting();
		// error_reporting(E_ERROR);
		
		// a 3rd party module 'template switcher' generates an error when the template file is not found
		// we disable it here to prevent this error
		$this->config->set('module_template_switcher_status', false);

		$org_language = $this->registry->get('language');
		$this->registry->set('language', $this->language);
		
		$result = $this->load->view($tpl, $data);
		if (empty($result)) {
			$result = $this->load->view($template, $data);
		}
		
		$this->registry->set('language', $org_language);		
		
		// restore the error reporting level
		// error_reporting($old_er);

		if (empty($result)) {
			throw new MailException("Empty template '$template'");
		}
		
		return $result;
	}
}