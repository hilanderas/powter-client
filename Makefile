version=0.1.0
project=powter-client
GITBOOK=$(CURDIR)/gitbook
DOCS=$(CURDIR)/docs

.PHONY: build_book
build_book: $(GITBOOK)
	gitbook build $(GITBOOK) $(DOCS)


buildjobs = build-armv6 build-x86
build-%:
	cp -r ctl $(project)-$*
	sed -i "/ARCH =/c ARCH = $*" $(project)-$*/setting.env
	cd $(project)-$*/; find . -type f -exec md5sum {} \; > $(CURDIR)/$(project)-$*-$(version).md5; cd -
	mv $(project)-$*-$(version).md5 $(project)-$*
	zip -r $(project)-$*-$(version).zip $(project)-$*
	rm -rf $(project)-$*


.PHONY: build
build: $(buildjobs)
