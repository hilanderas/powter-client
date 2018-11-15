CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}

## download dns
.PHONY: rm-dns-api rm-dns-genconf rm-dns-image download-dns
rm-dns-api:
	rm $(DNS_API_ZIP)
	rm -rf $(DNS_API) 

rm-dns-genconf:
	rm $(DNS_CONFGEN_ZIP) 
	rm -rf $(DNS_CONFGEN)

rm-dns-image:
	docker rmi $(DNS_IMAGE)

remove-dns: rm-dns-api rm-dns-genconf rm-dns-image

## download bypass
.PHONY: rm-bypass-api rm-bypass-genconf rm-bypass-image download-bypass
rm-bypass-api:
	rm $(BYPASS_API_ZIP)
	rm -rf $(BYPASS_API) 

rm-bypass-image:
	docker rmi $(BYPASS_IMAGE)

rm-bypass-genconf:
	rm $(BYPASS_CONFGEN_ZIP)
	rm -rf $(BYPASS_CONFGEN)

remove-bypass: rm-bypass-api rm-bypass-genconf rm-bypass-image

## download sskcp
.PHONY: rm-sskcp-api rm-sskcp-genconf rm-sskcp-image download-sskcp
rm-sskcp-api:
	rm $(SSKCP_API_ZIP)
	rm -rf $(SSKCP_API)

rm-sskcp-image:
	docker rmi $(SSKCP_IMAGE)

rm-sskcp-genconf:
	rm $(SSKCP_CONFGEN_ZIP)
	rm -rf $(SSKCP_CONFGEN)
	#rm -rf $(CURDIR)/sskcp-client-confgenerator

remove-sskcp: rm-sskcp-api rm-sskcp-genconf rm-sskcp-image


# Download the project
remove-apis: rm-dns-api rm-bypass-api rm-sskcp-api
remove-images: rm-dns-image rm-bypass-image rm-sskcp-image
remove-genconfs: rm-dns-genconf rm-bypass-genconf rm-sskcp-genconf
remove: remove-apis remove-genconfs remove-images

