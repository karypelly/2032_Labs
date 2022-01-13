#!/bin/bash
input=y
while [[ $input == [yY] ]]
do
	read -p "continue?" input
	read -p "account number " accnum
	
	while IFS=$"\t" read -r p || [ -n "$p" ]
	do
		echo $p
	done < "account.txt"
done 