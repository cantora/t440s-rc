
INSTALL_PREFIX=/usr/local

.PHONY: install
install: clickpad_conf

.PHONY: clickpad_conf
clickpad_conf: /etc/X11/xorg.conf.d/99-t440s-clickpad.conf

define prefix-install-template
$(1): $(2)
	mkdir -p $$(INSTALL_PREFIX)$$(dir $$@)
	cp $$< $$(INSTALL_PREFIX)$$(dir $$@)
	cd $$(dir $$@) && ln -fs $$(INSTALL_PREFIX)$$(dir $$@)$$(notdir $$<)
endef

$(eval $(call prefix-install-template,/etc/X11/xorg.conf.d/99-t440s-clickpad.conf,xorg/99-t440s-clickpad.conf))
