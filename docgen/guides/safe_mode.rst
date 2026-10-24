Safe Mode
=========

Safe mode is a way to open the admin area of the store without kamod. It can help when the admin area
does not work because of a kamod class or template of a module.

In safe mode kamod is not started in the admin area: OpenCart uses its original classes and templates,
the kamod cache is ignored. OCMOD modifications still work. The storefront is not affected.

Modules based on Ka Extensions and the *Ka Extensions* page may not work in safe mode. Use it only to fix
the store: for example, to disable or uninstall a module on the *Extensions > Installer* page.

How to Set the Safe Mode Code
-----------------------------

Safe mode is protected by a code. Without a code safe mode is disabled.

1. Open *Extensions > Ka Extensions* in the admin area.
2. Enter a code in the *Safe Mode Code* field of the *Safe Mode* block. Only latin letters and numbers
   are allowed. Use a code which is hard to guess.
3. Click *Save*. The page shows the safe mode URL with your code. Save the URL in a safe place.

The code is stored in the ``config/kamod.php`` file (``$_['safe_mode_code']``) and it is kept when the
kamod cache is rebuilt. Only users who can modify the *Ka Extensions* page (or user permissions) can
change the code.

When the admin area is broken and the *Ka Extensions* page does not open, edit ``config/kamod.php`` on
the server and add or change the line:

::

   $_['safe_mode_code'] = 'MyCode123';

How to Turn On Safe Mode
------------------------

Open the admin URL with the ``route=ka_safe_mode`` and ``code`` parameters. If your admin URL is

::

   https://www.mystore.com/admin/index.php

and the code is ``MyCode123``, open

::

   https://www.mystore.com/admin/index.php?route=ka_safe_mode&code=MyCode123

Ka Extensions checks the code, sets the ``ka_safe_mode_code`` cookie (HttpOnly, SameSite=Lax, for the
admin directory only) and redirects to the admin area. Safe mode is on for this browser only. Log in if
needed and open the page you need. A wrong code is ignored.

In safe mode the *Ka Extensions* page shows a notice that safe mode is on, with the links to the
dashboard and to turn off safe mode. Modules may check the ``IS_KAMOD_SAFE_MODE`` constant.

How to Turn Off Safe Mode
-------------------------

Any of these ways turns safe mode off:

- open ``https://www.mystore.com/admin/index.php?route=ka_safe_mode`` (without a code) or click
  *Exit safe mode* on the *Ka Extensions* page;
- change the code on the *Ka Extensions* page or in ``config/kamod.php``. The old code stops working at
  once in all browsers;
- clear the code. An empty code disables safe mode completely;
- delete the ``ka_safe_mode_code`` cookie of the store in the browser.
