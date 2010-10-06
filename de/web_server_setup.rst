.. _de_web_server_setup:

Web-Server-Konfiguration
========================

Um Django auf einem Webserver wie Apache2 laufen zu lassen, müssen einige Dinge
konfiguriert werden. Ich empfehle Apache2 mit mod_wsgi, da dies nicht mit
anderen Scriptsprachen interferiert und man sich nicht um Serverprozesse kümmern
muss wie bei FastCGI.

Wenn du Lighttpd benutzen willst, solltest du dir die Lighttpd-Sektion am Ende
dieser Seite ansehen.

.. note::
   Bevor du anfängst, prüfe bitte ob das Verzeichnis *db* (in dem die Datenbankdatei
   *mumble-django.db3* liegt) für den Benutzer des Webservers schreibbar ist! Das
   bedeutet im Normalfall dass du den Besitzer der Datei auf ``www-data`` oder
   ``httpd`` setzen musst.

   Es ist wichtig dass das *Verzeichnis* schreibbar sein muss, Apache muss darin
   für sqlite eine weitere Datei zusätzlich zur Datenbank anlegen dürfen.

Apache2
=======

Für WSGI muss zuerst mod_wsgi installiert werden (Debian: apt-get install
libapache2-mod-wsgi) und eine VHost-Konfiguration erstellt werden, die das
WSGI-Script einbindet welches bei Mumble-Django beiliegt.

Das WSGI-Script
---------------

Das WSGI-Script ist ein einfaches Python-Script, welches bei Mumble-Django als
mumble-django.wsgi beiliegt. Normalerweise brauchst du hier gar nichts ändern,
weil es alle Pfade die es braucht automatisch erkennt.

Die Apache-VirtualHost-Config
-----------------------------

Es gibt zwei Möglichkeiten, Mumble-Django in Apache zu integrieren. Du kannst
entweder einen kompletten VirtualHost für Mumble-Django erstellen (z.b. als
Subdomain), oder du kannst es in einen bereits existierenden VirtualHost
integrieren. Die empfohlene Variante ist aber ein eigener VirtualHost.

Eigener VirtualHost
~~~~~~~~~~~~~~~~~~~

Ich benutze folgende Config auf meinem Server (diese Datei liegt Mumble-Django
auch bei unter `*etc/apache2/dedicated_vhost.conf* <http://bitbucket.org/Svedrin/mumble-django/src/tip/etc/apache2/dedicated_vhost.conf>`_)::

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

In Debian würde man diese Config in einer Datei unter
*/etc/apache2/sites-available* speichern, beispielsweise
*/etc/apache2/sites-available/mumble-django*.

Du wirst hier die meisten Pfade anpassen müssen. Der Alias "media" muss auf
das Verzeichnis zeigen in dem Django die Dateien für die Admin-Konsole
speichert. Der voreingestellte Pfad stimmt für Debian Sid, wenn du Django
über Apt installiert hast. Wenn du Django über *python setup.py install*
installiert hast, musst du einen der letzten beiden Pfade nehmen,
abhängig von der Python-Version.

Der Alias "/static/" muss auf Mumble-Djangos htdocs-Verzeichnis zeigen,
der WSGIScriptAlias muss auf das WSGI-Script zeigen.

.. hint:: Die Slashes am Ende der Pfade werden gebraucht!

Existierenden VHost mitbenutzen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wenn du Mumble-Django in einen existierenden VirtualHost integrieren
willst, musst du die obige Config mit der des anderen VHost zusammenführen.
Für ein Beispiel wie das aussieht sieh dir die Datei
`*etc/apache2/shared_vhost.conf* <http://bitbucket.org/Svedrin/mumble-django/src/tip/etc/apache2/shared_vhost.conf>`_
an, die mit Mumble-Django auch mitgeliefert wird.

.. hint::
   Vergiss nicht die Einstellung ``MUMBLE_DJANGO_URL`` in *pyweb/settings.py*
   anzupassen!

Die Apache-Konfiguration neu laden
----------------------------------

Nachdem du die Datei erstellt hast, füge sie der Server-Konfiguration hinzu indem du
*`a2ensite <http://manpages.ubuntu.com/manpages/jaunty/man8/a2ensite.8.html>`_ mumble-django*
ausführst, und lade die Serverkonfiguration neu per */etc/init.d/apache2 reload*.
Dann kannst du Mumble-Django erreichen, indem du *example.com* oder
*www.example.com* ansurfst.

lighttpd
========

Um Mumble-Django mit Lighttpd zu benutzen, musst du FastCGI aufsetzen und deinen
Lighty so konfigurieren dass er darauf verbinden kann. Eine Beispiel-Config für
Lighty mit einigen Erklärungen wie das geht liegt bei Mumble-Django bei, unter
`*etc/lighttpd/lighttpd.conf* <http://bitbucket.org/Svedrin/mumble-django/src/tip/etc/lighttpd/lighttpd.conf>`_.

Fehlerbehebung
==============

Unable to open Database file
----------------------------

Dieser Fehler bedeutet dass Apache nicht die Zugriffsrechte hat die er benötigt
um die Datenbankdatei öffnen zu können. Dieses Problem liegt allerdings nicht
an der Datei selbst, sondern die Berechtigungen des *Verzeichnisses* in dem du
Mumble-Django installiert hat sind falsch und müssen korrigiert werden. Dazu
musst du normalerweise den Besitzer des Verzeichnisses auf ``www-data`` setzen,
oder *chmod a+rx* setzen.

Trying to write to readonly database
------------------------------------

Das bedeutet dass Apache die Datenbankdatei zwar zum Lesen öffnen konnte, aber
nicht zum schreiben. Wie beim Verzeichnis auch kannst du das normalerweise beheben
indem du den Besitzer der Datei *mumble-django.db3* auf ``www-data`` setzt, oder
*chmod a+w* setzt. Letzteres ist allerdings eine ernste Sicherheitslücke, daher
ist der empfohlene Weg den Besitzer richtig zu setzen.

401 Invalid Request
-------------------

Wenn du im Browser einen Fehler ähnlich wie "Your Browser sent a request this
server could not understand" bekommst, sieh bitte nach ob dein Webserver das Modul
*mod_reqtimeout* geladen hat und deaktiviere es gegebenenfalls, weil es gelegentlich
dieses Problem verursacht. Auf Debian/Ubuntu-Systemen geht dies mit den Befehlen
``a2dismod reqtimeout`` und ``/etc/init.d/apache2 restart``.

Python Egg Cache
----------------

Manche Benutzer hatten Probleme mit dieser Konfiguration, weil der WSGI-Handler
nicht startete und im Logfile folgende Nachricht erschien::

    The following error occurred while trying to extract file(s) to the Python egg
    cache:

    [Errno 13] Permission denied: '/root/.python-eggs'

Um das zu beheben, reicht es den Egg-Cache von Python in ein anderes Verzeichnis
zu legen. Entferne dazu das Kommentar-Zeichen vor folgender Zeile in mumble-django.wsgi::

    os.environ['PYTHON_EGG_CACHE'] = '/tmp/pyeggs'

Damit legt Python seinen Egg-Cache in /tmp an. Lade nun die Server-Konfiguration
neu, und es sollte funktionieren.

Debian: mumble-server-web
-------------------------

Wenn du in Debian das Paket mumble-server-web installiert hast, wird die Hauptseite
von Mumble-Django nicht erscheinen, weil mumble-server-web einen Alias namens
"/mumble" in die Apache-Konfiguration einfügt und damit eine URL von
Mumble-Django überschreibt. Um das aufzulösen deinstalliere einfach mumble-server-web,
Mumble-Django bietet sowieso alle Funktionen dieser Scripts.

mod_python
----------

mod_python macht manchmal Probleme, weil es in irgendeiner Weise verhindert dass
die Seite lädt. Wenn das der Fall ist kannst du entweder mod_python deinstallieren
(oder `anstelle von mod_wsgi benutzen <http://docs.djangoproject.com/en/dev/howto/deployment/modpython/>`_),
oder auf `FastCGI <http://docs.djangoproject.com/en/dev/howto/deployment/fastcgi/>`_
umsteigen.

Unable to connect to WSGI daemon process 'mumble-django'
--------------------------------------------------------

Dieses Problem tritt auf wenn der WSGI-Prozess sein Socket nicht erstellen kann,
weil er sich dann einfach beendet und Apache nicht verbinden kann.

Um das zu beheben, füge die folgende Zeile deiner Apache-Config im Server-Context
hinzu (also außerhalb einer ``<VirtualHost>``-Direktive)::

    WSGISocketPrefix /tmp/wsgi

