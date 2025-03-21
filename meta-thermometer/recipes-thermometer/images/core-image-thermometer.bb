inherit core-image
CORE_IMAGE_EXTRA_INSTALL += "thermometer"
CORE_IMAGE_EXTRA_INSTALL += "openssh"
inherit extrausers
# See https://docs.yoctoproject.org/singleindex.html#extrausers-bbclass
# We set a default password of root to match our busybox instance setup
# Don't do this in a production image
# PASSWD below is set to the output of
# printf "%q" $(mkpasswd -m sha256crypt root) to hash the "root" password
# string
PASSWD = "\$5\$Nt5/TknNUxkgAdTu\$Am01AGELJqKp0HJRJiKD7WF0sNFvumnyuQ839/keXC5"
EXTRA_USERS_PARAMS = "usermod -p '${PASSWD}' root;"
