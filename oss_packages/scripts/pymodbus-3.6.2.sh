#!/bin/sh

# name of directory after extracting the archive in working directory
PKG_DIR="pymodbus-3.6.2"

# name of the archive in dl directory (use "none" if empty)
PKG_ARCHIVE_FILE="${PKG_DIR}.tar.gz"

# download link for the sources to be stored in dl directory (use "none" if empty)
# PKG_DOWNLOAD="https://github.com/pymodbus-dev/pymodbus/archive/refs/tags/v${PKG_ARCHIVE_FILE##*-}"
PKG_DOWNLOAD="https://m3-container.net/M3_Container/oss_packages/${PKG_ARCHIVE_FILE}"

# md5 checksum of archive in dl directory (use "none" if empty)
PKG_CHECKSUM="27e845de3074ffb40d0c4c315101b663781608ec83a859dec373cb7b43ac2fe6"



SCRIPTSDIR=$(dirname $0)
HELPERSDIR="${SCRIPTSDIR}/helpers"
TOPDIR=$(realpath ${SCRIPTSDIR}/../..)
. "${TOPDIR}/scripts/common_settings.sh"
. "${HELPERSDIR}/functions.sh"
PKG_ARCHIVE="${DOWNLOADS_DIR}/${PKG_ARCHIVE_FILE}"
PKG_SRC_DIR="${SOURCES_DIR}/${PKG_DIR}"
PKG_BUILD_DIR="${BUILD_DIR}/${PKG_DIR}"
PKG_INSTALL_DIR="${PKG_BUILD_DIR}/install"

configure()
{
    true
}

compile()
{
    true
}

install_staging()
{
    cd "${PKG_BUILD_DIR}"
    mkdir -p "${STAGING_DIR}/usr/local/lib/python3.11/site-packages"
    cp -a "${PKG_BUILD_DIR}/"* "${STAGING_DIR}/usr/local/lib/python3.11/site-packages/"
}

uninstall_staging()
{
    rm -rf "${STAGING_DIR}/usr/local/lib/python3.11/site-packages/pymodbus"*
}

. ${HELPERSDIR}/call_functions.sh
