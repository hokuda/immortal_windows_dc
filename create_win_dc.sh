#!/bin/bash

settings=$1
export DATETIME=`date +%Y%m%d%H%M%S`

time ansible-playbook -v -i hosts ./immortal_vpc.yml -e @key.yml -e @$settings;
echo $'\a'

time ansible-playbook -vvv -i hosts ./immortal_windows_dc.yml -e @key.yml -e @$settings ; date;
echo $'\a'
