
version = 0.1.0
project = Powter-Client

.PHONY: build
build:
	cp -r client ${project}
	rm -r ${project}/config/*
	rm -r ${project}/log/*
	cd ${project}/; find . -type f -exec md5sum {} \; > ${CURDIR}/${project}-${version}.md5; cd -
	mv ${project}-${version}.md5 ${project}
	zip -r ${project}-${version}.zip ${project}
	rm -rf ${project}