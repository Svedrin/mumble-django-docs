Channel Viewer
==============

Mumble-Django includes a Channel Viewer which has been written completely in JavaScript
using ExtJS components. That way, it can be embedded seemlessly in a website (that is,
without using iframe fakery) and load its content in the background using AJAX.

The source code for the channel viewer can be found here: 
http://bitbucket.org/Svedrin/mumble-django/src/tip/pyweb/mumble/media/js/channelviewer.js

Channel Viewer Protocol
-----------------------

The channel viewer expects to get its data in a JSON format which has been standardized
as the `Channel Viewer Protocol <http://mumble.sourceforge.net/Channel_Viewer_Protocol>`_.
This protocol is implemented by Mumble-Django, and can be queried using an URL like
``http://demo.mumble-django.org/mumble-django/mumble/1.json``. That is, if 
``http://demo.mumble-django.org/mumble-django/mumble/1`` is the URL where you see your
server's detail page, simply append ``.json`` or ``.xml`` to retrieve the data in the
standardized format.

This format is parseable not only by Mumble-Django's channel viewer, but indeed by all
channel viewers which are compatible to the Channel Viewer Protocol.

Usage examples
--------------

The following code can be used to render the channel viewer into the document's body
(that is, it will be the only content the page contains)::

 Ext.QuickTips.init();
 viewer = new Ext.ux.MumbleChannelViewer({
     renderTo: Ext.getBody(),
     idleInterval: 5,
     source_url: "http://example.com/mumble/1.json",
     imageurl: "http://example.com/img"
     });

Of course, the channel viewer can be embedded like any other ExtJS component, e.g. in
a tab panel::

 Ext.QuickTips.init();
 tabpanel = new Ext.TabPanel({
     renderTo: Ext.getBody(),
     activeTab: 0,
     items: [{
            xtype: "mumblechannelviewer",
            title: "Channels!",
            source_url: "http://example.com/mumble/1.json",
            imageurl: "http://example.com/img"
        }, {
            title: "Infoez!",
            html:  "Another tab"
        }]
     });

Resources
---------

The channel viewer displays various icons; most notably the Mumble, Channel and User
icons, but also those for the user flags. In order to work, you need to pass the
URL where those images are served in the ``imageurl`` config option. The images need
to be in PNG format, and the following images are currently being used:

* authenticated
* channel
* comment_seen
* deafened_self
* deafened_server
* mumble.16x16
* muted_self
* muted_server
* muted_suppressed
* priority_speaker
* recording
* talking_off
* talking_on

Class definition
----------------

.. js:class:: Ext.ux.MumbleChannelViewer(config)
    
    **Inherits from**: `Ext.tree.TreePanel <http://dev.sencha.com/deploy/dev/docs/?class=Ext.tree.TreePanel>`_
    
    **xtype**: mumblechannelviewer
    
    :param string source_url: The URL to query for channel/user information. Needs to
      point to a channel viewer protocol compliant JSON resource.
    :param string imageurl: The URL where images for the user flags can be found.
    :param int refreshInterval: The interval in milliseconds at which the channel viewer
      should automatically reload its data. (Default: 30000, 0 to start with auto-refresh
      disabled)
    :param int idleInterval: A user is considered talking if their ``idlesecs`` param
      is less than or equal to the value given here. (Default: 2)
    :param bool enableDD: If true, Drag&Drop will be enabled to allow channels and
      players to be moved around by the user.

Events
------

In addition to the standard events raised by a
`TreePanel <http://dev.sencha.com/deploy/dev/docs/?class=Ext.tree.TreePanel>`_,
the channel viewer can raise these events if ``enableDD`` is set to ``true``:

.. js:function:: moveUser( Ext.tree.TreePanel this, Object userdata, Object chandata )
    
    Fired when a user has been moved to a new channel.

.. js:function:: moveChannel( Ext.tree.TreePanel this, Object movedchandata, Object targetchandata )
    
    Fired when a channel has been moved to a new parent channel.

The data objects passed to the events conform to the channel viewer protocol.

