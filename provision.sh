#!/bin/bash
mkdir -p logs
HOMEBREW_CASK_OPTS="--appdir=/Applications" \
 ansible-playbook -i ./hosts -vv mac.yaml \
| tee logs/$0_$(date '+%Y%m%d%H%M%S').log
