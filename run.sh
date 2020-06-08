#!/bin/bash
set -ex

mkdir ~/.vnc
echo '#!/bin/sh\nxrdb $HOME/.Xresources\nunset SESSION_MANAGER\nunset DBUS_SESSION_BUS_ADDRESS\n[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup\n[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources\nvncconfig -iconic &\nxfce4-session & startxfce4 & \n' > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

/app/expect_vnc.sh

exec supervisord -c /app/supervisord.conf
