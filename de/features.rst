Features
========

* Benutzt ausschließlich DBus/Ice um zum Server zu verbinden - in keinem Fall
  wird Mumble-Django versuchen, direkt auf Murmurs Datenbank zuzugreifen
* Kompatibel mit Murmur 1.1.8 und 1.2.0 -- Standardeinstellung ist 1.2.0
* Kann sowohl Murmur 1.1.8 als auch 1.2.0 mit einer einzigen Installation
  verwalten, wenn DBus für 1.1.8 und Ice für 1.2.0 benutzt wird
* Abwärtskompatibel zu Murmur 1.1.4
* Erstellt automatisch eine Channel-Liste für jeden konfigurierten Server

 * Jeder Channel ist verlinkt, mit einem Klick joinst du direkt in diesen Channel
 * Ein Klick auf einen Benutzernamen zeigt nähere Infos zu diesem Benutzer an
 * Wenn du im Webinterface eingeloggt bist, wird dein Benutzername in die Links übernommen
 * leere Subchannels werden ausgeblendet um die Liste übersichtlich zu halten (etwa so wie in Mumble selbst)

* Erkennt Handy-Browser und liefert diesen eine speziell zugeschnittene Version
  der Seite
* Unterstützt das `Channel-Viewer-Protocol <https://www.mumble.info/documentation/developer/channel-viewer-protocol/>`_
* Kann als Datenquelle für den
  `Channel-Viewer von Murmur-Manager <http://github.com/cheald/murmur-manager/tree/master/widget/>`_
  dienen
* Das mitgelieferte `Munin <http://munin.projects.linpro.no/>`_-Plugin zeichnet
  einen Graphen über die Anzahl der Benutzer auf jedem Server
  (`Demo <http://munin.funzt-halt.net/funzt-halt.net/glint.funzt-halt.net-mumble_django.html>`_)
* Verwaltet so viele Murmur-Installationen wie du willst, sie müssen nur über
  DBus oder Ice erreichbar sein
* Das [[Admin_Interface_de|Admin-Interface]] konfiguriert folgende Parameter:

 * Registrierungsname (der Name mit dem der Server im Browser auftaucht, auch
   der Name des Root-Channels)
 * Server-Adresse (kann sowohl eine IP-Adresse als auch ein Hostname sein)
 * Server-Port
 * URL der Webseite, die im Browser auftaucht
 * Willkommensnachricht
 * Server-Passwort
 * Superuser-Passwort
 * Anzahl Benutzer (Slots)
 * Bandbreite
 * SSL-Zertifikat and Key

* Die einzelnen Murmur-Instanzen können gestartet und gestoppt werden
* Benutzer-Registrierung

 * In Django registrierte Benutzer können sich auf den Murmur-Servern Accounts
   erstellen und mit +A joinen
 * Accounts können im Admin-Interface verwaltet werden
 * zur Sicherheit werden die Passwörter der Benutzer nicht gespeichert (das
   Feld existiert nur um mit Django-Models kompatibel zu sein)
 * Benutzer können im Admin-Interface zur //admin//-Gruppe hinzugefügt / aus
   ihr entfernt werden

* "manage.py syncdb" erkennt existierende Murmur-Instanzen und Benutzer und
  trägt diese in die DB ein
* Admin Interface für Mitglieder der *admin*-Gruppe
* Benutzerverwaltung für Serveradmins: erstellt/löscht Registrierungen, vergibt
  Adminrechte, ändert Benutzerpasswörter
* Benutzertexturen einstellen
* Connector-Module um einfach zwischen DBus und Ice umzuschalten
* Das Template ist eine einzige Datei: Wenn's dir nicht gefällt, ändere einfach
  die index.htm
* Vollständig kompatibel mit Djangos Datenbank-API: Die Kommunikation mit Murmur
  erfolgt komplett innerhalb der Models
* Alle Konfigurations-Optionen von Murmur werden unterstützt
* Erzeugt valides XHTML transitional (abgesehen von HTML in den Kanal-/Benutzer-
  Beschreibungen :) )
* Erweiterbar: Mumble-Django ist ein normales Django-Projekt und benutzt
  ausschließlich die Standard-Models von Django, du kannst es daher wie jede
  andere Django-App einbinden und es sogar zu einer kompletten Webseite erweitern.
