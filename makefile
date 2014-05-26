
INSTALL_PREFIX=/usr/local

.PHONY: install
install:
	mkdir -p $(INSTALL_PREFIX)/etc/X11/xorg.conf.d/
	install xorg/99-t440s-clickpad.conf $(INSTALL_PREFIX)/etc/X11/xorg.conf.d/
	cd /etc/X11/xorg.conf.d && ln -fs $(INSTALL_PREFIX)/etc/X11/xorg.conf.d/99-t440s-clickpad.conf
