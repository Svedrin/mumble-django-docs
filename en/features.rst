Features
--------

* Exclusively uses DBus/Ice to connect to the server - in no circumstance will
  Mumble-Django try to access Murmur's Database directly.
* Compatible with both Murmur 1.1.8 and 1.2.0 -- default is 1.2.0
* can connect to both Murmur 1.1.8 and Murmur 1.2.0 at the same time, if using
  DBus for 1.1.8 and Ice for 1.2.0
* Legacy support for Murmur 1.1.4 (Debian Lenny)
* Public channel list for each configured server

 * every channel is a link that will connect you directly to that channel
 * when clicking on a user name, you get a few details about this user
 * the links apply the user name to registered users, so you can use them and still will be named correctly
 * empty subchannels will be hidden to keep the list clear (much like Mumble itself does)

* Create and delete Mumur instances on as many Murmur installations as you want,
  they just need to be on the System DBus / ICE
* Recognizes Cell phone browsers and serves them with a special, light-weight
  version of the channel viewer page
* Fully supports the `Channel Viewer Protocol <https://www.mumble.info/documentation/developer/channel-viewer-protocol/>`_
* Can be used as a data source for `Murmur-Manager's channel viewer <http://github.com/cheald/murmur-manager/tree/master/widget/>`_
* Ships with a `Munin <http://munin.projects.linpro.no/>`_ plugin that graphs
  the user count for each registered server
* Edit the following configuration details in the `Admin Interface`_
  for a Murmur instance:

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

 * Registered Django users can register an account on every configured Murmur
   instance, so they can join with +A
 * Murmur Accounts can be managed in the `Admin Interface`_
 * for security, Users' passwords are not saved in the models (the field only
   exists for Model compatibility, save() empties it)
 * grant/revoke users' membership in the *admin* group on the root channel

* "manage.py syncdb" recognizes existing Murmur instances and players and puts
  them into the DB
* Admin Interface for server admins to configure basic settings
* User manager for server admins: add/delete registrations, grant/revoke admin,
  change password
* handling user textures
* an Ice connector to allow simple switching between DBus and Ice
* Main template is a single file: if you don't like the look-and-feel, just
  change index.htm
* Full Django API compatibility: To extend mumble-django, you only need to work
  with the models, they will handle everything in their save() methods
* Complete support of all options (like configuring channel/player name regexes)
* Generates valid XHTML transitional (apart from HTML in the channel/user
  descriptions :) )
* Extensibility: Being a standard Django project and using standard Django Models,
  you can extend Mumble-Django easily and build a complete website around it.
