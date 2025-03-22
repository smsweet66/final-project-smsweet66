#!/bin/bash
# Script to build image for qemu.
# Author: Siddhant Jajoo.

git submodule init
git submodule sync
git submodule update

# local.conf won't exist until this step on first execution
source poky/oe-init-build-env rpi-build

add_configuration() {
	CONFLINE=$1
	
	cat conf/local.conf | grep "${CONFLINE}" > /dev/null
	local_conf_info=$?

	if [ $local_conf_info -ne 0 ];then
		echo "Append ${CONFLINE} in the local.conf file"
		echo ${CONFLINE} >> conf/local.conf
	else
		echo "${CONFLINE} already exists in the local.conf file"
	fi
}

add_layer() {
	LAYER=$1

	bitbake-layers show-layers | grep $LAYER > /dev/null
	layer_info=$?

	if [ $layer_info -ne 0 ]; then
		echo "Adding $LAYER layer"
		bitbake-layers add-layer ../$LAYER
	else
		echo "$LAYER layer already exists"
	fi
}

add_configuration "MACHINE = \"raspberrypi0-wifi\""
add_configuration "LICENSE_FLAGS_ACCEPTED = \"synaptics-killswitch\""
add_configuration "IMAGE_FSTYPES = \"tar.xz ext3 rpi-sdimg\""

add_layer "meta-raspberrypi"
add_layer "meta-thermometer"

bitbake-layers show-layers | grep "meta-raspberrypi" > /dev/null
layer_info=$?

set -e
bitbake core-image-thermometer
