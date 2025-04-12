
##############################################################
#
# THERMOMETER-CLIENT
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
THERMOMETER_CLIENT_VERSION = 5a9d65b
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
THERMOMETER_CLIENT_SITE = git@github.com:smsweet66/thermometer-client.git
THERMOMETER_CLIENT_SITE_METHOD = git

$(eval $(cargo-package))
