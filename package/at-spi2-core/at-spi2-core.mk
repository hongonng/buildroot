################################################################################
#
# at-spi2-core
#
################################################################################

AT_SPI2_CORE_VERSION_MAJOR = 2.36
AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
AT_SPI2_CORE_LICENSE = LGPL-2.1+
AT_SPI2_CORE_LICENSE_FILES = COPYING
AT_SPI2_CORE_INSTALL_STAGING = YES
AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 \
	$(TARGET_NLS_DEPENDENCIES)
AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon

ifeq ($(BR2_PACKAGE_XLIB_LIBXTST),y)
AT_SPI2_CORE_DEPENDENCIES = xlib_libXtst
AT_SPI2_CORE_CONF_OPTS = -Dx11=yes
else
AT_SPI2_CORE_CONF_OPTS = -Dx11=no
endif

AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

$(eval $(meson-package))
