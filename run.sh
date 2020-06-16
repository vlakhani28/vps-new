#!/bin/bash
set -ex
/app/expect_vnc.sh
mkdir -p ~/.vnc ~/.config/xfce4
tar -xvf /app/panel.tar -C ~/.config/xfce4
rm -rf /usr/share/icons/Adwaita
cp -r /usr/share/icons/Humanity-Dark /usr/share/icons/Adwaita
cat << EOF >  ~/.vnc/xstartup
#!/bin/sh
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x ~/.vnc/xstartup
vncserver -depth 32 -pixelformat rgb888 -geometry 1440x900 :1

mkdir -p /root/Desktop
cat << EOF >  /root/Desktop/Chrome.desktop
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

chmod +x /root/Desktop/Chrome.desktop
exec supervisord -c /app/supervisord.conf
