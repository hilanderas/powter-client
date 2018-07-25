#!/usr/bin/env python 
import unittest
import os

import basic

WAN="enp2s0" 

class Test_Exist( unittest.TestCase ):
    """
    Test the function of File Exist
    """
    def setUp( self ):
        """
        Create a file called 'helloworld.txt' and a directory called 'testdir'
        """
        os.mknod( "helloworld.txt" )
        os.mkdir( "testdir" )

    def tearDown( self ):
        """
        Delete the file called 'helloworld.txt' and the directory called 'testdir'
        """
        os.remove( "helloworld.txt" )
        os.rmdir( "testdir" )

    def test_file_exist( self ):
        """
        Test existed file named 'helloworld.txt'
        """
        self.assertTrue( basic.Exist( "helloworld.txt" ) )

    def test_file_DOESNOT_exist( self ):
        """
        Test a file name "xxx", which does not exist
        """
        self.assertFalse( basic.Exist( "xxx" ) )

    def test_dir_exist( self ):
        """
        Test existed directory named 'testdir'
        """
        self.assertTrue( basic.Exist( "testdir" ) )

    def test_dir_DOESNOT_exist( self ):
        """
        Test a dir named 'notexistdir', which does not exist
        """
        self.assertFalse( basic.Exist( "notexistdir" ) )

class Test_Equal( unittest.TestCase ):
    """
    Test the function of two files equal    
    """
    def setUp( self ):
        """
        Creat three files: fileA.txt, fileB.txt, fileC.txt
        fileA.txt and fileB.txt are equal
        fileA.txt and fileC.txt are NOT equal
        """
        fA = open( "fileA.txt", "w" )
        fA.writelines( "Test if files are equal" )
        fA.close()

        fB = open( "fileB.txt", "w" )
        fB.writelines( "Test if files are equal" )
        fB.close()

        fC = open( "fileC.txt", "w" )
        fC.writelines( "Test if files are NOT equal" )
        fC.close()

    def tearDown( self ):
        """
        Delete three files: fileA.txt, fileB.txt, fileC.txt
        """
        os.remove( "fileA.txt" )
        os.remove( "fileB.txt" )
        os.remove( "fileC.txt" )

    def test_files_equal( self ):
        """
        Test fileA.txt and fileB.txt are equal
        """
        self.assertTrue( basic.Equal( "fileA.txt", "fileB.txt") )

    def test_files_DONOT_equal( self ):
        """
        Test fileA.txt and fileC.txt are not equal
        """
        self.assertFalse( basic.Equal( "fileA.txt", "fileC.txt" ) )

class Test_GetIP( unittest.TestCase ):
    """
    Test the function of getting [interface] IP
    """
    def setUp( self ):
        pass

    def tearDown( self ):
        pass

    def test_get_existed_interface_IP( self ):
        """
        Test get existed interface:docker0 ip
        """
        self.assertEqual( basic.GetIP( "docker0" ), "172.17.0.1" )
    
    def test_get_DOESNOT_existed_interface_IP( self ):
        """
        Test get interface:lalala ip, which doesn not exist
        """
        self.assertFalse( basic.GetIP( "lalala" ) )


class Test_GetMask( unittest.TestCase ):
    """
    Test the function of getting [interface] netmask
    """
    def setUp( self ):
        pass 

    def tearDown( self ):
        pass

    def test_existed_interface( self ):
        """
        Test existed interface:docker0 
        """
        self.assertEqual( basic.GetMask( "docker0" ), "255.255.0.0" )
    
    def test_DOESNOT_existed_interface( self ):
        """
        Test get interface:lalala netmask, which doesn not exist 
        """
        self.assertFalse( basic.GetMask( "lalala" ) )


class Test_GetServiceStatus( unittest.TestCase ):
    """
    Test the function of getting service status(active or not)
    """
    def setUp( self ):
        """

        """
        pass

    def tearDown( self ):
        """
        
        """
        pass

    def test_existed_service( self ):
        """
        test existed service named 'docker'
        """
        self.assertEqual( basic.GetServiceStatus( "docker" ), "active" )
    
    def test_NOT_existed_service( self ):
        """
        Test not existed service named 'notexistservice'
        """
        self.assertEqual( basic.GetServiceStatus( "notexistservice" ), "inactive" )

class Test_GetContainerStatus( unittest.TestCase ):
    """
    Test the function of getting container status
    """
    def setUp( self ):
        """
        run a container named 'testcontainer' using image 'busybox'
        """
        os.system( "docker run --name testcontainer -itd busybox" )

    def tearDown( self ):
        """
        remove the container named 'testcontainer'
        """
        os.system( "docker rm -f testcontainer" )
    def test_up_container( self ):
        """
        test the up contianer named 'testcontainer'
        """
        self.assertEqual( basic.GetContainerStatus( "testcontainer" ), "Up" )
    
    def test_NOT_exist_container( self ):
        """
        test not existed container named 'notexistcontainer'
        """
        self.assertNotEqual( basic.GetContainerStatus( "notexistcontainer" ), "Up" )

class Test_PutInSet( unittest.TestCase ):
    """
    Test the function of putinset
    """
    def setUp( self ):
        """
        """

    def tearDown( self ):
        """
        """

    def test_correct_format( self ):
        """
        test turn str1 to s
        """
        str1 = "a|b|c"
        s = ['a','b','c']
        self.assertEqual( basic.PutInSet( str1 ), s )
    
    def test_incorrect_format( self ):
        """
        test turn str2 to s
        """
        str1 = "a,b,c"
        s = ['a','b','c']
        self.assertNotEqual( basic.PutInSet( str1 ), s )

class Test_ResolveIP( unittest.TestCase ):
    """
    Test the function of resolving IP
    """
    def setUp( self ):
        """
        
        """

    def tearDown( self ):
        """
        
        """

    def test_resolve_exist_domain( self ):
        """
        test resolve existed domain called 'localhost' to 127.0.0.1
        """
        self.assertEqual( basic.ResolveIP( "localhost", "" ), "127.0.0.1|" )
    
    def test_resolve_notexist_domain( self ):
        """
        test resolve notexisted domain called 'notexistdomain' to none
        """
        self.assertFalse( basic.ResolveIP( "notexistdomain", "" ) )

class Test_CompareSet( unittest.TestCase ):
    """
    Test the function of comparing two set
    """
    def setUp( self ):
        """
        """

    def tearDown( self ):
        """
        """

    def test_setA_contains_setB( self ):
        """
        test whether A contains B
        """
        setA = ['a','b','c','1','2','3']
        setB = ['a','b','1','2']

        self.assertTrue( basic.CompareSet( setB, setA ) )
    
    def test_setB_contains_setA( self ):
        """
        test whether B contains A
        """
        setA = ['a','b','c','1','2','3']
        setB = ['a','b','1','2']

        self.assertFalse( basic.CompareSet( setA, setB) )

class Test_GetIptableRule( unittest.TestCase ):
    """
    Test the function of getting iptable rule
    """
    def setUp( self ):
        """
        create a iptable rule that reject icmp package 
        """
        os.system( "sudo iptables -t filter -I INPUT -p icmp -j REJECT" )

    def tearDown( self ):
        """
        delete the iptable rule
        """
        os.system( "sudo iptables -t filter -D INPUT 1" )

    def test_exist_iptable_rule( self ):
        """
        test table filter chain INPUT grep icmp
        """
        self.assertIn( "REJECT", basic.GetIptableRule( "filter", "INPUT", "icmp" ) )
        self.assertIn( "reject-with icmp-port-unreachable", basic.GetIptableRule( "filter", "INPUT", "icmp" ) )    

class Test_GetNetstat( unittest.TestCase ):
    '''
    Test the function of getting Netstat status
    '''
    def setUp( self ):
        pass
    
    def tearDown( self ):
        pass

    def test_existed_netstat_rule( self ):
        '''
        test sshd have port 22
        '''
        self.assertIn( ":22", basic.GetNetstat( "sshd" ) )

class Test_GetTCRule( unittest.TestCase ):
    '''
    Test the function of showing tc rules
    '''
    def setUp(self):
        os.system( "sudo tc qdisc add dev %s root handle 1: htb" % WAN )
    
    def tearDown(self):
        os.system( "sudo tc qdisc del dev %s root" % WAN )

    def test_exist_tc_rule(self):
        '''
        test tc qdisc[qdisc] dev[WAN] grep[root] contains [htb 1:]
        '''
        self.assertIn( "htb 1:", basic.GetTCRule( "qdisc", WAN, "root" ) )

    def test_NOT_exist_tc_rule(self):
        '''
        test tc rule with ircorrect parameters
        '''
        self.assertNotIn( "lalala", basic.GetTCRule( "qdisc", WAN, "root" ) )
        self.assertNotIn( "htb 1:", basic.GetTCRule( "lalala", WAN, "root" ) )
        self.assertNotIn( "htb 1:", basic.GetTCRule( "qdisc", "lalala", "root" ) )
        self.assertNotIn( "htb 1:", basic.GetTCRule( "qdisc", WAN, "lalala" ) )
        

if __name__ == '__main__':
    unittest.main()
