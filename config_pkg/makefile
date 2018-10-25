include $(CURDIR)/config.env

# download configuration generator
.PHONY: download_dns download_sskcp download_bypass download
download_dns:
	wget https://github.com/elespejo/dnsmasq/releases/download/$(DNS_VERSION)/dnsmasq-confgenerator-$(DNS_VERSION).zip
	unzip dnsmasq-confgenerator-$(DNS_VERSION).zip 

download_sskcp:
	wget https://github.com/elespejo/sskcp/releases/download/$(SSKCP_VERSION)/sskcp-conf-generator-$(SSKCP_VERSION).zip
	unzip sskcp-conf-generator-$(SSKCP_VERSION).zip

download_bypass:
	wget https://github.com/elespejo/bypass/releases/download/$(BYPASS_VERSION)/bypass-confgenerator-$(BYPASS_VERSION).zip
	unzip bypass-confgenerator-$(BYPASS_VERSION).zip

download: download_dns download_sskcp download_bypass 

# generate configuration from confinfo
