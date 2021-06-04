FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends procps zsh git curl wget vim-tiny && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --shell /usr/bin/zsh --create-home docker
WORKDIR /home/docker
ENV USER="docker"
USER docker

RUN git clone -c http.sslverify=false --depth=1 http://github.com/romkatv/powerlevel10k.git
ADD zshrc .zshrc
ADD p10k.zsh .p10k.zsh

ENTRYPOINT ["zsh"]
