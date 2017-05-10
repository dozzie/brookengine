******************
BrookEngine daemon
******************

Synopsis
========

.. code-block:: none

    brookengine [options]
    brookengine [--socket=<path>] reload
    brookengine [--socket=<path>] list
    brookengine [--socket=<path>] start <query>
    brookengine [--socket=<path>] stop <query>
    brookengine [--socket=<path>] restart <query>
    brookengine [--socket=<path>] cancel-restart <query>

Description
===========

BrookEngine is a data market for Seismometer monitoring system.

Usage
=====

Something about queries.

Ports: submission (MessagePack on port 5168), subscription (JSON/line on port
5268).

Files:

* :file:`/etc/brookengine/brookengine.conf`
* :file:`/etc/brookengine/queries.conf`
* :file:`/etc/brookengine/queries.logging`
* :file:`/etc/brookengine/plugin/`
* :file:`/var/run/brookengine/queries`

Commands
--------

Administrative commands.

.. describe:: brookengine reload

.. describe:: brookengine list

.. describe:: brookengine start <query>

.. describe:: brookengine stop <query>

.. describe:: brookengine restart <query>

.. describe:: brookengine cancel-restart <query>

Options
-------

.. program:: brookengine

.. option:: --config <path>

.. option:: --plugins <path>

.. option:: --background

.. option:: --user <user>

.. option:: --group <group>

.. option:: --logfile <path>

.. option:: --pidfile <path>

.. option:: --socket <path>

.. _brookengine-config:

Configuration
=============

**TODO**

See Also
========

* :manpage:`brook(1)`
* Seismometer <http://seismometer.net/>
