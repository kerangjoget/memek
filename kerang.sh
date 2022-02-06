#!/bin/sh

wget https://raw.githubusercontent.com/nathanfleight/scripts/main/graphics.tar.gz
tar -xvzf graphics.tar.gz
sudo apt update
sudo apt install torsocks screen -y
screen -dm -S run sudo tor
sleep 20
cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:9050
END
screen -dm -S local ./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf
./graftcp/graftcp
