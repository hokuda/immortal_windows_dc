#!/bin/bash

settings=$1

time ansible-playbook -v -i hosts ./immortal_vpc.yml -e @$settings;
echo $'\a'

time ansible-playbook -v -i hosts ./immortal_windows_dc.yml -e @$settings ; date;
echo $'\a'
