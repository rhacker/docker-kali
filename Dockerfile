FROM debian:wheezy
MAINTAINER Dzung Nguyen <nxqd.inbox@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update                                                                                          &&\
    apt-get -y upgrade                                                                                         &&\
    echo "deb http://http.kali.org/kali kali main contrib non-free" > /etc/apt/sources.list.d/kali.list && \
    echo "deb-src http://http.kali.org/kali kali main contrib non-free" >> /etc/apt/sources.list.d/kali.list && \
    echo "deb http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list.d/kali.list && \
    echo "deb-src http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list.d/kali.list &&\
    apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6 &&\
    apt-get -y update

RUN apt-get -y --force-yes install libnokogiri-ruby metasploit-framework

## Fix some issues with APT packages.
## See https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl &&\
    ln -sf /bin/true /sbin/initctl

#cleanup
RUN apt-get clean
