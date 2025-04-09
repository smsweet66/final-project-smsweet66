
##############################################################
#
# THERMOMETER-DEVICE
#
##############################################################

THERMOMETER_DEVICE_VERSION = 88ef10d
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
THERMOMETER_DEVICE_SITE = git@github.com:smsweet66/thermometer-device-driver.git
THERMOMETER_DEVICE_SITE_METHOD = git
THERMOMETER_DEVICE_GIT_SUBMODULES = YES

THERMOMETER_DEVICE_MODULE_SUBDIRS +=  src

THERMOMETER_DEVICE_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define THERMOMETER_DEVICE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/thermometer_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/thermometer_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
