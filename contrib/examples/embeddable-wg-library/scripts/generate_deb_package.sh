#!/bin/bash

apt update
#install fpm
sudo apt-get -y install ruby ruby-dev rubygems build-essential
sudo gem install --no-ri --no-rdoc fpm

rm -rf install
mkdir -p install/usr/lib
mkdir -p install/usr/include

cp *.so install/usr/lib/
cp *.h install/usr/include/

echo "Use fpm for generate deb package"
fpm -f -s dir -t deb -n "libembeddable-wg" \
      -v "0.0.20200911" -C "./install" \
      --deb-use-file-permissions \
      --description "Embeddable WireGuard C Library" \
      --category libs --provides embeddable-wg-library \
      --license "LGPL-2.1+" \
      --deb-priority optional \
      --depends libc6 \
      usr/lib \
      usr/include
