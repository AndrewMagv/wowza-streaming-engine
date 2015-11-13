#!/bin/bash

WMSMGRBASE_NAME=WowzaStreamingEngineManager
WMSMGRCONFIG_SCRIPT="/usr/local/WowzaStreamingEngine/manager/bin/setmgrenv.sh"
WMSMGRDAEMON_CMD=/usr/bin/WowzaStreamingEngineManagerd
WMSMGRPID_FILE="/var/run/${WMSMGRBASE_NAME}.pid"

[ -r "${WMSMGRCONFIG_SCRIPT}" ] && . "${WMSMGRCONFIG_SCRIPT}"

${WMSMGRDAEMON_CMD} ${WMSMGRCONFIG_SCRIPT} ${WMSMGRPID_FILE} start >/dev/null 2>&1
