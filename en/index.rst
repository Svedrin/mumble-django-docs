Mumble-Django: A Mumble web interface
=====================================

Murmur configuration, user registration and more
------------------------------------------------

Mumble is a low-latency, high quality voice chat program for gaming. It
features noise suppression, automatic gain control and low latency audio
with support for multiple audio standards. Mumble includes an in-game
overlay compatible with most open-source and commercial 3D applications.

The Mumble project focuses its development of Mumble itself and does not
provide a web administration system. Mumble-Django is such a system, based
on Python and Django and licensed as Free Software under the GPL.

Unlike to other existing web interfaces, Mumble-Django strictly uses the
interfaces Mumble provides and fully supports all features Mumble has to
offer. As a Django project, extending it or using it in other Django projects
is very easy, so Mumble-Django is only at the beginning of its potential when
you initially install it.

Documentation contents
----------------------

.. toctree::
   :maxdepth: 1

   features
   installation
   connecting_murmur_to_dbus
   connecting_murmur_to_ice
   web_server_setup

Download, Source code
---------------------

You can find zip or gz packages for all versions
`on the Downloads page <http://bitbucket.org/Svedrin/mumble-django/downloads>`_.
As Mumble-Django is written in Python, there is no destinction between source
and binary packages.

The latest development version is always available in the *tip* package.

Demo installation
-----------------

The demo installation is running here: http://demo.mumble-django.org/mumble-django/

This installation is based on Debian Testing.


Prerequisites, Installation
---------------------------

Please see the :ref:`en_installation` page for more information about what's needed and how to install Mumble-Django.


Known Issues
------------

For a list of known bugs, please see the `Issues <http://bitbucket.org/Svedrin/mumble-django/issues/>`_ page. If you find a bug or would like to request a feature, this is also the place to go. Please feel free to open a ticket whenever you like!


Contact
-------

If you need help (or anything else), you can contact me via IRC (Svedrin in
#mumble on Freenode) or Jabber (ich@svedr.in).

You might want to `follow me on Twitter <http://twitter.com/just_svedrin>`_, and
I always use the `#mumbledjango <http://twitter.com/#search?q=%23mumbledjango>`_
hashtag for tweets concerning the project. This way, you can easily get the
latest news!


Further documentation
---------------------

SourceArchive.com seems to generate an API documentation using DoxyGen, which can be found under
http://mumble-django.sourcearchive.com/versions/main.html.


Get involved
------------

There are several ways you can help in the development of mumble-django:

* Write or maintain a Translation.
* Test new versions before they are released.
* `Submit bug reports <http://bitbucket.org/Svedrin/mumble-django/issues/>`_ if you find an error.
* If you miss a feature and you can add it, `submit a patch <http://bitbucket.org/Svedrin/mumble-django/issues/>`_.
* Help maintaining the documentation in the Wiki.
* If you want to join the team, just contact Svedrin on Freenode. Help is always welcome :)
* `make a donation <https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KJUEVMAGMAVWS>`_


License
-------

This app is licensed under the GPL v2 or later.
