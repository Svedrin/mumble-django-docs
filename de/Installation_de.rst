English Version: [[Installation]]

= Voraussetzungen =

Damit Mumble-Django funktioniert wirst du die folgende Software brauchen. Wie man die einzelnen Pakete aufsetzt wird im Abschnitt Installation näher beschrieben.

 * Murmur :)
 * Ein Webserver mit Unterstützung für WSGI oder FastCGI. Empfohlen wird Apache2 mit mod_wsgi, wie man das konfiguriert steht auf der Seite [[Webserver_Setup_de|Webserver Setup]].
 * [[http://www.djangoproject.com/download/|Django (mindestens 1.1.0)]]
 * [[http://bitbucket.org/ubernostrum/django-registration/wiki/Home|django-registration]]
 * Python-Module:
 ** PIL: Python Imaging Library (benötigt für Benutzertexturen)
 ** simplejson (benötigt für die Benutzerverwaltung)
 ** Wenn du DBus benutzt:
 *** DBus and python-dbus
 *** alle Murmur-Installationen müssen über den System-Bus erreichbar sein.
 *** Murmur und mumble-django müssen auf demselben Rechner laufen, da DBus keine Verbindungen über ein Netzwerk unterstützt.
 ** Wenn du Ice benutzt:
 *** python-zeroc-ice
 *** Wenn du Ubuntu Hardy (8.04) benutzt wirst du wahrscheinlich auf Probleme mit Ice stoßen, weil das python-zeroc-ice-Paket aus Hardy mit Python 2.5 nicht kompatibel ist. Ich habe kompatible Pakete in [[https://launchpad.net/~svedrin/+archive/misc|meinem PPA auf Launchpad]] bereitgestellt, bitte überlege auf diese Pakete zu aktualisieren wenn du Ice benutzen willst. Wenn du mehr wissen willst, sieh dir bitte den Thread zu <<issue 64>> an.

= Installation =

Wie genau das Setup abläuft hängt von deinem System und von der benutzten Mumble-Version ab.

== Debian Squeeze/Sid, Ubuntu Lucid Lynx ==

 * Ich paketiere Mumble-Django für Debian. Den Status der Pakete kannst du auf [[http://packages.qa.debian.org/m/mumble-django.html|Debians Paket-Tracker]] verfolgen.
 * Wenn es für deine Debian-Version Pakete gibt, kannst du sie einfach per //apt-get install mumble-django// installieren.
 * Die Pakete haben mumble-server als Abhängigkeit, wenn du vorhast Murmur Static zu verwenden kann das Probleme machen.
 * Ubuntu hat meine Debian-Pakete in Lucid Lynx hinzugefügt, wenn du diese Ubuntu-Version benutzt kannst du also auch Apt benutzen.
   **Achtung:** Die Pakete die Ubuntu ausliefert haben einen Fehler in der Konfigurationsdatei. Die Variable //SLICE_VERSION// muss auf
   //(1, 2, 2)// geändert werden bevor Mumble-Django funktioniert.


== Debian Lenny ==

 * Zuerst einmal benötigst du folgende Pakete: libapache2-mod-wsgi python-imaging python-simplejson
 ** Wenn du DBus benutzen willst: python-dbus
 ** Wenn du Ice benutzen willst: python-zeroc-ice
 * Seit v0.10 benötigt Mumble-Django mindestens Django 1.1, weil sich das URL-System verändert hat. Um Django zu installieren, [[http://www.djangoproject.com/download/|lade dir das Tar-Archiv von der Downloadseite]], entpacke es, und führe //python setup.py install// in dem entpackten Verzeichnis aus. Du kannst dann das Verzeichnis und das Archiv löschen.
 * Die Installation von django-registration läuft genauso. Lade es [[http://bitbucket.org/ubernostrum/django-registration/wiki/Home|von der Webseite]], und führe den Befehl //python setup.py install// in dem entpackten Verzeichnis aus.
 * Konfiguriere Murmur sodass er [[Connecting_Murmur_to_DBus|auf dem System-DBus]] oder [[Connecting_Murmur_to_ICE|über Ice]] erreichbar ist.
 * Entpacke Mumble-Django, wohin ist egal. Das sollte der Pfad sein in dem du es später installiert haben willst, z.b. //~/srv/mumble-django//.
 * Falls du Ice benutzen willst, sieh in //pyweb/settings.py// nach ob der dort eingetragene Pfad zur Slice-Datei (SLICE) korrekt ist und zur Datei Murmur.ini in deiner Murmur-Installation zeigt.
 * Starte //python manage.py syncdb// um die Datenbank zu erzeugen.
 ** Du wirst irgendwann gefragt ob du einen Admin anlegen möchtest. Antworte hier unbedingt //yes//. Diesen Benutzer wirst du brauchen um dich an der Admin-Konsole anzumelden!
 ** Mumble-Django wird dann versuchen, bereits existierende Server-Instanzen zu finden. Wenn das aus irgendeinem Grund nicht funktioniert kannst du das problemlos überspringen, und es später wiederholen indem du //python manage.py syncdb// erneut ausführst.
 ** Bitte prüfe ob der Apache-Prozess Schreibzugriff auf Datenbank-Datei "mumble-django.db3" hat! Normalerweise bedeutet das, dass du den Besitzer der Datei auf www-data oder httpd setzen musst.
 * Damit ist die Basisinstallation abgeschlossen. Du kannst Mumble-Django jetzt testen, indem du //python manage.py runserver 0.0.0.0:8000// ausführst und im Browser die Adresse //http:~//<dein-server.example.com>:8000~/// aufrufst.
 * Du solltest jetzt //python manage.py checkenv// ausführen. Dieses Script prüft dein Setup und findet einige Fehler, die häufig gemacht werden. Wenn einer der Tests fehlschlägt solltest du den Fehler erst beheben, bevor du weiter machst.
 * Wenn du Mumble-Django auf einem Webserver wie Apache2 laufen lassen willst, sieh dir die Seite [[Webserver_Setup_de|Webserver Setup]] an. Dort gibt es weitere Informationen, wie man Apache mit WSGI konfiguriert.


== Andere Distributionen ==

Mumble-Django funktioniert natürlich nicht nur auf Debian, sondern auf allen Distributionen die irgendwie die Voraussetzungen erfüllen. Du musst nur rausfinden wie auf deiner Distro die Pakete heißen die ich unter Lenny per Apt installiere, der Rest des Howtos für Lenny sollte auch auf allen anderen Distros funktionieren.


= Murmur 1.1.x und 1.2.x gleichzeitig verwalten =

Mit Version 1.2.0 hat das Mumble-Projekt aufgehört DBus zu unterstützen und begonnen zu ZeroC Ice zu migrieren. Da Ice nur Verbindungen zu Murmur-Servern unterstützt die dieselbe Version haben, musst du um gleichzeitig 1.1.x-Server und 1.2.x-Server verwalten zu können beide Methoden kombinieren. Konfiguriere dazu den 1.1.x-Server über DBus, und den 1.2.x-Server über Ice.

Dadurch wird die Inkompatibilität umgangen ohne dass man auf Features verzichten müsste, da bis Murmur 1.1.8 das DBus- und das Ice-Interface nahezu identisch sind.
