#!/bin/bash
filename=$2
word=$1
if [ -d $filename ]
then
	echo $filename is a directory
elif [ -e $filename ]
then
	for p in $(cat $filename)
	do
 		if [ $p == $word ]
 		then
 			echo word does exist 'in' $filename 
 			exit
 		fi
	done 
	echo word "doesn't exist in" $filename
else
	echo $filename does not exist
fi