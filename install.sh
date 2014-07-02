#!/bin/sh
#

if [ -z "$DESTDIR" ]; then
  DESTDIR=/usr/local
fi

if [ -e "/etc/os-release" ]; then
  . /etc/os-release
fi

SBINDIR="$DESTDIR"/sbin
LIBDIR="$DESTDIR"/lib/pybsdp

#
# Copy standard files.
#
mkdir -p "$LIBDIR" "$SBINDIR"
cp bsdp.py dhcp.py interfaces.py "$LIBDIR"
cp pybsdp.py "$SBINDIR"

#
# Copy config file if one is not present.
#
if [ ! -e /etc/pybsdp.conf ]; then
    cp contrib/pybsdp.conf /etc/pybsdp.conf
fi

#
# Copy init script.
#
if [ "$ID" = "ubuntu" ]; then
    cp contrib/ubuntu.init /etc/init/pybsdp.conf
fi
