#!/bin/bash
source lib.sh

gen_config $1 
ctl "test_state"
