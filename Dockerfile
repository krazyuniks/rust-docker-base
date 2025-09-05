# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
FROM debian:trixie-slim

ENV DOCKER_BUILDKIT=1 \
  PATH="$PATH:/home/ryan/.cargo/bin" \
  RUSTFLAGS="-Z threads=8"

RUN apt-get update -y && export DEBIAN_FRONTEND=noninteractive && \
  apt dist-upgrade -y && \
  apt install --no-install-recommends -y \
  ca-certificates \
  pkg-config \
  libssl-dev \
  curl \
  git \
  gnupg2 \
  jq \
  sudo \
  openssh-client \
  less \
  lld \
  iproute2 \
  procps \
  build-essential \
  rsync && \
  groupadd -g 1000 ryan && \
  useradd -ms /bin/bash -u 1000 -g 1000 -d /home/ryan -m ryan && \
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y && \
  rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy --component rustc-codegen-cranelift-preview --component rustfmt && \
  cargo install cargo-watch cargo-outdated cargo-update cargo-edit sea-orm-cli && \
  chown -R ryan:ryan /home/ryan && \
  git clone --branch stable https://github.com/rui314/mold.git && \
  cd mold && \
  ./install-build-deps.sh && \
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=c++ -B build && \
  cmake --build build -j$(nproc) && \
  sudo cmake --build build --target install && \
  cd .. && rm -rf mold && \
  apt -y purge --auto-remove build-essential libtool && \
  apt clean && \
  rm -rf /var/lib/apt /var/lib/dpkg /usr/share/doc/ /usr/share/man* /usr/share/locale* /usr/share/perl
