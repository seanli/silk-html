FROM base

# REPOS
RUN apt-get update; apt-get install -y -q software-properties-common python-software-properties

# SHIMS
RUN dpkg-divert --local --rename --add /sbin/initctl; ln -s /bin/true /sbin/initctl

# LANGUAGE
RUN apt-get install -y -q language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8; dpkg-reconfigure locales

# DEFAULT
RUN apt-get install -y -q curl git mercurial subversion make wget openssh-server zip tmux vim emacs nano build-essential g++ memcached imagemagick graphicsmagick graphicsmagick-libmagick-dev-compat python python-setuptools python-dev python-distribute python-pip python-virtualenv ruby ruby-dev openjdk-6-jdk sqlite3 libxml2-dev libxslt1-dev libpq-dev libsqlite3-dev libmysqlclient-dev libmysql-ruby


# NGINX
RUN apt-get install -y -q nginx
ADD default /etc/nginx/sites-available/
ADD app /home/kite/workspace

EXPOSE 8000

ADD common.sh/
ADD start.sh /
ADD restart.sh /
