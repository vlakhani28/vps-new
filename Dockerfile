FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN mv /etc/apt/sources.list /etc/apt/sources.listbaktest

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu/ bionic main restricted\ndeb http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted\ndeb http://archive.ubuntu.com/ubuntu/ bionic universe\ndeb http://archive.ubuntu.com/ubuntu/ bionic-updates universe\ndeb http://archive.ubuntu.com/ubuntu/ bionic multiverse\ndeb http://archive.ubuntu.com/ubuntu/ bionic-updates multiverse\ndeb http://archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb http://security.ubuntu.com/ubuntu/ bionic-security main restricted\ndeb http://security.ubuntu.com/ubuntu/ bionic-security universe\ndeb http://security.ubuntu.com/ubuntu/ bionic-security multiverse\n' > /etc/apt/sources.list

RUN set -ex; \
    apt-get update \
    && apt-get install -y \
        falkon
        
RUN cp /etc/apt/sources.listbaktest /etc/apt/sources.list
        
        
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        ubuntu-desktop \
        unity-lens-applications \
        gnome-panel \
        metacity \
        nautilus \
        gedit \
        xterm \
        sudo \
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
        libtasn1-3-bin \
        libglu1-mesa \
        libqt5webkit5 \
        libqt5x11extras5 \
        qml-module-qtquick-controls \
        qml-module-qtquick-dialogs \
        g++ \
        ssh \
        terminator \
        htop \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1366 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_UNITY=yes

RUN adduser ubuntu

RUN echo "ubuntu:ubuntu" | chpasswd && \
    adduser ubuntu sudo && \
    sudo usermod -a -G sudo ubuntu

RUN sudo add-apt-repository ppa:obsproject/obs-studio \
     && sudo apt-get update && sudo apt-get install -y obs-studio

COPY . /app

RUN chmod +x /app/conf.d/websockify.sh
RUN chmod +x /app/run.sh

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu/ bionic main restricted\ndeb http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted\ndeb http://archive.ubuntu.com/ubuntu/ bionic universe\ndeb http://archive.ubuntu.com/ubuntu/ bionic-updates universe\ndeb http://archive.ubuntu.com/ubuntu/ bionic multiverse\ndeb http://archive.ubuntu.com/ubuntu/ bionic-updates multiverse\ndeb http://archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb http://security.ubuntu.com/ubuntu/ bionic-security main restricted\ndeb http://security.ubuntu.com/ubuntu/ bionic-security universe\ndeb http://security.ubuntu.com/ubuntu/ bionic-security multiverse\n' > /etc/apt/sources.list

RUN set -ex; \
    apt-get update
    
USER ubuntu

CMD ["/app/run.sh"]

