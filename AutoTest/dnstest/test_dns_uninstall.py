#!/usr/bin/python
import sys
import unittest
# add medule basic path to default
sys.path.append( '%s/../basic/' % sys.path[0] )
from basic import *

Powter_dir="%s/../.." % sys.path[0]

# Test Is DNS Uninstalled
#
# 1.Config Files and Directories
#       False:  Exist( /powter_data/dnsmasq_conf )
#       False:  Exist( client/dns/dns_config )
#
# 2.Docker Container      
#       NotEqual:  ContainerStatus( 'router_dnsmasq' ), 'Up' 
#


class Test_Config_Files_and_Directories( unittest.TestCase ):
    '''
    Test Config Files and Directories exist and equal
    '''
    def test_powter_data_dnsmasq_conf_dir(self):
        '''
        Test directory( /powter_data/dnsmasq_conf ) not exists
        '''
        self.assertFalse( Exist( '/powter_data/dnsmasq_conf' ) )

    def test_dns_dns_config_dir(self):
        '''
        Test directory( client/dns/dns_config ) not exists
        '''
        self.assertFalse( Exist( '%s/client/dns/dns_config' % Powter_dir ) )

class Test_Docker_Container( unittest.TestCase ):
    '''
    Test docker container status
    '''
    def test_router_dnsmasq_status(self):
        '''
        Test container( router_dnsmasq ) is NOT up'''
        self.assertNotEqual( GetContainerStatus( 'router_dnsmasq' ), 'Up' )


if __name__ == '__main__':
    unittest.main()


