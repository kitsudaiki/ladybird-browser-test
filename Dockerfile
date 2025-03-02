FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y autoconf \
                       autoconf-archive \
                       automake \
                       build-essential \
                       ccache \
                       cmake \
                       curl \
                       fonts-liberation2 \
                       git \
                       libavcodec-dev \
                       libgl1-mesa-dev \
                       nasm \
                       ninja-build \
                       pkg-config \
                       qt6-base-dev \
                       qt6-multimedia-dev \
                       qt6-tools-dev-tools \
                       qt6-wayland \
                       tar \
                       unzip \
                       zip \
                       clang-19 \
                       clangd-19 \
                       clang-format-19 \
                       clang-tidy-19 \
                       lld-19

# compiling checks and rejects the root-user, so the ubuntu-user is used instead
USER ubuntu

WORKDIR /home/ubuntu/

RUN pwd && \ 
    git clone https://github.com/LadybirdBrowser/ladybird.git && \
    cd ./ladybird && \
    ./Meta/ladybird.sh build ladybird

ENV XDG_RUNTIME_DIR=/tmp/runtime-ubuntu

WORKDIR /home/ubuntu/ladybird

CMD ./Meta/ladybird.sh run ladybird
