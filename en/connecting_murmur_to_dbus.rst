.. _en_connecting_dbus:

Connecting Murmur to DBus
=========================

If you are unfamiliar with DBus and don't know how to connect Murmur to the
system DBus, you should read on.

Configuring Murmur
------------------

The first thing you need to do is edit murmur.ini, and find these lines::

    # Murmur defaults to not using D-Bus. If you wish to use dbus, which is one of the
    # RPC methods available in murmur, please specify so here.
    #
    #dbus=session

    # Alternate service name. Only use if you are running distinct
    # murmurd processes connected to the same D-Bus daemon.
    #dbusservice=net.sourceforge.mumble.murmur

You need the dbus setting to be set to "system", the dbusservice *only* needs
to be changed if this is not the only Murmurd process that you want to be reachable
over DBus. **If this is not the case for you, leave this setting alone!**

So after you're done, the section should look like this::

    # Murmur defaults to not using D-Bus. If you wish to use dbus, which is one of the
    # RPC methods available in murmur, please specify so here.
    #
    dbus=system

    # Alternate service name. Only use if you are running distinct
    # murmurd processes connected to the same D-Bus daemon.
    #dbusservice=net.sourceforge.mumble.murmur

Restarting Murmur
-----------------

The next step is to restart murmur, so it applies the new configuration.
How to do that depends on the way you installed Murmur.

* If you installed it via apt on Debian, run */etc/init.d/mumble-server restart*.
* If you installed it yourself from the static package, type *killall murmur.x86*
  to kill the running daemon, and *./murmur.x86* to start it up again.

Checking if it works
--------------------

After you restarted Murmur, check murmur.log to see if it is able to connect
to DBus. If you installed using apt, the log will be located at
*/var/log/mumble-server/mumble-server.log*, otherwise it will be *murmur.log*
in whatever directory you unpacked murmur to.

You want to see a message like this::

    <W>2009-03-26 12:25:01.038 DBus registration succeeded


If you see this message, Murmur registered on the DBus and is now reachable - you're done! :)


Troubleshooting DBus
====================

If you get DBus error messages in Murmur's logfile, you need to do a bit more work.

Failed to connect to D-Bus system
---------------------------------

If you get an error message like this, it means you don't have the DBus daemon
installed or running::

    <W>2009-03-26 12:24:34.994 Failed to connect to D-Bus system

In this case, install and start the DBus daemon. How to do that depends on your
distribution, on Debian it works like this::

    apt-get install dbus
    /etc/init.d/dbus restart

After you installed DBus, this message should disappear, but most likely you will get another error message:

Failed to register on DBus
--------------------------

If you get this error message, it means that DBus is installed and running, yet
access is denied to Murmur:

    <W>2009-03-26 12:38:16.692 Failed to register on DBus:
    org.freedesktop.DBus.Error.AccessDenied
    Connection ":1.1" is not allowed to own the service "net.sourceforge.mumble.murmur"
    due to security policies in the configuration file


This can be fixed by configuring DBus to allow the user under wich Murmur runs
to own the name "net.sourceforge.mumble.murmur". To do that, place a file named
*murmur.conf* in the directory */etc/dbus-1/system.d*, and put the following XML
into it::

    <!DOCTYPE busconfig PUBLIC
	"-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
	"http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
    <busconfig>
	<policy user="mumble-server">
		<allow own="net.sourceforge.mumble.murmur"/>
	</policy>
	<policy context="default">
		<allow send_destination="net.sourceforge.mumble.murmur"/>
		<allow receive_sender="net.sourceforge.mumble.murmur"/>
	</policy>
    </busconfig>

Note that on the first policy tag, **you need to set the correct user name in line 5**!
Otherwise, Murmur will still be denied access!

After you put the configuration file in place, restart DBus by running
*/etc/init.d/dbus restart* and repeat the steps from "Restarting Murmur".
Once Murmur successfully connects to DBus, you're all set.
