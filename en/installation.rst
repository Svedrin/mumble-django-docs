.. _en_installation:

Installation of Mumble-Django
=============================

Prerequisites
-------------

In order to install Mumble-Django, you will need the following software. The
Installation section will describe the setup in greater detail.

* Murmur :)
* A webserver that supports WSGI or FastCGI. The recommended option is Apache2
  with mod_wsgi, how to configure this is described on the `Webserver Setup`_ page.
* `Django (at least 1.1.0) <http://www.djangoproject.com/download/>`_
* `django-registration <http://bitbucket.org/ubernostrum/django-registration/wiki/Home>`_
* Python modules:

 * PIL: Python Imaging Library (for user textures)
 * simplejson (for the user manager)
 * If using DBus:

  * DBus and python-dbus
  * Currently, all your Murmur servers must be on the System Dbus in order to be reachable
    by this application (in my setup, Murmur doesn't run under the same user as the web
    server, so I can't use a session dbus).
  * Murmur and mumble-django need to run on the same machine as DBus does not support
    inter-machine connectivity.

 * If using ICE:

  * python-zeroc-ice
  * If you are using Ubuntu Hardy (8.04), you will likely experience issues with
    Ice as python-zeroc-ice is incompatible to Python 2.5 in Hardy. I have prepared
    fixed Packages in `my PPA on Launchpad <https://launchpad.net/~svedrin/+archive/misc>`_,
    please consider updating to these packages if you intend to use Ice on Hardy.
    If you want to know more, please see `issue 64 <http://bitbucket.org/Svedrin/mumble-django/issue/64/>`_.


Debian Squeeze/Sid, Ubuntu Lucid Lynx
-------------------------------------

* I am packaging Mumble-Django for Debian. To watch the status of the packages,
  check out `Debian's package tracker <http://packages.qa.debian.org/m/mumble-django.html>`_.
* If packages are available for the Debian version you are using, just type
  ``apt-get install mumble-django`` to install them.
* The packages have mumble-server as a dependency, so make sure the installation
  of that package doesn't break anything if you're using Murmur static.
* Ubuntu has included my Debian packages in Lucid Lynx, so if you are using this
  Ubuntu version, Apt will be able to install MD as well.

  .. warning::

    The packages included in Ubuntu have an error in their configuration
    file. This is because Ubuntu chose to ignore my update request and
    still ships with v1.1, which needs the slice version to be configured
    in *settings.py*, but failed to do so. The variable ``SLICE_VERSION``
    needs to be changed to ``(1, 2, 2)`` in */etc/mumble-django/settings.py*
    before Mumble-Django will work.

Debian Lenny
------------

* First of all, you need these packages: libapache2-mod-wsgi python-imaging python-simplejson

 * If you want to use DBus: python-dbus
 * If you want to use Ice: python-zeroc-ice

* Since v0.10, Mumble-Django requires Django 1.1 because the handling of
  the Admin URLs has changed. To install Django, simply run *easy_install django*.
* To install django-registration, run *easy_install django_registration*.
* Configure your Murmur to connect [[Connecting Murmur to DBus|to the System DBus]]
  or [[Connecting_Murmur_to_ICE|to ICE]], whichever you prefer.
* Extract the mumble-django archive to wherever you like. This should be the path
  that you want it to live in, for example ``/srv/mumble-django``.
* If you intend to use Ice, make sure the path to the Slice file configured in
  *pyweb/settings.py* (``SLICE`` variable) points to the correct Murmur.ice file
  for your Murmur installation.

  .. note::

    This step will not be necessary from Murmur 1.2.3 on, because in that version
    Murmur introduces a way to retrieve the correct slice directly from it. You can
    find out if your system supports this by running *python manage.py getslice*.

* Run *python manage.py syncdb* to create the database.

 * When asked if you would like to create an admin user, answer *yes*. You will
   need this user to log in to the admin system. (If you want to do this later on,
   run *python manage.py createsuperuser*.)
 * Mumble-Django will now try to find already existing server instances. If for
   some reason this does not work, you can safely skip it by not specifying a
   service string when prompted, and later repeat the process by running
   *python manage.py syncdb* again.

* Now, the basic setup is complete. You can test Mumble-Django by running
  *python manage.py runserver 0.0.0.0:8000* and pointing your web browser
  to *http:~//<your.address.example.com>:8000/*.
* You should run *python manage.py checkenv* now. This script will check
  your environment for a few common mistakes. If any of the tests fails,
  you should fix the error you get before you continue.
* In order to run Mumble-Django on a production webserver like Apache2,
  you can follow the [[Webserver Setup]] page.


Other distributions
-------------------

Of course, Mumble-Django does not only run on Debian, but on all distros that
can somehow handle the prerequisites. You just need to figure out how to install
the Webserver, PIL and SimpleJSON; the rest of the howto for Debian Lenny should
work for any other distro as well.


Running Mumble 1.1.x and 1.2.x simultaneously
---------------------------------------------

Beginning from 1.2.0, the Mumble project has started deprecating DBus and
migrating to ZeroC Ice. As Ice only supports connecting to Murmur servers
that have the same version, connecting to both 1.1.x and 1.2.x servers
requires you to use DBus for 1.1.x, and Ice for 1.2.x servers.

That way, you will still be able to administer both versions from the same
installation of Mumble-Django without losing any functionality.
