# docker run -it --rm -v "$PWD":/${PWD##*/} php:7.2.2-cli-stretch bash
# wp migratedb pull https://demo:go4sight@go4sight.wpengine.com QVD4B2knqPkHqBYSo4uggxdGGMOm+vpQpSG3gjDL --find=//go4sight.wpengine.com,/nas/content/live/go4sight,https://go4sight.local --replace=//go4sight.local,"/Users/wproscott/Managed Source/go4sight.com",http://go4sight.local --skip-replace-guids --media=compare-and-remove --allow-root

FROM ubuntu:16.04

# Install Packages
RUN apt update && apt install -y \
  php7.0 \
  php7.0-cli \
  php7.0-curl \
  php7.0-json \
  php7.0-mysql \
  git \
  curl \
  tree \
  ftp \
  vim \
  ssh

# Install Nodejs 8 (Stable as of )
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt install -y nodejs

# Install gulp globaly
RUN npm install gulp -g

# Install WP CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
	&& php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
	&& php composer-setup.php \
	&& php -r "unlink('composer-setup.php');" \
	&& mv composer.phar /usr/local/bin/composer

# match uid of container user to host user. Needed so that host files are not owned by root
ADD --chown=1 impersonate.sh /usr/bin/impersonate



ENV DATE_TIMEZONE UTC

WORKDIR /workspace

ENTRYPOINT impersonate
