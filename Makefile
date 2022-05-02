version=0.1.0
project=powter-client
GITBOOK=$(CURDIR)/gitbook
DOCS=$(CURDIR)/docs
TESTFLOW=$(project)-testflow
#CUR=0.8.1

.PHONY: build-book
build-book: $(GITBOOK)
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
	cp -r testflow/script $(TESTFLOW)
	cp -r testflow/info*.yml $(TESTFLOW)
	sed -i '/^VERSION/c\VERSION=${version}' $(TESTFLOW)/main.mk
	cd $(TESTFLOW) && make -f main.mk set_mod TESTMODE=prod
	cd $(TESTFLOW)/; find . -type f -exec md5sum {} \; > $(CURDIR)/$(TESTFLOW)-$(version).md5; cd -
	mv $(TESTFLOW)-$(version).md5 $(TESTFLOW)
	zip -r $(TESTFLOW)-$(version).zip $(TESTFLOW)
	rm -rf $(TESTFLOW)


.PHONY: build 
build: $(buildjobs)

update-gitbook: $(GITBOOK) check_parameter
	sed -i s/[0-9][.][0-9][.][0-9]/$(CUR)/g $(CURDIR)/gitbook/en/testflow/PRODUCTIONMODE.md
	sed -i s/[0-9][.][0-9][.][0-9]/$(CUR)/g $(CURDIR)/gitbook/en/quickstart/INSTALL.md
	sed -i s/[0-9][.][0-9][.][0-9]/$(CUR)/g $(CURDIR)/gitbook/en/SUMMARY.md
	grep -R $(CUR) gitbook

build-doc: update-gitbook build-book

check_parameter:
	echo "Usage: update-gitbook CUR=$(CUR)"
	test $(CUR)



