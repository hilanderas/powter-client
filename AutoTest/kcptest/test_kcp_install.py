#!/usr/bin/env python

import sys
import unittest
sys.path.append( "%s/../basic" % sys.path[0] )
from basic import *

Powter_dir="%s/../.." % sys.path[0]

# Test IsInstalled
# 1.Config Files and Directories
#   True:   Exist( "/powter_data/kcplog" )
#   True:   Exist( "/powter_data/ss_kcp_client_conf" )
#
#   True:   Exist( "/powter_data/ss_kcp_client_conf/1060/config.json" )
#   True:   Equal( "/powter_data/ss_kcp_client_conf/1060/config.json", "client/kcp/kcp_config/config-1060.json" )
#
#   True:   Exist( "/powter_data/ss_kcp_client_conf/1070/config.json" )
#   True:   Eqaul( "/powter_data/ss_kcp_client_conf/1070/config.json", "client/kcp/kcp_config/config-1070.json" )
#
#   True:   Exist( "/powter_data/ss_kcp_client_conf/1080/config.json" )
#   True:   Eqaul( "/powter_data/ss_kcp_client_conf/1080/config.json", "client/kcp/kcp_config/config-1080.json" )
#
#   True:   Exist( "/powter_data/ss_kcp_client_conf/1090/config.json" )
#   True:   Eqaul( "/powter_data/ss_kcp_client_conf/1090/config.json", "client/kcp/kcp_config/config-1090.json" )
#
# 2.Docker Containers
#   Equal:  GetContainer( "router_kcp_1060" ), "Up" 
#   Equal:  GetContainer( "router_kcp_1070" ), "Up" 
#   Equal:  GetContainer( "router_kcp_1080" ), "Up" 
#   Equal:  GetContainer( "router_kcp_1090" ), "Up" 
#   
# 3.Netstat
#   In:     "ss-redir", GetNetstat( "1060" )
#   In:     "ss-redir", GetNetstat( "1070" )
#   In:     "ss-redir", GetNetstat( "1080" )
#   In:     "ss-redir", GetNetstat( "1090" )
#
#   In:     "pen", GetNetstat( "8386" )
#   In:     "pen", GetNetstat( "8387" )
#   In:     "pen", GetNetstat( "8388" )
#   In:     "pen", GetNetstat( "8389" )
#
#   In:     "client_linux_", GetNetstat( "2001" )
#   In:     "client_linux_", GetNetstat( "2002" )
#   In:     "client_linux_", GetNetstat( "2003" )
#   In:     "client_linux_", GetNetstat( "2004" )
#
#   In:     "client_linux_", GetNetstat( "2011" )
#   In:     "client_linux_", GetNetstat( "2012" )
#   In:     "client_linux_", GetNetstat( "2013" )
#   In:     "client_linux_", GetNetstat( "2014" )
#
#   In:     "client_linux_", GetNetstat( "3001" )
#   In:     "client_linux_", GetNetstat( "3002" )
#   In:     "client_linux_", GetNetstat( "3003" )
#   In:     "client_linux_", GetNetstat( "3004" )
#
#   In:     "client_linux_", GetNetstat( "3011" )
#   In:     "client_linux_", GetNetstat( "3012" )
#   In:     "client_linux_", GetNetstat( "3013" )
#   In:     "client_linux_", GetNetstat( "3014" )

class Test_Config_Files_and_Directories( unittest.TestCase ):
    '''
    Test config files and directories exist ,and equal with correct files
    '''
    def test_powter_data_kcplog( self ):
        '''
        Test directory(/powter_data/kcplog) exists 
        '''
        self.assertTrue( Exist( "/powter_data/kcplog" ) )
   
    def test_powter_data_ss_kcp_client_conf( self ):
        '''
        Test directory(/powter_data/ss_kcp_client_conf) exists
        '''
        self.assertTrue( Exist( "/powter_data/ss_kcp_client_conf" ) )

    def test_config_1060( self ):
        '''
        Test /powter_data/ss_kcp_client_conf/1060/config.json exists and equal with client/kcp/kcp_config/config-1060.json
        '''
        self.assertTrue( Exist( "/powter_data/ss_kcp_client_conf/1060/config.json" ) )
        self.assertTrue( Equal( "/powter_data/ss_kcp_client_conf/1060/config.json", "%s/client/kcp/kcp_config/config-1060.json" % Powter_dir ) )

    def test_config_1070( self ):
        '''
        Test /powter_data/ss_kcp_client_conf/1070/config.json exists and equal with client/kcp/kcp_config/config-1070.json
        '''
        self.assertTrue( Exist( "/powter_data/ss_kcp_client_conf/1070/config.json" ) )
        self.assertTrue( Equal( "/powter_data/ss_kcp_client_conf/1070/config.json", "%s/client/kcp/kcp_config/config-1070.json" % Powter_dir ) )

    def test_config_1080( self ):
        '''
        Test /powter_data/ss_kcp_client_conf/1080/config.json exists equal with client/kcp/kcp_config/config-1080.json
        '''
        self.assertTrue( Exist( "/powter_data/ss_kcp_client_conf/1080/config.json" ) )
        self.assertTrue( Equal( "/powter_data/ss_kcp_client_conf/1080/config.json", "%s/client/kcp/kcp_config/config-1080.json" % Powter_dir ) )

    def test_config_1090( self ):
        '''
        Test /powter_data/ss_kcp_client_conf/1090/config.json exists and equal with client/kcp/kcp_config/config-1090.json
        '''
        self.assertTrue( Exist( "/powter_data/ss_kcp_client_conf/1090/config.json" ) )
        self.assertTrue( Equal( "/powter_data/ss_kcp_client_conf/1090/config.json", "%s/client/kcp/kcp_config/config-1090.json" % Powter_dir ) )

class Test_Docker_Containers( unittest.TestCase ):
    '''
    Test whether docker container is up
    '''
    def test_router_kcp_1060( self ):
        '''
        Test container( router_kcp_1060 ) is up
        '''
        self.assertEqual( GetContainerStatus( "router_kcp_1060" ), "Up" )

    def test_router_kcp_1070( self ):
        '''
        Test container( router_kcp_1070 ) is up
        '''
        self.assertEqual( GetContainerStatus( "router_kcp_1070" ), "Up" )

    def test_router_kcp_1080( self ):
        '''
        Test container( router_kcp_1080 ) is up
        '''
        self.assertEqual( GetContainerStatus( "router_kcp_1080" ), "Up" )

    def test_router_kcp_1090( self ): 
        '''
        Test container( router_kcp_1090 ) is up
        '''
        self.assertEqual( GetContainerStatus( "router_kcp_1090" ), "Up" )
   
class Test_Netstat( unittest.TestCase ):
    '''
    Test whether netstat exist and correct
    '''
    def test_ss_redir( self ):
        '''
        Test shadowshocks redirect on 1060,1070,1080,1090
        '''
        self.assertIn( "ss-redir", GetNetstat( "1060" ) )
        self.assertIn( "ss-redir", GetNetstat( "1070" ) )
        self.assertIn( "ss-redir", GetNetstat( "1080" ) )
        self.assertIn( "ss-redir", GetNetstat( "1090" ) )

    def test_pen( self ):
        '''
        Test pen on 8386,8387,8388,8389
        '''
        self.assertIn( "pen", GetNetstat( "8386" ) )
        self.assertIn( "pen", GetNetstat( "8387" ) )
        self.assertIn( "pen", GetNetstat( "8388" ) )
        self.assertIn( "pen", GetNetstat( "8389" ) )

    def test_client_linux( self ):
        '''
        test kcp 2001-2004,2011-2014,3001-3004,3011-3014
        '''
        self.assertIn( "client_linux_", GetNetstat( "2001" ) )
        self.assertIn( "client_linux_", GetNetstat( "2002" ) )
        self.assertIn( "client_linux_", GetNetstat( "2003" ) )
        self.assertIn( "client_linux_", GetNetstat( "2004" ) )

        self.assertIn( "client_linux_", GetNetstat( "2011" ) )
        self.assertIn( "client_linux_", GetNetstat( "2012" ) )
        self.assertIn( "client_linux_", GetNetstat( "2013" ) )
        self.assertIn( "client_linux_", GetNetstat( "2014" ) )

        self.assertIn( "client_linux_", GetNetstat( "3001" ) )
        self.assertIn( "client_linux_", GetNetstat( "3002" ) )
        self.assertIn( "client_linux_", GetNetstat( "3003" ) )
        self.assertIn( "client_linux_", GetNetstat( "3004" ) )

        self.assertIn( "client_linux_", GetNetstat( "3011" ) )
        self.assertIn( "client_linux_", GetNetstat( "3012" ) )
        self.assertIn( "client_linux_", GetNetstat( "3013" ) )
        self.assertIn( "client_linux_", GetNetstat( "3014" ) )

if __name__ == '__main__':
    unittest.main()
    