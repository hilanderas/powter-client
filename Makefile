version=0.1.0
project=powter-client
GITBOOK=$(CURDIR)/gitbook
DOCS=$(CURDIR)/docs
TESTFLOW=$(project)-testflow

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


build-testflow:
	cp -r testflow/script $(project)-testflow
	cd $(TESTFLOW)/; find . -type f -exec md5sum {} \; > $(CURDIR)/$(TESTFLOW)-$(version).md5; cd -
	mv $(TESTFLOW)-$(version).md5 $(TESTFLOW)
	zip -r $(TESTFLOW)-$(version).zip $(TESTFLOW)
	rm -rf $(TESTFLOW)


.PHONY: build 
build: $(buildjobs)


