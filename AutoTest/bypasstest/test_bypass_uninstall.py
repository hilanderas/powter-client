#!/usr/bin/env python

import sys
import unittest
sys.path.append( "%s/../basic/" % sys.path[0] )
from basic import *

Powter_dir="%s/../.." % sys.path[0]

# Test bypass status on isinstalled
#
# 1.Config Files and Directories
#   False:  Exist( "/powter_data/bypass_conf" ) 
#   Flase:  Exist( "client/bypass/bypass_config" )
#
# 2.Docker Container
#   NotEqual:  GetContainerStatus( "router_bypass" ), "Up" 
#
# 3.Ipset
#   NotEqual:  GetIPset( "01-inner" ), "Name: /bypass/01-inner"
#   NotEqual:  GetIPset( "02-vps" ), "Name: /bypass/02-vps"
#   NotEqual:  GetIPset( "03-cn" ), "Name: /bypass/03-cn"
#
# 4.Iptable Rules
#   In:     "BYPASS", GetIptableRule( "nat", "PREROUTING", "br0" )
#   In:     "iptables: No chain/target/match by that name.", GetIptableRule( "nat", "BYPASS", "" ) 

class Test_Config_Files_and_Directories( unittest.TestCase ):
    def test_powter_data_bypass_conf_dir( self ):
        '''
        Test whether /powter_data/bypass_conf exists
        '''
        self.assertFalse( Exist( "/powter_data/bypass_conf" ) )

    def test_bypass_config_dir(self):
        '''
        Test whether Powter-Client/client/bypass/bypass_config exists
        '''
        self.assertFalse( Exist( "%s/client/bypass/bypass_config" % Powter_dir ) )

class Test_Docker_Container( unittest.TestCase ):
    def test_container_router_bypass( self ):
        '''
        Test container router_bypass
        '''
        self.assertNotEqual( GetContainerStatus( "router_bypass" ), "Up" )

class Test_Ipset( unittest.TestCase ):
    def test_ipset_name( self ):
        '''
        Test ipset name
        '''
        self.assertNotEqual( GetIPset( "01-inner" ), "Name: /bypass/01-inner" )
        self.assertNotEqual( GetIPset( "02-vps" ), "Name: /bypass/02-vps" )
        self.assertNotEqual( GetIPset( "03-cn" ), "Name: /bypass/03-cn" )


class Test_Iptable_Rules( unittest.TestCase ):
    def test_BYPASS_chain( self ):
        '''
        Test iptable rules
        '''
        self.assertNotIn( "BYPASS", GetIptableRule( "nat", "PREROUTING", "br0" ) )
        self.assertNotIn( "RETURN", GetIptableRule( "nat", "BYPASS", "match-set" ) )
        self.assertNotIn( "REDIRECT", GetIptableRule( "nat", "BYPASS", "ports" ) )


if __name__ == '__main__':
    unittest.main()


