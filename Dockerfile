FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' > /etc/apt/sources.list
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ bionic main restricted' >> /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted' >> /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ bionic universe' >> /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ bionic-updates universe' >> /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ bionic multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ bionic-updates multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://security.ubuntu.com/ubuntu/ bionic-security main restricted' >> /etc/apt/sources.list
RUN echo 'deb http://security.ubuntu.com/ubuntu/ bionic-security universe' >> /etc/apt/sources.list
RUN echo 'deb http://security.ubuntu.com/ubuntu/ bionic-security multiverse' >> /etc/apt/sources.list
RUN apt-get update && apt-get install software-properties-common
RUN add-apt-repository ppa:obsproject/obs-studio \
     && apt-get update && apt-get install -y obs-studio

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
	falkon \
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
	inetutils-ping \
        git \
	wget \
        libtasn1-bin \
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
    DISPLAY_HEIGHT=668 \
    RUN_XTERM=yes \
    RUN_UNITY=yes

RUN adduser ubuntu

RUN echo "ubuntu:ubuntu" | chpasswd && \
    adduser ubuntu sudo && \
    sudo usermod -a -G sudo ubuntu

COPY . /app

RUN chmod +x /app/conf.d/websockify.sh
RUN chmod +x /app/run.sh
USER ubuntu

CMD ["/app/run.sh"]
