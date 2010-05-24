API Documentation
=================

This part of the documentation describes the way Mumble-Django works. This
information is generally only useful if you wish to extend Mumble-Django in
some way or another - or if you are just curious, of course :)

Mumble-Django consists of two major parts:

#. The core Mumble application, that implements all the features
#. a Django project around the core app, that wraps up the Mumble app in a
   project ready to be installed on a web server.

This documentation will mostly deal with the Mumble application, and covers
the following sections:

.. toctree::
   :maxdepth: 1

   models
   mmobjects
   views
   forms
   mctl

