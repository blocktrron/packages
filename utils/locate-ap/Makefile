#
# Copyright (C) 2020 OpenWrt.org
#
include $(TOPDIR)/rules.mk

PKG_NAME:=locate-ap
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_MAINTAINER:=David Bauer <mail@david-bauer.net>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

Build/Compile=

define Package/locate-ap
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Simple script to flash status LED for physically locating the access point
  PKGARCH:=all
endef

define Package/locate-ap/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./locate-ap.sh $(1)/usr/bin/locate-ap
endef

$(eval $(call BuildPackage,locate-ap))
