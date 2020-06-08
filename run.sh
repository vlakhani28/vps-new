#!/bin/bash
set -ex
/app/expect_vnc.sh
mkdir -p ~/.vnc
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
vncserver -depth 32 -pixelformat rgb888 -geometry 800x600 :1

exec supervisord -c /app/supervisord.conf
