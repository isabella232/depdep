#!/bin/bash
## Install  DepDep ...

tika_url="http://central.maven.org/maven2/org/apache/tika/tika-server/1.5/tika-server-1.5.jar"
tika_sh_url="https://raw.githubusercontent.com/galkan/depdep/master/script/tika.sh"
depdep_dir="/usr/local/depdep"
depdep_path="/usr/local/depdep/depdep.py"
tika_dir="/opt/tika"
tika_sh="tika.sh"
etc_dir="/etc/init.d"

current_dir="`pwd`"

if [ ! $# -eq 1 ]
then
	echo "Usage: $0 <archassault|kali>"
	exit 1
fi


distro="$1"
echo $distro | grep -Eq "^kali$|^archassault$"

if [ ! $? -eq 0 ]
then
	echo "Usage: $0 <archassault|kali>"
	exit 1
fi

for dir in $depdep_dir $tika_dir $etc_dir
do
	if [ ! -d "$dir" ]
	then
        	mkdir $dir
	fi
done


cd $tika_dir
wget --quiet --timeout=5 $tika_url
if [ ! $? -eq 0 ]
then
	echo "Cannot download Apache Tika ($tika_url). Please try again later ..."
	exit 1	
fi


cd $current_dir
cp -R ../* $depdep_dir
cp $tika_sh $etc_dir


echo "$distro" | grep -Eq "^archassault$"
if [ $? -eq 0 ]
then
	sed -i -e "s/python/python2/g" $depdep_path
fi


for file in "$etc_dir/$tika_sh" $depdep_path
do
	chown root:root $file
	chmod 755 $file
done

exit 0
