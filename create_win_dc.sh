#!/bin/bash

if [ "x$1" == "x" ]; then
    echo "$0 <playbook.yml>"
    exit
fi

settings=$1
export DATETIME=`date +%Y%m%d%H%M%S`

time ansible-playbook -vvv -i hosts ./immortal_vpc.yml -e @key.yml -e @$settings;
#time ansible-playbook -vvv -i localhost, ./immortal_vpc.yml -e @key.yml -e @$settings;
#time ansible-playbook -vvv ./immortal_vpc.yml -e @key.yml -e @$settings;
echo $'\a'

time ansible-playbook -vvv -i hosts ./immortal_windows_dc.yml -e @key.yml -e @$settings ; date;
echo $'\a'; sleep 1
echo $'\a'; sleep 1
echo $'\a'; sleep 1
