#!/bin/bash
while :
do
	read -p "continue?" input
	if [[ $input != [yY] ]]
	then
		exit
	fi
	read -p "account number " accnum

	count=0
	totalCount=0
	
	while IFS=$'\t' read -r -a line || [ -n "$line" ]
	do
		if [[ ${line[0]} == $accnum ]]
		then
			name=${line[1]}
			totalCount=$((totalCount+1))
		else
			totalCount=$((totalCount+1))
			count=$((count+1))
		fi
	done < account.txt
	
	if [[ $count == $totalCount ]]
	then
		echo No such client.
		continue
	fi
	
	while IFS=$'\t' read -r -a line || [ -n "$line" ]
	do
	
		if [[ ${line[0]} == $name ]]
		then
			acc=${line[1]}
			bal=${line[2]}
		fi
	done < names.txt
	
	while IFS=$'\t' read -r -a line || [ -n "$line" ]
	do
		if [[ ${line[0]} == $accnum ]]
		then
			add=${line[1]}
			echo $name" "$acc" "$bal" "$add
		fi
		
	done < address.txt

	
	
done