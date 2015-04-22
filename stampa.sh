#!/bin/bash

if [ -z $1 ]
then
	echo 'ERRORE DEI PARAMETRI' >&2
	echo "$0 <data_di_confronto>" >&2
	echo 'Occore che il formato sia YYYY-MM-DD-HH:mm' >&2
fi

echo "I file modificati dopo la data $1 sono:"

for n in `ls`
do
	dataDeiFile=`stat -c %y $n`
	dataDeiFile="${dataDeiFile:0:10}-${dataDeiFile:11:5}"
	if [[ $dataDeiFile > $1 ]]
	then
		echo "$n"
	fi
done