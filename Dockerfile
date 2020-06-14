FROM alpine

RUN apk update && \
    apk add --no-cache automake autoconf ncurses-dev build-base python3 zsh curl git vim tree htop stow wget && \
    rm -f /tmp/* /etc/apk/cache/*

RUN git config --global user.name "Sam Sintz"
RUN git config --global user.email "samsintz@gmail.com"

# Install ZSH
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd
ENV SHELL /bin/zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Tig
RUN git clone --depth 1 https://github.com/jonas/tig /tmp/tig \
  && cd /tmp/tig \
  && make configure \
  && ./configure \
  && make prefix=/usr/local \
  && make install prefix=/usr/local \
  && rm -rf /tmp/tig

# Dotfiles
RUN git clone --depth 1 https://github.com/samsintz/dotfiles /root/dotfiles \
 && rm /root/.zshrc \
 && cd /root/dotfiles \
 && stow zsh

# Configure vim
# TODO

RUN mkdir /root/dev
VOLUME /root/dev

WORKDIR /root

ENV TERM=xterm-256color
ENV LANG=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

ENTRYPOINT ["zsh"]
