#!/bin/bash
source lib.sh
source get_vpsip.sh

netflow "${VPS_SERVER[@]}"
