FROM wpromote/ubuntu-gulp-wpcli:1

# Install Packages
RUN apt-get update && apt-get install -y \
    curl \
    man \
    sudo \
    tmux \
    vim \
    && rm -rf /var/lib/apt/lists/*

# create docker user and switch for remaining installs
RUN groupadd --gid 1000 docker \
    && useradd --uid 1000 --gid docker --create-home --shell /bin/bash --groups root,sudo docker \
    && echo "docker ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chown docker:docker /home/docker

# Switch to docker user
USER docker

WORKDIR /workspace

ENTRYPOINT bash
