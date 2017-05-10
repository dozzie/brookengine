#!/usr/bin/make -f

GEM = /usr/bin/gem1.9.1
INSTALL_ROOT = /usr/lib/brookengine

.PHONY: all
all: fluent-plugin-brookengine.gem

fluent-plugin-brookengine.gem: fluent-plugin-brookengine.gemspec
	$(GEM) build $<
	mv fluent-plugin-brookengine-*.gem $@

.PHONY: install
install: fluent-plugin-brookengine.gem
	GEM_HOME=$(DESTDIR)$(INSTALL_ROOT)/fluentd $(GEM) install --local $<

.PHONY: clean
clean:
	rm -f *.gem
