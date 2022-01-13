#!/bin/bash
fileCount=0
dirCount=0
for i in *
do
	if [[ -d $i ]]
	then
		dirCount=$((dirCount+1))
	elif [[ -f $i ]]
	then
		fileCount=$((fileCount+1))
	fi
done

echo The number of subdirectories: $dirCount
echo The number of regular files : $fileCount
