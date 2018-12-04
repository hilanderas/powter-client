#!/bin/bash
source lib.sh

update $1
ctl "test_state"
