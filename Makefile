PREFIX := /usr
BINDIR := $(PREFIX)/bin
LIBDIR := $(PREFIX)/local/lib/bash/5.1

install:
	mkdir -pv $(BINDIR) $(LIBDIR)

uninstall:

reinstall: uninstall install

.PHONY: install uninstall reinstall

