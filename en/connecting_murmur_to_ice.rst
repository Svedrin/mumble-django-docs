.. _en_connecting_ice:

Making Murmur available via Ice
===============================

To make Murmur reachable via Ice, all you need to do is edit murmur.ini and
restart Murmur.

Configuring Murmur
------------------

The first thing you need to do is edit murmur.ini, and find these lines::

    # If you want to use ZeroC Ice to communicate with Murmur, you need
    # to specify the endpoint to use. Since there is no authentication
    # with ICE, you should only use it if you trust all the users who have
    # shell access to your machine.
    # Please see the ICE documentation on how to specify endpoints.
    #ice="tcp -h 127.0.0.1 -p 6502"

All you need to do is uncomment the last line::

    # If you want to use ZeroC Ice to communicate with Murmur, you need
    # to specify the endpoint to use. Since there is no authentication
    # with ICE, you should only use it if you trust all the users who have
    # shell access to your machine.
    # Please see the ICE documentation on how to specify endpoints.
    ice="tcp -h 127.0.0.1 -p 6502"

Restarting Murmur
-----------------

The next step is to restart murmur, so it applies the new configuration.
How to do that depends on the way you installed Murmur.

* If you installed it via apt on Debian, run */etc/init.d/mumble-server restart*.
* If you installed it yourself from the static package, type *killall murmur.x86*
  to kill the running daemon, and *./murmur.x86* to start it up again.


