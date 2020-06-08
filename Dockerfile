FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu/ bionic main restricted\ndeb http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted\ndeb http://archive.ubuntu.com/ubuntu/ bionic universe\ndeb http://archive.ubuntu.com/ubuntu/ bionic-updates universe\ndeb http://archive.ubuntu.com/ubuntu/ bionic multiverse\ndeb http://archive.ubuntu.com/ubuntu/ bionic-updates multiverse\ndeb http://archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb http://security.ubuntu.com/ubuntu/ bionic-security main restricted\ndeb http://security.ubuntu.com/ubuntu/ bionic-security universe\ndeb http://security.ubuntu.com/ubuntu/ bionic-security multiverse\n' > /etc/apt/sources.list

RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        dbus-x11 \
        xorg \
        nautilus \
        gedit \
        expect \
        sudo \
	vim \
        bash \
        net-tools \
        novnc \
        socat \
        tightvncserver \
        xfce4 \
        supervisor \
        curl \
        git \
	wget \
        g++ \
        ssh \
        terminator \
        htop \
	gnupg2 \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
RUN chmod +x /app/conf.d/websockify.sh
RUN chmod +x /app/run.sh
RUN chmod +x /app/expect_vnc.sh
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list
RUN wget https://dl.google.com/linux/linux_signing_key.pub -P /app
RUN apt-key add /app/linux_signing_key.pub
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        google-chrome-stable

RUN echo xfce4-session >~/.xsession
CMD ["/app/run.sh"]

