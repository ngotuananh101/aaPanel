#!/bin/sh

if [ ! -z "$LINUX_ROOT_PASS" ]; then
    printf "$LINUX_ROOT_PASS\n$LINUX_ROOT_PASS" | passwd
else
    printf "root\nroot" | passwd
fi

if [ ! -z "$PANEL_PASS" ]; then
    printf "$PANEL_PASS" | bt 5
else
    printf "aapanel123" | bt 5
fi

if [ ! -z "$PANEL_USER" ]; then
    printf "$PANEL_USER" | bt 6
else
    printf "aapanel" | bt 6
fi

if [ ! -z "$PANEL_PATH" ]; then
    echo "/$PANEL_PATH" >/www/server/panel/data/admin_path.pl
else
    echo "/aapanel" >/www/server/panel/data/admin_path.pl
fi

sh /restart.sh

sleep 10
while [ true ]; do
    curl -m 60 --retry 8 --retry-max-time 480 -skI -XGET http://127.0.0.1:7800 | awk NR==1 | grep -q 404
    if [ $? -gt 0 ]; then exit 1; else sleep 60; fi
done
