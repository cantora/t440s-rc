
INSTALL_PREFIX=/usr/local

.PHONY: install
install: clickpad_conf acpid_conf

######################
.PHONY: clickpad_conf
clickpad_conf: /etc/X11/xorg.conf.d/99-t440s-clickpad.conf

define prefix-install-template
$(1): $(2)
	mkdir -p $$(INSTALL_PREFIX)$$(dir $$@)
	cp $$< $$(INSTALL_PREFIX)$$(dir $$@)
	cd $$(dir $$@) && ln -fs $$(INSTALL_PREFIX)$$(dir $$@)$$(notdir $$<)
endef

$(eval $(call prefix-install-template,/etc/X11/xorg.conf.d/99-t440s-clickpad.conf,xorg/99-t440s-clickpad.conf))

######################
ACPI_EVENT_TARGETS     = $(foreach event,$(wildcard acpi/event_*),/etc/acpi/events/$(notdir $(event)))
ACPI_HANDLER_TARGETS   = $(foreach handler,$(wildcard acpi/*.sh),/etc/acpi/handlers/$(notdir $(handler)))

.PHONY: acpid_conf
acpid_conf: $(ACPI_HANDLER_TARGETS) $(ACPI_EVENT_TARGETS)

$(foreach target,$(ACPI_HANDLER_TARGETS),\
  $(eval $(call prefix-install-template,$(target),acpi/$(notdir $(target))))\
)
$(foreach target,$(ACPI_EVENT_TARGETS),\
  $(eval $(call prefix-install-template,$(target),acpi/$(notdir $(target))))\
)
