#!/bin/bash
set -ex

mkdir ~/.vnc
cat << EOF >  ~/.vnc/xstartup
#!/bin/sh
xrdb $HOME/.Xresources
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
vncconfig -iconic &
xfce4-session & startxfce4 & 
EOF

chmod +x ~/.vnc/xstartup

/app/expect_vnc.sh

exec supervisord -c /app/supervisord.conf
