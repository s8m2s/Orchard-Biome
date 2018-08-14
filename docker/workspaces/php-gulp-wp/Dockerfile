FROM montag451/ubuntu-node

# Prevent apt packages from requesting input durring install
ENV DEBIAN_FRONTEND noninteractive

# Install Packages
RUN apt-get update && apt-get install -y \
    curl \
    man \
    mysql-client \
    php7.2 \
    php7.2-cli \
    php7.2-curl \
    php7.2-json \
    php7.2-mysql \
    php7.2-zip \
    sudo \
    tmux \
    vim \
    && rm -rf /var/lib/apt/lists/*

# create docker user and switch for remaining installs
RUN groupadd --gid 1000 docker \
    && useradd --uid 1000 --gid docker --create-home --shell /bin/bash --groups root,sudo docker \
    && echo "docker ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
USER docker
WORKDIR /home/docker

# Install WP CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && sudo mv wp-cli.phar /usr/local/bin/wp

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && sudo mv composer.phar /usr/local/bin/composer

WORKDIR /workspace

ENTRYPOINT bash
