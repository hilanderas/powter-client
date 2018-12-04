#!/bin/bash

source lib.sh

ctl "restart" $1
ctl "test_state"
