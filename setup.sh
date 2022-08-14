#! usr/bin/bash
sudo apt-get update \
    && sudo DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y --no-install-recommends \
    tzdata \
    git \
    ca-certificates \
    curl \
    build-essential \
    libssl-dev \
    pkg-config \
    libclang-dev \
    cmake \
    cargo
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
sudo source $HOME/.cargo/env
sudo rustup update stable
sudo apt-get install -y screen
sudo rm -r sui
sudo git clone https://github.com/PurelandToday/sui.git
sudo cd sui
sudo git remote add upstream https://github.com/MystenLabs/sui
sudo git fetch upstream
sudo git checkout --track upstream/devnet
sudo cp crates/sui-config/data/fullnode-template.yaml fullnode.yaml
sudo curl -fLJO https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob
sudo cargo run --release --bin sui-node -- --config-path fullnode.yaml
