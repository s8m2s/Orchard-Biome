FROM ubuntu:18.04

# Prevent apt packages from requesting input durring install
ENV DEBIAN_FRONTEND noninteractive

# Install Packages
RUN apt-get update && apt-get install -y \
    php7.2 \
    php7.2-cli \
    php7.2-curl \
    php7.2-json \
    php7.2-mysql \
    php7.2-zip \
    git \
    curl \
    vim \
    ssh \
    tmux \
    zsh \
    locales \
    sudo \
    mysql-client

# Set locale to en_US.utf8
RUN rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# create docker user and switch for remaining installs
# RUN useradd --uid 1000 --create-home --shell /bin/bash --groups root,sudo docker \
#    && echo "docker ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# RUN su docker

# Install Nodejs
RUN apt-get update && sudo apt-get install -y \
    nodejs \
    npm

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
COPY --chown=1 impersonate.sh /usr/local/bin/impersonate

# Install oh-my-zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Clean up
RUN sudo apt-get clean \
    && npm cache clean --force

WORKDIR /workspace

ENTRYPOINT bash
