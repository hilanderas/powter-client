#!/usr/bin/python

import os
import filecmp

def Exist( name ):
    '''
    test whether [name](file or directory) exist
    '''
    return os.path.exists( name )

def Equal( fileA,fileB ):
    '''
    test whether [fileA] and [fileB] are equal
    '''
    return filecmp.cmp( fileA, fileB )

def GetIP( interface ):
    '''
    get [interface] IP
    '''
    IP = os.popen("ifconfig %s | grep inet | head -n 1 | awk -F ':' '{print $2}' | awk '{print $1}'" % (interface) ).read().replace('\n','')
    return IP

def GetMask( interface ):
    '''
    get [interface] Netmask
    '''
    Mask = os.popen("ifconfig %s | grep inet | head -n 1 | awk '{print $4}' | awk -F ':' '{print $2}'" % (interface) ).read().replace('\n','')
    return Mask

def GetServiceStatus( servicename ):
    '''
    get [servicename] status ( active or not )
    '''
    service_status = os.popen("systemctl status %s | grep Active | awk '{print $2}'" % (servicename) ).read().replace('\n','')
    return service_status

def GetContainerStatus( containername ):
    '''
    get [containername] status ( up or not )
    '''
    container_status = os.popen("docker ps -a | grep %s | awk -F 'ago' '{print $2}' | awk '{print $1}'" % ( containername ) ).read().replace('\n','')
    return container_status

def GetIptableRule( table, chain, grep ):
    '''
    get iptable rule in [table] [chain] and [grep]
    '''
    rule = os.popen( "sudo iptables -t %s -L %s -nv | grep %s " % ( table, chain, grep ) ).read().replace('\n','')
    return rule

def ResolveIP( domain, dnsserver ):
    '''
    resolve [domain] to ip using [dnsserver]
    '''
    ResolveIP = os.popen("nslookup %s %s | grep Address | sed '1d' |awk '{print $2}'" % ( domain, dnsserver ) ).read().replace('\n','|')
    return ResolveIP

def PutInSet( element ):
    '''
    put element in a set , and element format is (a|b|c), return set
    '''
    setname = element.split('|')
    return setname

def CompareSet( setA, setB):
    '''
    check whether setB contains setA
    '''
    return set(setB) > set(setA)

def GetIPset( grep ):
    '''
    list ipset and grep [grep]
    '''
    ipset = os.popen( "sudo ipset list | grep %s" % grep ).read().replace( "\n", "" )
    return ipset

def GetNetstat( grep ):
    '''
    list netstat and grep [grep]
    '''
    netstat = os.popen( "sudo netstat -tunlp | grep %s" % grep ).read().replace( "\n", "" ) 
    return netstat

def GetTCRule( qdisc, dev, grep ):
    '''
    tc [qdisc] show dev [dev] | grep [grep]
    '''
    tc_rule = os.popen( "tc %s show dev %s | grep %s" % ( qdisc, dev, grep ) ).read().replace( "\n", "" )
    return tc_rule