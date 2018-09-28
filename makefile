
version = 0.1.0
project = Powter-Client
config = conf_pkg

.PHONY: build_code build_config build
build_code:
	cp -r client ${project}
	cd ${project}/; find . -type f -exec md5sum {} \; > ${CURDIR}/${project}-${version}.md5; cd -
	mv ${project}-${version}.md5 ${project}
	zip -r ${project}-${version}.zip ${project}
	rm -rf ${project}

build_config:
	cp -r config_pkg ${config}
	rm -r ${config}/log/*
	cd ${config}/; find . -type f -exec md5sum {} \; > ${CURDIR}/${config}-${version}.md5; cd -
	mv ${config}-${version}.md5 ${config}
	zip -r ${config}-${version}.zip ${config}
	rm -rf ${config}

build: build_code build_config