#!/bin/sh

# name of directory after extracting the archive in working directory
PKG_DIR="ngircd-24"

# name of the archive in dl directory
PKG_ARCHIVE_FILE="${PKG_DIR}.tar.xz"

# download link for the sources to be stored in dl directory
PKG_DOWNLOAD="https://m3-container.net/M3_Container/oss_packages/${PKG_ARCHIVE_FILE}"

# md5 checksum of archive in dl directory
PKG_CHECKSUM="81b9c5ae283d07aab35ce16eaf49e458"



SCRIPTSDIR="$(dirname $0)"
HELPERSDIR="${SCRIPTSDIR}/helpers"
TOPDIR="$(realpath ${SCRIPTSDIR}/../..)"
. ${TOPDIR}/scripts/common_settings.sh
. ${HELPERSDIR}/functions.sh
PKG_ARCHIVE="${DOWNLOADS_DIR}/${PKG_ARCHIVE_FILE}"
PKG_SRC_DIR="${SOURCES_DIR}/${PKG_DIR}"
PKG_BUILD_DIR="${BUILD_DIR}/${PKG_DIR}"
PKG_INSTALL_DIR="${PKG_BUILD_DIR}/install"

configure()
{
    cd "${PKG_BUILD_DIR}"
    export CFLAGS="-g -std=gnu99 ${M3_CFLAGS} -L${STAGING_LIB} -I${STAGING_INCLUDE} -DHAVE_WORKING_GETADDRINFO=1"
    export LDFLAGS="${M3_LDFLAGS} -L${STAGING_LIB}"
    ./configure --target=${M3_TARGET} --host=${M3_TARGET} --enable-ipv6 --with-openssl --with-pam #--enable-debug
}

compile()
{
    copy_overlay
    cd "${PKG_BUILD_DIR}"
    make ${M3_MAKEFLAGS} || exit_failure "failed to build ${PKG_DIR}"
    make DESTDIR="${PKG_INSTALL_DIR}" install
}

install_staging()
{
    cd "${PKG_BUILD_DIR}"
    make -i DESTDIR="${STAGING_DIR}" install || exit_failure "failed to install ${PKG_DIR}"
}

. ${HELPERSDIR}/call_functions.sh
