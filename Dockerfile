FROM debian:squeeze

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen en_US.UTF-8

ENV HOME /root
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV TZ Africa/Johannesburg

RUN apt-get upgrade -y
RUN apt-get install -y build-essential autoconf
RUN apt-get install -y wget curl openssl socat mysql-client python
RUN apt-get install -y zlib1g zlib1g-dev libssl-dev libcurl4-openssl-dev libexpat1-dev gettext
RUN debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password password rootpass'
RUN debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password_again password rootpass'
RUN apt-get -y install mysql-server-5.1
RUN apt-get -y install ps-watcher
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
RUN rvm install 1.9.3-p3922
RUN apt-get -y install libmysqlclient-dev
RUN apt-get -y install libxslt1-dev
RUN apt-get -y install libpq-dev
