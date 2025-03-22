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
add_configuration "ENABLE_UART = \"1\""
add_configuration "ENABLE_DWC2_PERIPHERAL = \"1\""
add_configuration "DISABLE_RPI_BOOT_LOGO = \"1\""
add_configuration "DISABLE_OVERSCAN = \"1\""
add_configuration "DISABLE_SPLASH = \"1\""
add_configuration "BOOT_DELAY = \"0\""
add_configuration "GPU_MEM_256 = \"128\""
add_configuration "GPU_MEM_512 = \"196\""
add_configuration "GPU_MEM_1024 = \"396\""
add_configuration "DISTRO_FEATURES:remove = \"x11\""
add_configuration "DISTRO_FEATURES:append = \" opengl\""
add_configuration "PACKAGE_CLASSES = \"package_ipk\""
add_configuration "IMAGE_INSTALL:append = \" chrony\""
add_configuration "IMAGE_INSTALL:append = \" linux-firmware-bcm43430 wpa-supplicant\""
add_configuration "IMAGE_FSTYPES = \"tar.bz2 ext4 rpi-sdimg\""
add_configuration "SDIMG_ROOTFS_TYPE = \"ext4\""
add_configuration "CORE_IMAGE_EXTRA_INSTALL += \"openssh\""
add_configuration "DISTRO_FEATURES:append += \"bluez5 bluetooth wifi\""

add_layer "meta-raspberrypi"
add_layer "meta-thermometer"

bitbake-layers show-layers | grep "meta-raspberrypi" > /dev/null
layer_info=$?

set -e
bitbake core-image-thermometer
