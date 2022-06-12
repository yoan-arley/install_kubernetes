#!/bin/bash

dir=/etc/hosts
c1=$(cat $dir | grep -oP "svlcmk8s01.[a-z]+.[a-z]+")
c2=$(cat $dir | grep -oP "svlcnk8s01.[a-z]+.[a-z]+")
c3=$(cat $dir | grep -oP "svlcnk8s02.[a-z]+.[a-z]+")

if [[ "$c1" == "svlcmk8s01.golden.lan" && "$c2" == "svlcnk8s01.golden.lan" && "$c3" == "svlcnk8s02.golden.lan" ]];
then
	echo "Hosts exists"
else
	$(echo "192.168.1.124   svlcmk8s01      svlcmk8s01.golden.lan" >> $dir)
	$(echo "192.168.1.125   svlcnk8s01      svlcnk8s01.golden.lan" >> $dir)
	$(echo "192.168.1.126   svlcnk8s02      svlcnk8s02.golden.lan" >> $dir)
fi
