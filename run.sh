#!/bin/bash
set -ex
/app/expect_vnc.sh
mkdir -p ~/.vnc
cat << EOF >  ~/.vnc/xstartup
#!/bin/sh
xrdb $HOME/.Xresources
startxfce4 & 
EOF
chmod +x ~/.vnc/xstartup
vncserver -depth 32 -pixelformat rgb888 -geometry 1440x900 :1

mkdir -p /Desktop
cat << EOF >  /Desktop/Chrome.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Google Chrome
Comment=Access the Internet
Exec=/usr/bin/google-chrome-stable --no-sandbox --disable-dev-shm-usage
Icon=google-chrome
Path=
Terminal=false
StartupNotify=true
EOF

exec supervisord -c /app/supervisord.conf
