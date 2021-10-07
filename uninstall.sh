#!/bin/env bash

SCRIPT_FOLDER=/var/opt/snapdSB/
SCRIPT_FILE=snapdSB.sh

SERVICE_FOLDER=/etc/systemd/system/
SERVICE_NAME=snapdSB.service
SERVICE_UNINSTALL=snapdSB_uninstall.service

# remove service
rm -rf ${SERVICE_FOLDER}${SERVICE_NAME}
# uninstall script
rm -rf ${SCRIPT_FOLDER}

# create service to remove /snap and return to symlink to /home
# symlink to /home is not working
cp -f ${SERVICE_UNINSTALL} ${SERVICE_FOLDER}
ln -sf ${SERVICE_FOLDER}${SERVICE_UNINSTALL} \
	${SERVICE_FOLDER}remote-fs.target.wants/${SERVICE_UNINSTALL}
