#!/bin/bash
read int
if [ $int -le $# ]
then
	echo ${!int}
else
	echo No such argument
fi