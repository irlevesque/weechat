FROM debian:stretch

RUN apt-get update
RUN apt-get install -y software-properties-common apt-transport-https gnupg2 python2.7 python-pip
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
RUN echo 'deb https://weechat.org/debian stretch main' >/etc/apt/sources.list.d/weechat.list && \
    echo 'deb-src https://weechat.org/debian stretch main' >>/etc/apt/sources.list.d/weechat.list
RUN apt-get update
RUN apt-get install -y weechat-curses weechat-plugins weechat-python weechat-perl
RUN pip install websocket websocket-client xmpppy pync==1.6.1

CMD /usr/bin/weechat
