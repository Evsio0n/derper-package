#!/bin/sh

set -eu

if command -v systemctl >/dev/null 2>&1; then
	systemctl daemon-reload || true
fi

mkdir -p /etc/derper


if getent group derper >/dev/null 2>&1; then
	true
else
	echo "Add group derper"
	groupadd derper
fi

if id -u derper >/dev/null 2>&1; then
	true
else
	echo "Add user derper"
	useradd -m -g derper derper
fi

if id -nG derper 2>/dev/null | tr ' ' '\n' | grep -qx derper; then
	true
else
	echo "Add user derper to group derper"
	usermod -aG derper derper
fi

if [ ! -f /etc/derper/derper.conf ]; then
	touch /etc/derper/derper.conf
fi

chown -R derper:derper /etc/derper
chmod 640 /etc/derper/derper.conf

echo "Edit /etc/derper/derper.conf to enable derper"