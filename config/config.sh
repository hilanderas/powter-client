#!/bin/bash

# This script helps you set the basic configuration.
ss_kcp_json="vps.json"
dns_json="dnsserver.json"
bypass_dir="bypass_config"


# Get the configuration we need in json
function get_json_value() {
    key="$1"
    json_file="$2"

    value=`jq -r $key $json_file`
    echo $value
}

# Get the content of file
function check_file() {
    file="$1"
    echo "$file : "
    cat $file
}

# bypass configuration
# 1. add vps ip to 02-vps
function Config_bypass() {
    json="$1"
    ss_kcp_config="$bypass_dir/white/02-vps"
    IP_set=`get_json_value .[].IP $json` 
    
    echo "Insert the ip below into $ss_kcp_config"
    
    for ip in $IP_set 
    do
        # the ip for the bypass need netmask on the end.
        ip_bp="$ip/32"
        echo $ip_bp
        echo $ip_bp >> $ss_kcp_config
    done
}
#Config_bypass vps.json

# dns configuration
# 1. add [VPS-IP]#[dns-port] to dns-server.conf
function Condig_dns() {
    dns_file="$1"
    dns_config="dns_config/dnsmasq.d/dns-server.conf"
    dns_set=`get_json_value "keys[]" $dns_file`
    
    echo "Insert the dns server port below into $dns_config"
    
    for dns in $dns_set
    do
        ip=`get_json_value .$dns.IP $dns_file`
        port_set=`get_json_value .$dns.PORT[] $dns_file`
        for port in $port_set
        do
            echo "server=$ip#$port"
            echo "server=$ip#$port" >> $dns_config
        done
    done
}
#Condig_dns dnsserver.json

# ss pen and kcp configuration
# 1. replace    
#       Group1_VPS1:Port1   Group1_VPS2:Port1   Group2_VPS1:Port1   Group2_VPS2:Port1
#       Group1_VPS1:Port2   Group1_VPS2:Port2   Group2_VPS1:Port2   Group2_VPS2:Port2
#       Group1_VPS1:Port3   Group1_VPS2:Port3   Group2_VPS1:Port3   Group2_VPS2:Port3
#       Group1_VPS1:Port4   Group1_VPS2:Port4   Group2_VPS1:Port4   Group2_VPS2:Port4
#
# 2. replace
#       kcp_key_111         kcp_key_112         kcp_key_113         kcp_key_114
#       kcp_key_121         kcp_key_122         kcp_key_123         kcp_key_124
#       kcp_key_211         kcp_key_212         kcp_key_213         kcp_key_214
#       kcp_key_221         kcp_key_222         kcp_key_223         kcp_key_224
#
# 3. replace
#       ss_key_string1
#       ss_key_string2
#       ss_key_string3
#       ss_key_string4

function replace_keyword() {
    file="$1"
    key="$2"
    value="$3"

    echo "In file $file : $key >>>> $value"
    sed -i "s/$key/$value/g" $file
}

function Config_kcp() {
    ss_kcp_json="$1"
    ss_kcp_config="kcp_config/*"

    GVP_list=`echo {1..2}{1..2}{1..4}` # GVP means the num of group, vps and port. 
    
    for GVP in $GVP_list
    do 
        G="${GVP:0:1}"
        V="${GVP:1:1}"
        P="${GVP:2:1}"

        Group_VPS="Group${G}_VPS${V}"
        Port="Port${P}"
        echo "Config the $Group_VPS 's $Port"

        # get the IP, port, kk(kcp_key), sk(ss_key)
        IP=`get_json_value ".${Group_VPS}.IP" $ss_kcp_json`
        port=`get_json_value ".${Group_VPS}.${Port}.port" $ss_kcp_json`
        kk=`get_json_value ".${Group_VPS}.${Port}.kcp_key" $ss_kcp_json`
        sk=`get_json_value ".${Group_VPS}.ss_key" $ss_kcp_json`
        
        replace_keyword "$ss_kcp_config" "$Group_VPS:$Port" "$IP:$port"
        replace_keyword "$ss_kcp_config" "kcp_key_${G}${V}${P}" "$kk"
        replace_keyword "$ss_kcp_config" "ss_key_string" "$sk"
    done
}

Config_bypass "$dns_json"
Config_bypass "$ss_kcp_json" 
Condig_dns "$dns_json"
Config_kcp "$ss_kcp_json"