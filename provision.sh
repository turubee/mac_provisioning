#!/bin/bash
mkdir -p logs
ansible-playbook -i "localhost," mac.yaml --diff | tee logs/$0_$(date '+%Y%m%d%H%M%S').log
