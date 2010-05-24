= Admin Interface =

This page gives detailed information on the use of the admin interface, which can be reached by clicking the "Admin" link in the top right corner of the front page of mumble-django.

== General layout ==

When entering the Admin area, you will find a number of sections. These are:
 #  Auth
 ## Users
 ## Groups
 #  Mumble
 ## Mumble Servers
 ## Server instances
 ## User Accounts
 #  Registration
 ## Registration profiles
 #  Sites
 ## Sites

By clicking on one of the links, you will enter the corresponding section and be able to add end edit entries in this section.


== Auth ==

=== Users ===

In this section, you may add/edit/delete users who are able to log in to Django, that is, the web page. These accounts do not yet resemble an account on any Murmur server, they are //only// accounts for the website.

=== Groups ===

To make handling admin privileges easier, you can assign different users to groups.


== Mumble ==

=== Mumble servers ===

This section configures the Murmur servers to connect to. These are the real servers that are running on the system as an actual process. This section is used to hold the DBus/Ice connection data and the Ice secret, and provide access to the server's default config.

=== Server instances ===

Each entry in this section resembles one virtual server instance. Using Django's Admin interface, you can edit //all// parameters of //any// Murmur instance you like, create new instances and delete existing ones. Choose the instance you would like to edit by clicking on the server name, and you will be presented with a page like the one shown in [[murmur_admin.jpg|this screenshot of the admin page]].

Most of the fields are self-explanatory, but these hints may prove to be useful:
* Server address: This can be an IP address or a Host name, and will be used both for the "host" and "RegistrationHost" fields and for building the URLs in the Channel viewer.
* Welcome message: This is an HTML field.
* SSL Certificate/Key: Copy/paste the content of the SSL certificate/key file that you would like this Murmur instance to use. If not given, Murmur creates these itself when the instance is created.
* IP Obfuscation: Prevents IP addresses from being printed to the murmur.log file.
* Player/Channel name regex: Defines what is allowed for channel and player names.
* Default channel: Channel that people will appear in when they first join the server.

=== User accounts ===

The entries in this section allow you to manage the accounts registered on each Murmur instance. These are kept separately from the ones registered in Django, because a single Django users can use different names on different Murmur instances, and I didn't want Murmur's auth to be dependant on Mumble-Django. The edit page will look like [[murmur_useradmin.jpg|this screenshot]].

Interesting fields are:
* Owner: This field names the Django account name of the user who registered this account. This user is the only one who can change this account's password using the website. If you created this account for this user using the Admin panel, set this to None ("------"). DO NOT set this to yourself, as having more than one account on the same server is not supported.
* Admin on root channel: This field controls whether this user should be added to or removed from the Admin group in Murmur when saved. Normally, this means the user will have full admin control on the Murmur server instance, but this can be configured in Murmur's ACLs.


== Registration ==

=== Registration profiles ===

This section keeps some information about accounts that have been registered via the Django-Registration app.

== Sites ==

=== Sites ===

This section lists all URLs via which Mumble-Django should be reachable. The first entry is the most import one, because it will be used by Django-Registration to build the URL in the registration email.
