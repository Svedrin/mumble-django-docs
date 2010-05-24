Deutsche Version: [[Webserver_Setup_de]]


In order to run Django on a production webserver, you need to configure a few things. I have found using mod_wsgi with an Apache2 webserver to be most convenient, because it does not interfere with other scripting laguages (as mod_python does, as far as I know), and you do not need to handle server processes as you would when using FastCGI.

If you want to use Lighttpd, you should have a look at the lighttpd section at the end of this page.

To configure your apache2 server to use Django with WSGI, you need to install mod_wsgi (for Debian: apt-get install libapache2-mod-wsgi) and create an Apache2 VHost that uses the WSGI config shipped with Mumble-Django.

== The WSGI config ==

The WSGI config file is a simple python script, that is shipped as mumble-django.wsgi. Normally you do not need to change anything in it because it detects the needed paths automatically.

== The Apache VirtualHost config ==

There are two possible ways how to run Mumble-Django. You can either set up a dedicated VirtualHost for only Mumble-Django to run (e.g., a subdomain), or install it to share an existing VirtualHost. The recommended way is setting up a dedicated VirtualHost.

=== Dedicated VirtualHost ===

I am using the following config on my server (you can find this file shipped with Mumble-Django as //[[http://bitbucket.org/Svedrin/mumble-django/src/tip/etc/apache2/dedicated_vhost.conf|etc/apache2/dedicated_vhost.conf]]//):
{{{
#!xml
<VirtualHost *:80>
	ServerName		example.com
	ServerAlias		www.example.com
	
	Alias			/static/	/srv/mumble-django/htdocs/
	
	# for Debian squeeze(unstable)
	Alias			/media/		/usr/share/pyshared/django/contrib/admin/media/
	# if self-installed using setup.py
	#Alias			/media/		/usr/lib/python2.4/site-packages/django/contrib/admin/media/
	#Alias			/media/		/usr/lib/python2.5/site-packages/django/contrib/admin/media/
	
	WSGIScriptAlias		/		/srv/mumble-django/mumble-django.wsgi
	WSGIDaemonProcess	mumble-django threads=25
	WSGIProcessGroup	mumble-django
	WSGIScriptReloading	Off
</VirtualHost>
}}}

In Debian, you would put this in a file under //~/etc/apache2/sites-available//, e.g. //~/etc/apache2/sites-available/mumble-django//.

You will need to reconfigure most of these paths. The "media" alias needs to point at where django keeps its Admin media, the path I use is correct if you use the python-django package from Debian Sid. If you installed Django yourself using setup.py, it will reside somewhere in your site-packages directory, e.g. "/usr/lib/python2.4/site-packages/django/contrib/admin/media".

As you see, the /static/ alias needs to point to the htdocs directory from the archive, and the WSGIScriptAlias needs to point to the WSGI script.

**Important**: Note the trailing slashes at the paths in the Alias directives. These are required!

=== Shared VirtualHost ===

If you want Mumble-Django to share another VirtualHost, you will need to merge the configuration from above with the other VirtualHost. Have a look at the file //[[http://bitbucket.org/Svedrin/mumble-django/src/tip/etc/apache2/shared_vhost.conf|etc/apache2/shared_vhost.conf]]// that is shipped with Mumble-Django for an example how to do that.

**Important**: Don't forget to change the //MUMBLE_DJANGO_URL// setting in //pyweb/settings.py//!

== Reloading the server ==

When you created this config file, enable it by running //[[http://manpages.ubuntu.com/manpages/jaunty/man8/a2ensite.8.html|a2ensite]] mumble-django// and run //~/etc/init.d/apache2 reload// to enable the VHost. Then you can reach Mumble-Django by pointing your web browser to http:~//example.com or http:~//www.example.com.

== lighttpd ==

If you want to use Mumble-Django with lighttpd, you will have to set up FastCGI and configure your lighttpd to connect to it. An example config file which also explains how that can be done is shipped as //[[http://bitbucket.org/Svedrin/mumble-django/src/tip/etc/lighttpd/lighttpd.conf|etc/lighttpd/lighttpd.conf]]//

== Troubleshooting ==

=== Unable to open Database file ===

If you get that error, it means that Apache does not have sufficient access rights for the directory Mumble-Django has been installed in, and therefore can't open the database file. This is not an issue of the Database file itself, but you need to fix the permissions of the //directory// you installed MD in, usually by changing the owner to //www-data// or granting //chmod a+rx//.

=== Trying to write to readonly database ===

This message means that Apache has been able to open the database file for reading, but not for writing. As for the directory, this is usually fixed by changing the owner of //mumble-django.db3// to //www-data// or granting //chmod a+w//. The latter one is a serious security issue and therefore discouraged, the recommended way is setting the owner correctly.

=== Python Egg Cache ===

Some users experienced problems with this config, as the WSGI handler didn't load for them, and they got this error message in the logs:
{{{
The following error occurred while trying to extract file(s) to the Python egg
 cache:

   [Errno 13] Permission denied: '/root/.python-eggs'
}}}

To fix this, you need to point the egg cache directory somewhere else. To do that, uncommenting the following line in mumble-django.wsgi should suffice:
{{{
#!python
os.environ['PYTHON_EGG_CACHE'] = '/tmp/pyeggs'
}}}

This will tell Python to create its egg cache in /tmp, and it has full write access there. Now reload the web server, and everything should be fine.

=== Debian: mumble-server-web ===

On Debian, if you installed Mumble-Server-Web, you won't see the main Mumble-Django web interface that you expect. This is because Mumble-Server-Web includes an Alias named "/mumble" in the Apache2 configuration, which overrides the URL used by Mumble-Django.

To get rid of this, uninstall Mumble-Server-Web; Mumble-Django will be able to do everything these script provide anyway. :)

=== mod_python ===

Problems have been reported when using mod_wsgi while mod_python is loaded, because it prevents the page from loading. If that is the case, you can either remove mod_python from the server setup (or [[http://docs.djangoproject.com/en/dev/howto/deployment/modpython/|use it instead of mod_wsgi]]), or switch to [[http://docs.djangoproject.com/en/dev/howto/deployment/fastcgi/|FastCGI]].

=== Unable to connect to WSGI daemon process 'mumble-django' ===

This problem seems to occur when the WSGI daemon is unable to write its sockfile, because then it silently terminates and Apache can't connect.

To resolve this, add the following line to your Apache config in the Server config context (that is, outside any <VirtualHost> directive):
{{{
WSGISocketPrefix /tmp/wsgi
}}}
