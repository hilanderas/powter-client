#!/usr/bin/env python

import sys
import unittest
sys.path.append( "%s/../basic/" % sys.path[0] )
from basic import *

Powter_dir="%s/../.." % sys.path[0]

# Test bypass status on isinstalled
#
# 1.Config Files and Directories
#   True:   Exist( "/powter_data/bypass_conf" ) 
#   
#   True:   Exist( "/powter_data/bypass_conf/01-inner" )
#   True:   Equal( "/powter_data/bypass_conf/01-inner", "client/bypass/bypass_config/white/01-inner" )
#
#   True:   Exist( "/powter_data/bypass_conf/02-vps" )
#   True:   Equal( "/powter_data/bypass_conf/02-vps", "client/bypass/bypass_config/white/02-vps" )
#
#   True:   Exist( "/powter_data/bypass_conf/03-cn" )
#   True:   Equal( "/powter_data/bypass_conf/03-cn", "client/bypass/bypass_config/white/03-cn" )
#
# 2.Docker Container
#   Equal:  GetContainerStatus( "router_bypass" ), "Up" 
#
# 3.Ipset
#   Equal:  GetIPsetName( "01-inner" ), "Name: /bypass/01-inner"
#   Equal:  GetIPsetName( "02-vps" ), "Name: /bypass/02-vps"
#   Equal:  GetIPsetName( "03-cn" ), "Name: /bypass/03-cn"
#
# 4.Iptable Rules
#   In:     "match-set", GetIptableRule( "nat", "BYPASS", "/bypass/01-inner" ) 
#   In:     "match-set", GetIptableRule( "nat", "BYPASS", "/bypass/02-vps" ) 
#   In:     "match-set", GetIptableRule( "nat", "BYPASS", "/bypass/03-cn" ) 
#
#   In:     "statistic mode random probability 0.25000000000 redir ports 1060", GetIptableRule( "nat", "BYPASS", "1060" ) 
#   In:     "statistic mode random probability 0.33000000007 redir ports 1070", GetIptableRule( "nat", "BYPASS", "1070" ) 
#   In:     "statistic mode random probability 0.50000000000 redir ports 1080", GetIptableRule( "nat", "BYPASS", "1080" ) 
#   In:     "statistic mode random probability 1.00000000000 redir ports 1090", GetIptableRule( "nat", "BYPASS", "1090" ) 

class Test_Config_Files_and_Directories( unittest.TestCase ):
    '''
    Test Config Files and Directories
    '''
    def test_bypass_conf_dir( self ):
        '''
        Test whether dir bypass_conf exists
        '''
        self.assertTrue( Exist( "/powter_data/bypass_conf" ) )

    def test_01_inner( self ):
        '''
        Test whether /powter_data/bypass_conf/01-inner exists and equal with client/bypass/bypass_config/white/01-inner
        '''
        self.assertTrue( Exist( "/powter_data/bypass_conf/01-inner" ) )
        self.assertTrue( Equal( "/powter_data/bypass_conf/01-inner", "%s/client/bypass/bypass_config/white/01-inner" % Powter_dir ) )

    def test_02_vps( self ):
        '''
        Test whether /powter_data/bypass_conf/02-vps exists and equal with client/bypass/bypass_config/white/02-vps
        '''
        self.assertTrue( Exist( "/powter_data/bypass_conf/02-vps" ) )
        self.assertTrue( Equal( "/powter_data/bypass_conf/02-vps", "%s/client/bypass/bypass_config/white/02-vps" % Powter_dir) )

    def test_03_cn( self ):
        '''
        Test whether /powter_data/bypass_conf/03-cn exists and equal with client/bypass/bypass_config/white/03-cn
        '''
        self.assertTrue( Exist( "/powter_data/bypass_conf/03-cn" ) )
        self.assertTrue( Equal( "/powter_data/bypass_conf/03-cn", "%s/client/bypass/bypass_config/white/03-cn" % Powter_dir) )

    
class Test_Docker_Container( unittest.TestCase ):
    '''
    Test Docker Container
    '''
    def test_container_router_bypass( self ):
        '''
        Test whether container router_bypass is up
        '''
        self.assertEqual( GetContainerStatus( "router_bypass" ), "Up" )

class IPset( unittest.TestCase ):
    '''
    Test IP set
    '''
    def test_IPset_name( self ):
        '''
        Test whether ipset is ready
        '''
        self.assertEqual( GetIPset( "01-inner" ), "Name: /bypass/01-inner")
        self.assertEqual( GetIPset( "02-vps" ), "Name: /bypass/02-vps" )
        self.assertEqual( GetIPset( "03-cn" ), "Name: /bypass/03-cn" )


class Iptable_Rules( unittest.TestCase ):
    '''
    Test Iptables Rules
    '''
    def test_match_set( self ):
        '''
        Test seven ipset rule
        '''
        self.assertIn( "match-set", GetIptableRule( "nat", "BYPASS", "/bypass/01-inner" ) )
        self.assertIn( "match-set", GetIptableRule( "nat", "BYPASS", "/bypass/02-vps" ) )
        self.assertIn( "match-set", GetIptableRule( "nat", "BYPASS", "/bypass/03-cn" ) )

    
    def test_probability_redir_port( self ):
        '''
        Test probability redirect ports 1060 1070 1080 1090
        '''
        self.assertIn( "statistic mode random probability 0.25000000000 redir ports 1060", GetIptableRule( "nat", "BYPASS", "1060" ) )
        self.assertIn( "statistic mode random probability 0.33000000007 redir ports 1070", GetIptableRule( "nat", "BYPASS", "1070" ) )
        self.assertIn( "statistic mode random probability 0.50000000000 redir ports 1080", GetIptableRule( "nat", "BYPASS", "1080" ) )
        self.assertIn( "statistic mode random probability 1.00000000000 redir ports 1090", GetIptableRule( "nat", "BYPASS", "1090" ) )


if __name__ == '__main__':
    unittest.main()

