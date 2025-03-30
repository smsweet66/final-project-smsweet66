#!/bin/sh
# Shared definitions for buildroot scripts

# The defconfig from the buildroot directory we use for qemu builds
QEMU_DEFCONFIG=configs/qemu_aarch64_virt_defconfig
# The place we store customizations to the qemu configuration
MODIFIED_QEMU_DEFCONFIG=base_external/configs/aesd_qemu_defconfig
# The defconfig from the buildroot directory we use for the project
THERMOMETER_DEFAULT_DEFCONFIG=${QEMU_DEFCONFIG}
THERMOMETER_MODIFIED_DEFCONFIG=${MODIFIED_QEMU_DEFCONFIG}
THERMOMETER_MODIFIED_DEFCONFIG_REL_BUILDROOT=../${THERMOMETER_MODIFIED_DEFCONFIG}
