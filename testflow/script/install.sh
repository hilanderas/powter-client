#!/bin/bash
source lib.sh

ctl_info install $1
ctl "test_state"
