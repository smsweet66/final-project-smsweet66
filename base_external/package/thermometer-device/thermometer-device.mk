
##############################################################
#
# THERMOMETER-DEVICE
#
##############################################################

THERMOMETER_DEVICE_VERSION = 52dadde
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
THERMOMETER_DEVICE_SITE = git@github.com:smsweet66/thermometer-device-driver.git
THERMOMETER_DEVICE_SITE_METHOD = git
THERMOMETER_DEVICE_GIT_SUBMODULES = YES

THERMOMETER_DEVICE_MODULE_SUBDIRS += src

THERMOMETER_DEVICE_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

$(eval $(kernel-module))
$(eval $(generic-package))
