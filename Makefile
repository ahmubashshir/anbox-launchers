prefix:=
LIBDIR:=
DESTDIR:=
SYSCONFDIR:=
ifneq ($(DESTDIR),)
	prefix:=usr
	LIBDIR:=$(DESTDIR)/$(prefix)/lib
	SYSCONFDIR:=$(DESTDIR)/$(prefix)/etc
else
	prefix:=/usr/local
	LIBDIR=$(prefix)/lib
	SYSCONFDIR:=$(prefix)/etc
endif
all:
install: install-all configure reload
uninstall: deconfigure  remove reload
install-all:
	install -m 644 -Dt $(LIBDIR)/systemd/user anbox-launchers.service anbox-launchers.timer
	install -m 644 -Dt $(SYSCONFDIR)/xdg/menus/applications-merged anbox-android.menu
	install -m 644 -Dt $(prefix)/share/desktop-directories anbox-android.directory
	install -m 755 -Dt $(prefix)/share/anbox anbox-launchers
configure:
	if [ -z "$(DESTDIR)" ];then systemctl --user --global enable anbox-launchers.service anbox-launchers.timer;fi
deconfigure:
	if [ -z "$(DESTDIR)" ];then systemctl --user --global disable anbox-launchers.service anbox-launchers.timer;fi
reload:
	@if [ -z "$(DESTDIR)" ];then echo "Run \"systemctl --user daemon-reload\" now.";fi
remove:
	rm -f $(LIBDIR)/systemd/user/anbox-launchers.service $(LIBDIR)/systemd/user/anbox-launchers.timer $(SYSCONFDIR)/xdg/menus/applications-merged/anbox-android.menu $(prefix)/share/desktop-directories/anbox-android.directory $(prefix)/share/anbox/anbox-launchers
	rmdir --ignore-fail-on-non-empty -p $(LIBDIR)/systemd/user $(SYSCONFDIR)/xdg/menus/applications-merged $(prefix)/share/desktop-directories $(prefix)/share/anbox

