******************
BrookEngine client
******************

Synopsis
========

.. code-block:: none

    <data-generator> | brook --sender [--send-address=<addr>]
    brook --reader [--read-address=<addr>] | <data-reader>
    brook --exec [--reader] [--sender] [options] -- <command> <args> ...

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

.. option:: --sender

.. option:: --reader

.. option:: --send-address <host>:<port>

.. option:: --read-address <host>:<port>

See Also
========

* :manpage:`brookengine(8)`
* Seismometer <http://seismometer.net/>
