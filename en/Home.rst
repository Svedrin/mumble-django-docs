= Mumble-Django: A Mumble web interface =
== Murmur configuration, user registration and more ==

Deutsche Version: [[Startseite]]

== Features ==

 * Exclusively uses DBus/ICE to connect to the server - in no circumstance will Mumble-Django try to access Murmur's Database directly.
 * Compatible with both Murmur 1.1.8 and 1.2.0 -- default is 1.2.0
 * can connect to both Murmur 1.1.8 and Murmur 1.2.0 at the same time, if using DBus for 1.1.8 and Ice for 1.2.0
 * Legacy support for Murmur 1.1.4 (Debian Lenny)
 * [[http://cdn.bitbucket.org/Svedrin/mumble-django/downloads/channel_list.jpg|Public channel list]] for each configured server ([[http://shotgunfun.de/mumble/1/|view the Demo]])
 ** every channel is a link that will connect you directly to that channel
 ** when clicking on a user name, you get a few details about this user
 ** the links apply the user name to registered users, so you can use them and still will be named correctly
 ** empty subchannels will be hidden to keep the list clear (much like Mumble itself does)
 * Create and delete Mumur instances on as many Murmur installations as you want, they just need to be on the System DBus / ICE
 * Recognizes Cell phone browsers and serves them with a special, light-weight version of the channel viewer page ([[http://shotgunfun.de/mumble/mobile/1/|view the Demo]])
 * Fully supports the [[http://mumble.sourceforge.net/Channel_Viewer_Protocol|Channel Viewer Protocol]]
 * Can be used as a data source for [[http://github.com/cheald/murmur-manager/tree/master/widget/|Murmur-Manager's channel viewer]] ([[http://viewer.shotgunfun.de/demo.html?id=1|view the Demo]])
 * Ships with a [[http://munin.projects.linpro.no/|Munin]] plugin that graphs the user count for each registered server ([[http://munin.funzt-halt.net/funzt-halt.net/glint.funzt-halt.net-mumble_django.html|view the Demo]])
 * Edit the following configuration details in the [[Admin Interface]] for a Murmur instance:
 ** Server Registration Name (which is also the name of the root channel)
 ** Server Address (can be a domain name too, the "host" field will be set to the according IP automatically)
 ** Server Port
 ** Website URL (will show up in the global Server List)
 ** Welcome Message
 ** Server Password
 ** Superuser Password
 ** Max Users
 ** Bandwith
 ** SSL Cert and Key
 * Murmur instances can be started/stopped directly from the web interface
 * User registration
 ** Registered Django users can register an account on every configured Murmur instance, so they can join with +A
 ** Murmur Accounts can be managed in the [[Admin Interface]]
 ** for security, Users' passwords are not saved in the models (the field only exists for Model compatibility, save() empties it)
 ** grant/revoke users' membership in the //admin// group on the root channel
 * "manage.py syncdb" recognizes existing Murmur instances and players and puts them into the DB
 * [[http://cdn.bitbucket.org/Svedrin/mumble-django/downloads/murmur_admin_website.jpg|Admin interface]] for server admins to configure basic settings
 * User manager for server admins: add/delete registrations, grant/revoke admin, change password ([[http://bitbucket.org/Svedrin/mumble-django/wiki/murmur_usermanager.jpg|screenshot]])
 * handling user textures
 * an Ice connector to allow simple switching between DBus and Ice
 * Main template is a single file: if you don't like the look-and-feel, just change index.htm
 * Full Django API compatibility: To extend mumble-django, you only need to work with the models, they will handle everything in their save() methods
 * Complete support of all options (like configuring channel/player name regexes)
 * Generates valid XHTML transitional (apart from HTML in the channel/user descriptions :) )
 * Extensibility: Being a standard Django project and using standard Django Models, you can extend Mumble-Django easily and build a complete website around it.


== Demo installation ==

The demo installation is running here: [[http://demo.mumble-django.org/mumble-django/]]

This installation is based on Debian Testing.


== Prerequisites, Installation ==

Please see the [[Installation]] page for more information about what's needed and how to install Mumble-Django.


== Known Issues ==

For a list of known bugs, please see the [[http://bitbucket.org/Svedrin/mumble-django/issues/|Issues]] page. If you find a bug or would like to request a feature, this is also the place to go. Please feel free to open a ticket whenever you like!


== Contact ==

If you need help (or anything else), you can contact me via IRC (Svedrin in #mumble on Freenode) or Jabber (ich@svedr.in).

You might want to [[http://twitter.com/just_svedrin|follow me on Twitter]], and I always use the  [[http://twitter.com/#search?q=%23mumbledjango|#mumbledjango]] hashtag for tweets concerning the project. This way, you can easily get the latest news!


== Further documentation ==

SourceArchive.com seems to generate an API documentation using DoxyGen, which can be found under
[[http://mumble-django.sourcearchive.com/versions/main.html]].


== Get involved ==

There are several ways you can help in the development of mumble-django:

 * Write or maintain a Translation.
 * Test new versions before they are released.
 * [[http://bitbucket.org/Svedrin/mumble-django/issues/|Submit bug reports]] if you find an error.
 * If you miss a feature and you can add it, [[http://bitbucket.org/Svedrin/mumble-django/issues/|submit a patch]].
 * Help maintaining the documentation in the Wiki.
 * If you want to join the team, just contact Svedrin on Freenode. Help is always welcome :)
 * [[https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KJUEVMAGMAVWS|{{http://www.paypal.com/en_US/i/btn/btn_donate_LG.gif|make a donation}}]]


== License ==

This app is licensed under the GPL v2 or later.
