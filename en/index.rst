.. _en_index:

Mumble-Django: A Mumble web interface
=====================================

.. note:: This project was discontinued in October 2015. The docs are here mostly for nostalgic reasons, and so that others can learn from it. `Source code is here <https://github.com/Svedrin/mumble-django>`_, `source code for the docs is here <https://github.com/Svedrin/mumble-django-docs>`_.

.. seealso:: Diese Dokumentation gibt's auch auf Deutsch: :ref:`de_index`

.. seealso:: Programmers might want to take a look at the :ref:`api_index`

.. seealso:: `There is a video tutorial showing the installation. <http://www.youtube.com/watch?v=vC2Cm09LP4k&hd=1>`_

Murmur configuration, user registration and more
------------------------------------------------

Mumble is a low-latency, high quality voice chat program for gaming. It
features noise suppression, automatic gain control and low latency audio
with support for multiple audio standards. Mumble includes an in-game
overlay compatible with most open-source and commercial 3D applications.

The Mumble project focuses its development of Mumble itself and does not
provide a web administration system. Mumble-Django is such a system, based
on Python and Django and licensed as Free Software under the GPL.

Unlike to other existing web interfaces, Mumble-Django strictly uses the
interfaces Mumble provides and fully supports all features Mumble has to
offer. As a Django project, extending it or using it in other Django projects
is very easy, so Mumble-Django is only at the beginning of its potential when
you initially install it.

.. toctree::
   :maxdepth: 1

   features
   installation
   connecting_murmur_to_dbus
   connecting_murmur_to_ice
   web_server_setup

Download, Source code
---------------------

You can find zip or gz packages for all versions
`on the Downloads page <https://github.com/Svedrin/mumble-django/tags>`_.
As Mumble-Django is written in Python, there is no destinction between source
and binary packages.

The latest development version is always available in the *tip* package.

Prerequisites, Installation
---------------------------

Please see the :ref:`en_installation` page for more information about what's needed and how to install Mumble-Django.


License
-------

This app is licensed under the GPL v2 or later.
