#!/bin/bash

DESCRIPTION="Container offers classic LAMP stack"
CONTAINER_NAME="container_LAMP"
ROOTFS_LIST="rootfs_list_LAMP.txt"

PACKAGES_1="
    Linux-PAM-1.5.3.sh
    zlib-1.3.sh
    tzdb-2023d.sh
    pcre2-10.42.sh
    openssl-3.2.0.sh
    apr-1.7.0.sh
    libuuid-1.0.3.sh
    nghttp2-1.58.0.sh
    jansson-2.14.sh
    cacert-2023-12-12.sh
    mcip.sh
    expat-2.5.0.sh
    libxml2-v2.9.14.sh
"

PACKAGES_2="
    busybox-1.36.1.sh
    mcip-tool-v4.sh
    dropbear-2022.83.sh
    metalog-20230719.sh
    apr-util-1.6.1.sh
    sqlite-src-3440200.sh
    ncurses-6.4.sh
"

PACKAGES_3="
    nano-7.2.sh
    httpd-2.4.57.sh
"

PACKAGES_4="
    php-8.3.1.sh
"

# in case $1 is "do_nothing" this script will end here; quirk needed for automated daily builds
. $(realpath $(dirname ${BASH_SOURCE[0]}))/create.sh $1
