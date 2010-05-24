Features
--------

* Exclusively uses DBus/ICE to connect to the server - in no circumstance will Mumble-Django try to access Murmur's Database directly.
* Compatible with both Murmur 1.1.8 and 1.2.0 -- default is 1.2.0
* can connect to both Murmur 1.1.8 and Murmur 1.2.0 at the same time, if using DBus for 1.1.8 and Ice for 1.2.0
* Legacy support for Murmur 1.1.4 (Debian Lenny)
* `Public channel list <http://cdn.bitbucket.org/Svedrin/mumble-django/downloads/channel_list.jpg>`_ for each configured server (`view the demo <http://shotgunfun.de/mumble/1/>`_)

 * every channel is a link that will connect you directly to that channel
 * when clicking on a user name, you get a few details about this user
 * the links apply the user name to registered users, so you can use them and still will be named correctly
 * empty subchannels will be hidden to keep the list clear (much like Mumble itself does)

* Create and delete Mumur instances on as many Murmur installations as you want, they just need to be on the System DBus / ICE
* Recognizes Cell phone browsers and serves them with a special, light-weight version of the channel viewer page (`view the Demo <http://shotgunfun.de/mumble/mobile/1/>`_)
* Fully supports the `Channel Viewer Protocol <http://mumble.sourceforge.net/Channel_Viewer_Protocol>`_
* Can be used as a data source for `Murmur-Manager's channel viewer <http://github.com/cheald/murmur-manager/tree/master/widget/>`_ (`view the Demo <http://viewer.shotgunfun.de/demo.html?id=1>`_)
* Ships with a `Munin <http://munin.projects.linpro.no/>`_ plugin that graphs the user count for each registered server (`view the Demo <http://munin.funzt-halt.net/funzt-halt.net/glint.funzt-halt.net-mumble_django.html>`_)
* Edit the following configuration details in the `Admin Interface`_ for a Murmur instance:

 * Server Registration Name (which is also the name of the root channel)
 * Server Address (can be a domain name too, the "host" field will be set to the according IP automatically)
 * Server Port
 * Website URL (will show up in the global Server List)
 * Welcome Message
 * Server Password
 * Superuser Password
 * Max Users
 * Bandwith
 * SSL Cert and Key

* Murmur instances can be started/stopped directly from the web interface
* User registration

 * Registered Django users can register an account on every configured Murmur instance, so they can join with +A
 * Murmur Accounts can be managed in the `Admin Interface`_
 * for security, Users' passwords are not saved in the models (the field only exists for Model compatibility, save() empties it)
 * grant/revoke users' membership in the *admin* group on the root channel

* "manage.py syncdb" recognizes existing Murmur instances and players and puts them into the DB
* `Admin Interface <http://cdn.bitbucket.org/Svedrin/mumble-django/downloads/murmur_admin_website.jpg>`_ for server admins to configure basic settings
* User manager for server admins: add/delete registrations, grant/revoke admin, change password (`screenshot <http://bitbucket.org/Svedrin/mumble-django/wiki/murmur_usermanager.jpg>`_)
* handling user textures
* an Ice connector to allow simple switching between DBus and Ice
* Main template is a single file: if you don't like the look-and-feel, just change index.htm
* Full Django API compatibility: To extend mumble-django, you only need to work with the models, they will handle everything in their save() methods
* Complete support of all options (like configuring channel/player name regexes)
* Generates valid XHTML transitional (apart from HTML in the channel/user descriptions :) )
* Extensibility: Being a standard Django project and using standard Django Models, you can extend Mumble-Django easily and build a complete website around it.
