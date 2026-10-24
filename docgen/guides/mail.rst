Sending Emails
==============

``\Opencart\Extension\KaExtensions\System\Mail`` sends emails rendered from twig templates with the
store information (name, email, logo, URL) in the language of the recipient. The email is sent with
the mail engine and the SMTP settings of the store (*System > Settings > Mail*). When the mail engine
is not set, the PHP ``mail()`` function is used.

Basic Usage
-----------

.. code-block:: php

    use \Opencart\Extension\KaExtensions\System\Mail;

    $mail = new Mail($language_id, $store_id);

    $mail->data['order_id'] = $order_id;

    $mail->send('', $email, 'Order is shipped', 'extension/my_module/mail/order_shipped');

Constructor parameters:

- ``$language_id`` - id or code (``'en-gb'``) of the language the email is rendered in. The store
  language is used when it is empty;
- ``$store_id`` - store whose name, email, logo and URL are used (default ``0``).

``send($from, $to, $subject, $tpl, $extra = [])``:

- ``$from`` - sender email, the store email when empty;
- ``$to`` - recipient email;
- ``$subject`` - subject of the email, translated if it is a key of the mail language. It is also
  passed to the templates as ``subject``;
- ``$tpl`` - template route without the extension, like in ``$this->load->view()``.
  ``<tpl>.twig`` is the HTML part, ``<tpl>_txt.twig`` is the text part. For
  ``extension/my_module/mail/order_shipped`` called in the storefront these are
  ``extension/my_module/catalog/view/template/mail/order_shipped.twig`` and ``order_shipped_txt.twig``.
  One of the templates may be missing: without the text template the text part is made from the HTML,
  when both are missing the email is not sent and ``send()`` returns ``false``;
- ``$extra`` - options: ``reply_to`` sets the *Reply-To* header.

Data available in templates: ``store_name``, ``sender``, ``store_url`` (the customer login page of
the store), ``subject``, ``logo`` (URL of the store logo) and everything added to ``$mail->data``.
Pass the texts of your module in ``$mail->data``: the language object of the email has only the
``default`` language file and the common texts of Ka Extensions.

Common Header and Footer
------------------------

``sendContent($to, $subject, $tpl, $from = '', $extra = [])`` works like ``send()``, but puts the
rendered templates into the common email layout of Ka Extensions: the store logo, name and URL in
the header and a signature in the footer. The layout templates are
``extension/ka_extensions/catalog/view/template/common/mail/`` (``header``, ``footer``, ``content`` and
their ``_txt`` versions), the texts are in
``extension/ka_extensions/catalog/language/<code>/common/mail/common.php`` and ``common_txt.php``.
They are used in the admin area too.

``styles.twig`` in the same directory has macros with inline styles for email clients that ignore
``<style>``:

.. code-block:: twig

    {% import 'extension/ka_extensions/catalog/view/template/common/mail/styles.twig' as css %}
    <table style="{{ css.table() }}">

Templates per Language
----------------------

A template with the suffix of the language is used first if it exists, otherwise the template without
suffix. The suffix is the ``code`` value of the ``default.php`` language file (``en`` for English,
``de`` for German), e.g. ``order_shipped_de.twig`` and ``order_shipped.twig``.

Attachments
-----------

.. code-block:: php

    $mail->addAttachment(DIR_DOWNLOAD . $filename, 'invoice.pdf');

The second parameter is the file name shown in the email (optional). Ka Extensions adds named attachments
to the standard OpenCart mail class too: ``$mail->mail->addNamedAttachment($filename, $name)``.

Logging
-------

When the ``KA_EXTENSIONS_LOG_EMAILS`` constant is defined (see :doc:`useful_constants`), every email sent
through OpenCart, not only through this class, is written to ``ka_mail_log.log`` in the logs directory
with the result: success or the error message.

Without this constant, errors of sending are suppressed, so a broken mail server does not break the page.

