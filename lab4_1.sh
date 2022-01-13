#!/bin/bash

if [[ "$1" == "-m" ]]
then
	while IFS=$', ' read -r -a line || [ -n "$line" ]
	do 
		while IFS=$',' read -r -a line2 || [ -n "$line2" ]
		do
			
			if [[ "${line[2]}" -eq "${line2[0]}" ]]
			then
				echo -e ${line[0]}", "${line[1]}'\t'${line[2]}'\t '${line2[2]}
			fi
		done < Courses.txt
	done < names.txt
elif [ "$1" == "-s" ]
then
	count=0
	totalCount=0
	while IFS=$',' read -r -a line || [ -n "$line" ]
	do
		if [[ "${line[2]}" == " $2" ]]
		then
			name=${line[0]}", "${line[1]}
			totalCount=$((totalCount+1))
		else
			totalCount=$((totalCount+1))
			count=$((count+1))
		fi
	done < names.txt
		
	while IFS=$',' read -r -a line || [ -n "$line" ]
	do
		if [[ "$2" == "${line[0]}" ]]
		then
			case "${line[2]}" in
				"A")
					sumGrades=$((sumGrades+4))
					n=$((n+1))
					;;
				"B")
					sumGrades=$((sumGrades+3))
					n=$((n+1))
					;;
				"C")
					sumGrades=$((sumGrades+2))
					n=$((n+1))
					;;
				" D")
					sumGrades=$((sumGrades+1))
					n=$((n+1))
					;;
				" F")
					n=$((n+1))
					;;
			esac
		fi
	done < Courses.txt
	if [[ $count -eq $totalCount ]]
	then
		echo No such ID
	else
		GPA=`echo "scale=1; $sumGrades / $n" | bc`
		echo -e $name'\t'$GPA	
	fi
fi