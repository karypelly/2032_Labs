#!/bin/bash
for i in $*
do 
	echo -ne $i"  "
done
echo
read int
countSmall=0
countLarge=0
for i in $*
do
	if [[ $int < $i ]]
	then
		countSmall=$((countSmall+1))
	elif [[ $int > $i ]]
	then
		countLarge=$((countLarge+1))
	fi				
done 
if [[ $countLarge = $# ]]
then
	echo $int is larger than any parameter
elif [[ $countSmall = $# ]]
then
	echo $int is smaller than any parameter
fi