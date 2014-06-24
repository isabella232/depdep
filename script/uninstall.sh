#!/bin/bash

tika_dir="/opt/tika"
etc_dir="/etc/init.d"
depdep_dir="/usr/local/depdep"

for dir in $depdep_dir $etc_dir $tika_dir
do
	rm -rf $dir
done
