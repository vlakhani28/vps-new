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
vncconfig -iconic &
startxfce4 &
EOF
chmod +x ~/.vnc/xstartup
vncserver -depth 32 -pixelformat rgb888 -geometry 1440x900 -geometry 800x600 -geometry 1024x768 -geometry 1360x620 -geometry 1366x768 -geometry 1920x1080 :1

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

cat << EOF >  /Desktop/Swicth_to_Chinese_input.sh
#!/bin/bash
im-config -s ibus
ibus-setup
EOF

cat << EOF >  /Desktop/Readme.txt
Step 1: Excute Swicth_to_Chinese_input.sh on Deskop to switch input method.
Step 2: Select 'Input Method', then click add button, choose Chinese and Pinyin icon to add.
Step 3: Now it can support Chinese, Enjoy!
EOF

chmod +x /Desktop/Chrome.desktop
chmod +x /Desktop/Swicth_to_Chinese_input.sh
exec supervisord -c /app/supervisord.conf
