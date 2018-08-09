FROM ubuntu:18.04

# Prevent apt packages from requesting input durring install
ENV DEBIAN_FRONTEND noninteractive

# Install Packages
RUN apt-get update && apt-get install -y \
    php-cli \
    php-curl \
    php-json \
    php-mysql \
    git \
    curl \
    vim \
    ssh \
    tmux \
    zsh \
    nodejs \
    npm \
    locales

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

# Set locale to en_US.utf8
RUN rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install oh-my-zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Clean up
RUN apt-get clean \
    && npm cache clean --force

WORKDIR /workspace

ENTRYPOINT tmux new -s workspace 
