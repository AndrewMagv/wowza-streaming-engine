#!/bin/bash

WMSBASE_NAME=WowzaStreamingEngine
WMSCONFIG_SCRIPT="/usr/local/WowzaStreamingEngine/bin/setenv.sh"
WMSLICENSE_FILE="/usr/local/WowzaStreamingEngine/conf/Server.license"
WMSDAEMON_CMD=/usr/bin/WowzaStreamingEngined
WMSPID_FILE="/var/run/${WMSBASE_NAME}.pid"

[ -r "${WMSCONFIG_SCRIPT}" ] && . "${WMSCONFIG_SCRIPT}"

if ! test -f "${WMSLICENSE_FILE}" ; then
    echo ""
    echo "ERROR: Missing license file: (${WMSLICENSE_FILE})"
    echo "You must first run Wowza Streamng Engine 4 in "
    echo "standalone mode to enter a license key. Execute the "
    echo "following commands to run in standalone mode:"
    echo ""
    echo "cd /usr/local/WowzaStreamingEngine/bin"
    echo "./startup.sh"
    echo ""
    exit 0
fi

${WMSDAEMON_CMD} ${WMSCONFIG_SCRIPT} ${WMSPID_FILE} start >/dev/null 2>&1
