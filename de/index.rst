.. _de_index:

Mumble-Django: Ein Web-Interface für Mumble
===========================================

.. seealso:: This documentation in English: :ref:`en_index`

.. seealso:: Programmierer sollten sich die :ref:`api_index` ansehen.

.. seealso:: Diese Dokumentation gibts auch `im PDF-Format. <http://docs.mumble-django.org/Mumble-Django.pdf>`_

.. seealso:: `Auf YouTube gibts eine Videoanleitung für die Installation. <http://www.youtube.com/watch?v=vC2Cm09LP4k&hd=1>`_

Murmur-Konfiguration, Registrierung und mehr
--------------------------------------------

Mumble ist ein hochqualitatives Sprach- und Chatprogramm
mit geringer Latenz. Es unterstützt Rauschunterdrückung, automatische 
Verstärkungsregelung und Audioübertragung in mehreren Audio-Standards.
Als einziges VoIP-Produkt seiner Art steht Mumble unter einer freien Lizenz.

Das Mumble-Projekt konzentriert sich jedoch auf die Entwicklung von Mumble selbst
und bietet daher keine Web-Administrations-Lösung an. Mumble-Django ist eine
solche Lösung, die auf Python und Django basiert, und ihrerseits unter einer
freien Lizenz steht.

Im Vergleich mit anderen existierenden Webinterfaces überzeugt Mumble-Django
durch seine strikte Einhaltung der Schnittstellen von Mumble und seinen
vollständigen Funktionsumfang. Als Django-Projekt bietet es weiterhin ein
hohes Potenzial für Erweiterungen und kann einfach in andere Django-Projekte
integriert werden.


.. toctree::
   :maxdepth: 1

   features
   installation
   web_server_setup

Download, Quellcode
-------------------

Du findest Zip- und GZ-Pakete für alle Versionen
`auf der Download-Seite <http://bitbucket.org/Svedrin/mumble-django/downloads>`_.
Da Mumble-Django in Python geschrieben ist, sind Binär- und Quellcodepakete identisch.

Die neueste Entwicklerversion ist immer im *tip*-Paket zu finden.

Demo-Installation
-----------------

Eine Demo von Mumble-Django findest du hier: http://demo.mumble-django.org/mumble-django/

Diese Installation basiert auf Debian Testing.


Voraussetzungen und Installation
--------------------------------

Dies wird auf der Seite :ref:`de_installation` näher beschrieben.


Bekannte Probleme
-----------------

Eine Liste bekannter Probleme gibt's im Bugtracker, auf der Seite
`Issues <http://bitbucket.org/Svedrin/mumble-django/issues/>`_. Falls du einen
Bug findest oder ein Feature vorschlagen möchtest, ist das der richtige Ort.
Bitte scheue dich nicht, dort ein Ticket zu eröffnen!

Kontakt
-------

Für Hilfe (oder alles andere) kannst du mich gern im IRC (Svedrin in #mumble in
Freenode) oder über Jabber (ich@svedr.in) ansprechen.

Du möchtest mir vielleicht `auf Twitter folgen <http://twitter.com/just_svedrin>`_;
ich nutze immer den Hashtag `#mumbledjango <http://twitter.com/#search?q=%23mumbledjango>`_
für Tweets die das Projekt betreffen. Auf diese Weise kannst du sehr einfach
über Neuigkeiten informiert werden.

Weitere Dokumentation
---------------------

SourceArchive.com generiert eine API-Doku mittels DoxyGen, diese findest du unter
http://mumble-django.sourcearchive.com/versions/main.html.

Helfen
------

Es gibt verschiedene Möglichkeiten wie du bei der Entwicklung von Mumble-Django helfen kannst:

* Schreibe oder überarbeite eine Übersetzung.
* Teste neue Versionen bevor sie veröffentlicht werden.
* `Sende Fehlerberichte <http://bitbucket.org/Svedrin/mumble-django/issues/>`_ wenn du einen Fehler findest.
* Wenn dir eine Funktionalität fehlt und du sie programmieren kannst,
  `sende einen Patch <http://bitbucket.org/Svedrin/mumble-django/issues/>`_.
* Hilf mit die Dokumentation im Wiki aktuell zu halten.
* Wenn du über längere Zeit an MD mitarbeiten willst, sprich einfach Svedrin in
  Freenode an. Hilfe ist immer willkommen. :)
* Du kannst auch `etwas spenden <https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=PK48YSHAUKWFG>`_

Lizenz
------

Mumble-Django ist Freie Software unter der GPL Version 2 oder neuer.
