#!/bin/bash
# Get the directory structure of target directory
# Usage: ./dirstruct.sh target_dir
# Created on Sep 5, 2017

if [[ $1 == '' ]]; then
	echo "1 argument is missing"
	exit
fi

if [[ ! -d $1 ]]; then
	echo "no such directory"
	exit
fi

workdir=`pwd`

root=`echo $1 | sed 's/\/$//g'`
target=`echo $root | sed 's/^.*\///g'`
root=`echo $root | sed "s/$target//g"`

if [[ $root != '' ]]; then
	cd $root
fi

find $target -name "*" >dirstruct.txt

i=0
while [[ `grep '^[^:]*$' dirstruct.txt` != '' ]]; do
	for dirname in `grep '^[^:/]*$' dirstruct.txt | sed 's/ /?/g'`; do
		dirname=`echo $dirname | sed 's/?/ /g'`
		sed -i "s/^$dirname$/$i:$dirname/g" dirstruct.txt
		sed -i "s/^$dirname\///g" dirstruct.txt
	done
	i=$(($i+1))
done

mv dirstruct.txt $workdir

echo $(($i-1)) levels