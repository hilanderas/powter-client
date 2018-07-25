#!/usr/bin/env python

import sys
import unittest
sys.path.append( "%s/../basic" % sys.path[0] )
from basic import *

Powter_dir="%s/../.." % sys.path[0]

# Test IsInstalled
# 1.Config Files and Directories
#   False:      Exist( "/powter_data/kcplog" )
#   False:      Exist( "/powter_data/ss_kcp_client_conf" )
#   False:      Exist( "client/kcp/kcp_config" )
#
# 2.Docker Containers
#   NotEqual:   GetContainerStatus( "router_kcp_1060" ), "Up" 
#   NotEqual:   GetContainerStatus( "router_kcp_1070" ), "Up" 
#   NOtEqual:   GetContainerStatus( "router_kcp_1080" ), "Up" 
#   NOtEqual:   GetContainerStatus( "router_kcp_1090" ), "Up" 
#   
# 3.Netstat
#   NotIn:      "ss-redir", GetNetstat( "1060" )
#   NOtIn:      "ss-redir", GetNetstat( "1070" )
#   NotIn:      "ss-redir", GetNetstat( "1080" )
#   NotIn:      "ss-redir", GetNetstat( "1090" )
#
#   NotIn:      "pen", GetNetstat( "8386" )
#   NotIn:      "pen", GetNetstat( "8387" )
#   NotIn:      "pen", GetNetstat( "8388" )
#   NotIn:      "pen", GetNetstat( "8389" )
#
#   NotIn:      "client_linux_", GetNetstat( "2001" )
#   NotIn:      "client_linux_", GetNetstat( "2002" )
#   NotIn:      "client_linux_", GetNetstat( "2003" )
#   NotIn:      "client_linux_", GetNetstat( "2004" )
#
#   NotIn:      "client_linux_", GetNetstat( "2011" )
#   NotIn:      "client_linux_", GetNetstat( "2012" )
#   NotIn:      "client_linux_", GetNetstat( "2013" )
#   NotIn:      "client_linux_", GetNetstat( "2014" )
#
#   NotIn:      "client_linux_", GetNetstat( "3001" )
#   NotIn:      "client_linux_", GetNetstat( "3002" )
#   NotIn:      "client_linux_", GetNetstat( "3003" )
#   NotIn:      "client_linux_", GetNetstat( "3004" )
#
#   NotIn:      "client_linux_", GetNetstat( "3011" )
#   NotIn:      "client_linux_", GetNetstat( "3012" )
#   NotIn:      "client_linux_", GetNetstat( "3013" )
#   NotIn:      "client_linux_", GetNetstat( "3014" )

class Test_Config_Files_and_Directories( unittest.TestCase ):
    '''
    Test config files and directories exist ,and equal with correct files
    '''
    def test_powter_data_kcplog( self ):
        '''
        Test directory(/powter_data/kcplog) not exists 
        '''
        self.assertFalse( Exist( "/powter_data/kcplog" ) )
   
    def test_powter_data_ss_kcp_client_conf( self ):
        '''
        Test directory(/powter_data/ss_kcp_client_conf) not exists 
        '''
        self.assertFalse( Exist( "/powter_data/ss_kcp_client_conf" ) )

    def test_client_kcp_kcp_config_dir( self ):
        '''
        Test directory( client/kcp/kcp_config ) not exist
        '''
        self.assertFalse( Exist( "%s/client/kcp/kcp_config" % Powter_dir ) )

class Test_Docker_Containers( unittest.TestCase ):
    '''
    Test whether docker container is not up
    '''
    def test_router_kcp_1060( self ):
        '''
        Test container(router_kcp_1060) not up
        '''
        self.assertNotEqual( GetContainerStatus( "router_kcp_1060" ), "Up" )

    def test_router_kcp_1070( self ):
        '''
        Test container(router_kcp_1070) not up
        '''
        self.assertNotEqual( GetContainerStatus( "router_kcp_1070" ), "Up" )

    def test_router_kcp_1080( self ):
        '''
        Test container(router_kcp_1080) not up
        '''
        self.assertNotEqual( GetContainerStatus( "router_kcp_1080" ), "Up" )

    def test_router_kcp_1090( self ): 
        '''
        Test container(router_kcp_1090) not up
        '''
        self.assertNotEqual( GetContainerStatus( "router_kcp_1090" ), "Up" )
   
class Test_Netstat( unittest.TestCase ):
    '''
    Test whether netstat exist and correct
    '''
    def test_ss_redir( self ):
        self.assertNotIn( "ss-redir", GetNetstat( "1060" ) )
        self.assertNotIn( "ss-redir", GetNetstat( "1070" ) )
        self.assertNotIn( "ss-redir", GetNetstat( "1080" ) )
        self.assertNotIn( "ss-redir", GetNetstat( "1090" ) )

    def test_pen( self ):
        self.assertNotIn( "pen", GetNetstat( "8386" ) )
        self.assertNotIn( "pen", GetNetstat( "8387" ) )
        self.assertNotIn( "pen", GetNetstat( "8388" ) )
        self.assertNotIn( "pen", GetNetstat( "8389" ) )

    def test_client_linux( self ):
        self.assertNotIn( "client_linux_", GetNetstat( "2001" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "2002" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "2003" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "2004" ) )

        self.assertNotIn( "client_linux_", GetNetstat( "2011" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "2012" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "2013" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "2014" ) )

        self.assertNotIn( "client_linux_", GetNetstat( "3001" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "3002" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "3003" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "3004" ) )

        self.assertNotIn( "client_linux_", GetNetstat( "3011" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "3012" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "3013" ) )
        self.assertNotIn( "client_linux_", GetNetstat( "3014" ) )

if __name__ == '__main__':
    unittest.main()
        