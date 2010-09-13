.. _de_installation:

Installation von Mumble-Django
==============================

Voraussetzungen
---------------

Damit Mumble-Django funktioniert wirst du die folgende Software brauchen. Wie
man die einzelnen Pakete aufsetzt wird im Abschnitt Installation näher
beschrieben.

* Murmur :)
* Ein Webserver mit Unterstützung für WSGI oder FastCGI. Empfohlen wird Apache2
  mit mod_wsgi, wie man das konfiguriert steht auf der Seite :ref:`de_web_server_setup`.
* `Python (mindestens Version 2.5) <http://www.python.org>`_
* `Django (mindestens Version 1.2.0) <http://www.djangoproject.com/download/>`_
* `django-registration <http://bitbucket.org/ubernostrum/django-registration/wiki/Home>`_
* Python-Module:

 * PIL: Python Imaging Library (benötigt für Benutzertexturen)
 * simplejson (benötigt für die Benutzerverwaltung)
 * Wenn du DBus benutzt:

  * DBus and python-dbus
  * alle Murmur-Installationen müssen über den System-Bus erreichbar sein.
  * Murmur und mumble-django müssen auf demselben Rechner laufen, da DBus
    keine Verbindungen über ein Netzwerk unterstützt.

 * Wenn du Ice benutzt:

  * python-zeroc-ice
  * Wenn du Ubuntu Hardy (8.04) benutzt wirst du wahrscheinlich auf Probleme
    mit Ice stoßen, weil das python-zeroc-ice-Paket aus Hardy mit Python 2.5
    nicht kompatibel ist. Ich habe kompatible Pakete in
    `meinem PPA auf Launchpad <https://launchpad.net/~svedrin/+archive/misc>`_
    bereitgestellt, bitte überlege auf diese Pakete zu aktualisieren wenn du
    Ice benutzen willst. Wenn du mehr wissen willst, sieh dir bitte den Thread
    zu `issue 64 <http://bitbucket.org/Svedrin/mumble-django/issue/64/>`_ an.

Debian Squeeze/Sid, Ubuntu Lucid Lynx
-------------------------------------

* Ich paketiere Mumble-Django für Debian. Den Status der Pakete kannst du auf
  `Debians Paket-Tracker <http://packages.qa.debian.org/m/mumble-django.html>`_
  verfolgen.
* Wenn es für deine Debian-Version Pakete gibt, kannst du sie einfach per
  *apt-get install mumble-django* installieren.
* Die Pakete haben mumble-server als Abhängigkeit, wenn du vorhast Murmur Static
  zu verwenden kann das Probleme machen.
* Ubuntu hat meine Debian-Pakete in Lucid Lynx hinzugefügt, wenn du diese
  Ubuntu-Version benutzt kannst du also auch Apt benutzen.

  .. warning::

    Die Pakete die Ubuntu ausliefert haben einen Fehler in der Konfigurationsdatei.
    Dies liegt daran dass Ubuntu meine Update-Anfrage ignoriert hat und Mumble-Django
    v1.1 ausliefert, bei welchem die Slice-Version in *settings.py* festgelegt werden
    muss, aber dies nicht getan hat. Die Variable ``SLICE_VERSION`` muss auf
    ``(1, 2, 2)`` geändert werden damit Mumble-Django funktioniert.

Debian Lenny
------------

* Zuerst einmal musst du überlegen ob du DBus oder Ice benutzen willst.
  Normalerweise solltest du dich für Ice entscheiden.
* Du benötigst folgende Pakete: libapache2-mod-wsgi python-imaging python-simplejson

 * Wenn du DBus benutzen willst: python-dbus
 * Wenn du Ice benutzen willst: python-zeroc-ice

* Seit v0.10 benötigt Mumble-Django mindestens Django 1.1, weil sich das
  URL-System verändert hat. Um Django zu installieren, führe den Befehl
  *easy_install django* aus.
* Die Installation von django-registration läuft ähnlich, der Befehl dazu
  lautet *easy_install django-registration*.
* Murmur muss über DBus oder Ice erreichbar sein. Wenn du dazu weiter Infos
  brauchst, siehe:

 * :ref:`en_connecting_dbus`
 * :ref:`en_connecting_ice`

* Entpacke Mumble-Django, wohin ist egal. Das sollte der Pfad sein in dem
  du es später installiert haben willst, z.b. */srv/mumble-django*.
* Falls du Ice benutzen willst, sieh in *pyweb/settings.py* nach ob der
  dort eingetragene Pfad zur Slice-Datei (``SLICE``) korrekt ist und zur
  Datei Murmur.ice in deiner Murmur-Installation zeigt.

  .. note::

    Dieser Schritt wird ab Murmur 1.2.3 aufwärts nicht mehr nötig sein, weil Murmur
    in dieser Version eine Methode einführt mit der Mumble-Django das Slice direkt
    von Murmur holen kann. Du kannst rausfinden ob dein System diese Methode
    unterstützt, indem du den Befehl *python manage.py getslice* benutzt.

* Starte *python manage.py syncdb* um die Datenbank zu erzeugen.

 * Du wirst irgendwann gefragt ob du einen Admin anlegen möchtest. Antworte hier
   *yes*, denn diesen Benutzer wirst du brauchen um dich an der Admin-Konsole
   anzumelden. (Falls du das später nochmal machen willst, kannst du den Befehl
   *python manage.py createsuperuser* benutzen.)
 * Mumble-Django wird dann versuchen, bereits existierende Server-Instanzen zu
   finden. Wenn das aus irgendeinem Grund nicht funktioniert kannst du das problemlos
   überspringen, und es später wiederholen indem du *python manage.py syncdb* erneut
   ausführst.

* Damit ist die Basisinstallation abgeschlossen. Du kannst Mumble-Django jetzt testen,
  indem du *python manage.py runserver 0.0.0.0:8000* ausführst und im Browser die
  Adresse *http://<dein-server.example.com>:8000/* aufrufst.
* Du solltest jetzt *python manage.py checkenv* ausführen. Dieses Script prüft
  dein Setup und findet einige Fehler, die häufig gemacht werden. Wenn einer
  der Tests fehlschlägt solltest du den Fehler erst beheben, bevor du weiter
  machst.
* Wenn du Mumble-Django auf einem Webserver wie Apache2 laufen lassen willst,
  sieh dir die Seite :ref:`de_web_server_setup` an. Dort gibt es
  weitere Informationen, wie man Apache mit WSGI konfiguriert.


Andere Distributionen
---------------------

Mumble-Django funktioniert natürlich nicht nur auf Debian, sondern auf allen
Distributionen die irgendwie die Voraussetzungen erfüllen. Du musst nur rausfinden
wie auf deiner Distro die Pakete heißen die ich unter Lenny per Apt installiere,
der Rest des Howtos für Lenny sollte auch auf allen anderen Distros funktionieren.

Murmur 1.1.x und 1.2.x gleichzeitig verwalten
---------------------------------------------

Mit Version 1.2.0 hat das Mumble-Projekt aufgehört DBus zu unterstützen und
begonnen zu ZeroC Ice zu migrieren. Da Ice nur Verbindungen zu Murmur-Servern
unterstützt die dieselbe Version haben, musst du um gleichzeitig 1.1.x-Server
und 1.2.x-Server verwalten zu können beide Methoden kombinieren. Konfiguriere
dazu den 1.1.x-Server über DBus, und den 1.2.x-Server über Ice.

Dadurch wird die Inkompatibilität umgangen ohne dass man auf Features verzichten
müsste, da bis Murmur 1.1.8 das DBus- und das Ice-Interface nahezu identisch sind.
