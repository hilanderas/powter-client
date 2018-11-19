#!/bin/bash
source ../script/lib.sh
source get_vpsip.sh

netflow "${VPS_SERVER[@]}"
