#!/usr/bin/python

import sys
import unittest
# add medule basic path to default
sys.path.append( '%s/../basic/' % sys.path[0] )
from basic import *

Powter_dir="%s/../.." % sys.path[0]

# Test DNS Is Installed
#
# 1.Config Files and Directories
#       Ture:   Exist( /powter_data/dnsmasq_conf )
#
#       Ture:   Exist( /powter_data/dnsmasq_conf/dnsmasq )
#       Ture:   Exist( /powter_data/dnsmasq_conf/dnsmasq/dnsmasq.conf )
#       Ture:   Equal( /powter_data/dnsmasq_conf/dnsmasq/dnsmasq.conf, client/dns/dns_config/dnsmasq/dnsmasq.conf )
#
#       Ture:   Exist( /powter_data/dnsmasq_conf/dnsmasq.d )
#       Ture:   Exist( /powter_data/dnsmasq_conf/dnsmasq.d/accelerated-domains.china.conf )
#       Ture:   Equal( /powter_data/dnsmasq_conf/dnsmasq.d/accelerated-domains.china.conf, client/dns/dns_config/dnsmasq.d/accelerated-domains.china.conf )
#
#       Ture:   Exist( /powter_data/dnsmasq_conf/dnsmasq.d/inner-domain.conf )
#       Ture:   Equal( /powter_data/dnsmasq_conf/dnsmasq.d/inner-domain.conf, client/dns/dns_config/dnsmasq.d/inner-domain.conf )
#
#       Ture:   Exist( /powter_data/dnsmasq_conf/dnsmasq.d/static-hosts.conf )
#       Ture:   Equal( /powter_data/dnsmasq_conf/dnsmasq.d/static-hosts.conf, client/dns/dns_config/dnsmasq.d/static-hosts.conf )
#
#       Ture:   Exist( /powter_data/dnsmasq_conf/dnsmasq.d/dns-server.conf )
#       Ture:   Equal( /powter_data/dnsmasq_conf/dnsmasq.d/dns-server.conf, client/dns/dns_config/dnsmasq.d/dns-server.conf )
#
# 2.Docker Container      
#       Equal:  GetContainerStatus( 'router_dnsmasq' ), 'Up' 
#


class Test_Config_Files_and_Directories(unittest.TestCase):
    '''
    Test Config Files and Directories exist and equal
    '''
    def test_powter_data_dnsmasq_conf_dir(self):
        '''
        Test directory(/powter_data/dnsmasq_conf) exists
        '''
        self.assertTrue( Exist( '/powter_data/dnsmasq_conf' ) )

    def test_powter_data_dnsmasq_conf_dnsmasq_dir(self):
        '''
        Test directory(/powter_data/dnsmasq_conf/dnsmasq) exists
        '''
        self.assertTrue( Exist( '/powter_data/dnsmasq_conf/dnsmasq' ) )

    def test_powter_data_dnsmasq_conf_dnsmasq_dnsmasq_conf(self):
        '''
        Test file(/powter_data/dnsmasq_conf/dnsmasq/dnsmasq.conf) exists 
        equal with file(client/dns/dns_config/dnsmasq/dnsmasq.conf)
        '''
        self.assertTrue( Exist( '/powter_data/dnsmasq_conf/dnsmasq/dnsmasq.conf' ) )
        self.assertTrue( Equal( '/powter_data/dnsmasq_conf/dnsmasq/dnsmasq.conf', '%s/client/dns/dns_config/dnsmasq/dnsmasq.conf' % Powter_dir ) )

    def test_powter_data_dnsmasq_conf_dnsmasq_d_dir(self):
        '''
        Test directory(/powter_data/dnsmasq_conf/dnsmasq.d) exists
        '''
        self.assertTrue( Exist( '/powter_data/dnsmasq_conf/dnsmasq.d' ) )

    def test_powter_data_dnsmasq_conf_dnsmasq_d_accelerated_domains_china_conf(self):
        '''
        Test file(/powter_data/dnsmasq_conf/dnsmasq.d/accelerated-domains.china.conf) exists 
        equal with file(client/dns/dnsmasq.d/accelerated-domains.china.conf)
        '''
        self.assertTrue( Exist( '/powter_data/dnsmasq_conf/dnsmasq.d/accelerated-domains.china.conf' ) )
        self.assertTrue( Equal( '/powter_data/dnsmasq_conf/dnsmasq.d/accelerated-domains.china.conf', '%s/client/dns/dns_config/dnsmasq.d/accelerated-domains.china.conf' % Powter_dir ) )

    def test_powter_data_dnsmasq_conf_dnsmasq_d_inner_domain_conf(self):
        '''
        Test file(/powter_data/dnsmasq_conf/dnsmasq.d/inner-domain.conf) exists
        equal with file(client/dns/dns_config/dnsmasq.d/inner-domain.conf)
        '''
        self.assertTrue( Exist( '/powter_data/dnsmasq_conf/dnsmasq.d/inner-domain.conf' ) )
        self.assertTrue( Equal( '/powter_data/dnsmasq_conf/dnsmasq.d/inner-domain.conf', '%s/client/dns/dns_config/dnsmasq.d/inner-domain.conf' % Powter_dir ) )

    def test_powter_data_dnsmasq_conf_dnsmasq_d_static_hosts_conf(self):
        '''
        Test file(/powter_data/dnsmasq_conf/dnsmasq.d/static-hosts.conf) exists 
        equal with file(client/dns/dns_config/dnsmasq.d/static-hosts.conf)
        '''
        self.assertTrue( Exist( '/powter_data/dnsmasq_conf/dnsmasq.d/static-hosts.conf' ) )
        self.assertTrue( Equal( '/powter_data/dnsmasq_conf/dnsmasq.d/static-hosts.conf', '%s/client/dns/dns_config/dnsmasq.d/static-hosts.conf' % Powter_dir ) )

    def test_powter_data_dnsmasq_conf_dnsmasq_d_dns_server_conf(self):
        '''
        Test file(/powter_data/dnsmasq_conf/dnsmasq.d/dns-server.conf) exists 
        equal with file(client/dns/dns_config/dnsmasq.d/dns-server.conf)
        '''
        self.assertTrue( Exist( '/powter_data/dnsmasq_conf/dnsmasq.d/dns-server.conf' ) )
        self.assertTrue( Equal( '/powter_data/dnsmasq_conf/dnsmasq.d/dns-server.conf', '%s/client/dns/dns_config/dnsmasq.d/dns-server.conf' % Powter_dir ) )


class Test_Docker_Container_Status(unittest.TestCase):
    '''
    Test docker container status
    '''
    def test_router_dnsmasq_status(self):
        '''
        Test container( router_dnsmasq )is up
        '''
        self.assertEqual( GetContainerStatus( 'router_dnsmasq' ), 'Up' ) 


if __name__ == '__main__':
    unittest.main()
