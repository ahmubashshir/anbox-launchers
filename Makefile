prefix:=
LIBDIR:=
DESTDIR:=
SYSCONFDIR:=
ifneq ($(DESTDIR),)
	prefix:=/usr
	_prefix=$(DESTDIR)$(prefix)
	LIBDIR:=$(prefix)/lib
	_LIBDIR=$(DESTDIR)$(LIBDIR)
	SYSCONFDIR:=$(prefix)/etc
	_SYSCONFDIR=$(DESTDIR)$(SYSCONFDIR)
else
	prefix:=/usr/local
	_prefix=$(prefix)
	LIBDIR:=$(prefix)/lib
	_LIBDIR=$(LIBDIR)
	SYSCONFDIR:=$(prefix)/etc
	_SYSCONFDIR=$(SYSCONFDIR)
endif
all:
	@echo run ⌵ to install anbox-launchers.
	@echo '"make install prefix=/usr"'
install: install-all configure reload
uninstall: deconfigure  remove reload
install-all:
	install -m 644 -Dt $(_LIBDIR)/systemd/user anbox-launchers.service anbox-launchers.timer
	sed -i "s|@PREFIX@|$(LIBDIR)|" $(_LIBDIR)/systemd/user/anbox-launchers.service
	install -m 644 -Dt $(_SYSCONFDIR)/xdg/menus/applications-merged anbox-android.menu
	install -m 644 -Dt $(_prefix)/share/desktop-directories anbox-android.directory
	install -m 755 -Dt $(_LIBDIR)/anbox anbox-launchers
configure:
	if [ -z "$(DESTDIR)" ];then systemctl --user --global enable anbox-launchers.timer;fi
deconfigure:
	if [ -z "$(DESTDIR)" ];then systemctl --user --global disable anbox-launchers.timer;fi
reload:
	@if [ -z "$(DESTDIR)" ];then echo "Run \"systemctl --user daemon-reload\" now.";fi
remove:
	rm -f $(LIBDIR)/systemd/user/anbox-launchers.service $(LIBDIR)/systemd/user/anbox-launchers.timer $(SYSCONFDIR)/xdg/menus/applications-merged/anbox-android.menu $(prefix)/share/desktop-directories/anbox-android.directory $(LIBDIR)/anbox/anbox-launchers
	rmdir --ignore-fail-on-non-empty -p $(LIBDIR)/systemd/user $(SYSCONFDIR)/xdg/menus/applications-merged $(prefix)/share/desktop-directories $(LIBDIR)/anbox

