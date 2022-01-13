#!/bin/bash
read a b
if [[ $a = '' || $b = '' ]]
then
	echo You should enter two numbers.
elif [[ $a = $b ]]
then
	echo These two numbers are equal
elif [[ $a > $b ]]
then
	if [[ $((a%b)) = 0 ]]
	then
		echo $a is $((a / b)) times $b
	else
		echo  No relation
	fi
elif [[ $a < $b ]]
then
	if [[ $((b%a)) = 0 ]]
	then
		echo $b is $((b / a)) times $a
	else
		echo  No relation
	fi
fi