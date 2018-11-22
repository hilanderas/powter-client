#!/bin/bash
source lib.sh
source get_vpsip.sh

sleep 10
netflow "${VPS_SERVER[@]}"
confirm
