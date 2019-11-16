[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
# Unity-NoVNC-for-Heroku
**Running a VNC server + NoVNC client on Heroku app**

### Features:
  - Running on Ubuntu 16.04 Docker Image
  - Firefox included
  - Easy to use
  - Can be easily customized

### Application included

  - Unity Desktop Environment (Ubuntu-desktop)
  - OBS Studio (Doesn't work)
  - Teamviewer (Doesn't work)
  - Chromium-browser doesn't work, so I removed it.
  -     unity-lens-applications \
        gnome-panel \
        metacity \
        nautilus \
        gedit \
        xterm \
        sudo - Doesn't work because of user is given randomly by heroku \
	firefox \
        bash \
        net-tools \
        novnc \
        socat \
        x11vnc \
        gnome-panel \
        gnome-terminal \
        xvfb \
        supervisor \
        net-tools \
        curl \
        git \
	wget \
        pwgen \
        libtasn1-3-bin \
        libglu1-mesa \




### Installation

##### Requirement:
 - Docker
 - GIT
 - A heroku account
 - Stable Network
 - A blank application

##### Steps: 
First, Install Heroku CLI: [This article](https://devcenter.heroku.com/articles/heroku-cli)

Second, open terminal and login to Heroku CLI
```sh
$ heroku login -i
```

Run automatic create, push, release script

```sh
$ git clone https://github.com/hzhoanglee/Unity-NoVNC-for-Heroku.git
$ cd Unity-NoVNC-for-Heroku
$ bash installnovnc
```

You will be asked for the application name. After you enter the application name, everything will be done automatically. If there is no error, you can access your app at: https://yourappname.herokapp.com


