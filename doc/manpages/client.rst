******************
BrookEngine client
******************

Synopsis
========

.. code-block:: none

    <data-generator> | brook --send=<channel> [--send-address=<addr>]
    brook --read=<channels> [--read-address=<addr>] | <data-reader>
    brook --exec [--read=...] [--send=...] [options] -- <command> <args> ...

Description
===========

:program:`brook` is a command line client for BrookEngine.

Usage
=====

Modes: {*stdio*, *exec*}x{*reader*, *sender*}

:envvar:`$BROOK_SEND_ADDRESS`, :envvar:`$BROOK_READ_ADDRESS`

Options
-------

.. program:: brook

.. option:: --exec

.. option:: --send <channel>

.. option:: --read <channels>

.. option:: --send-address <host>:<port>

.. option:: --read-address <host>:<port>

See Also
========

* :manpage:`brookengine(8)`
* Seismometer <http://seismometer.net/>
