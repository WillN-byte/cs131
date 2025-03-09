#!/bin/bash
echo "Make sure 2019-01-h1.csv file is in this directory"
file_name="2019-01-h1.csv"
dateTime=$(date "+%F-%T")
result="ws4.txt"
IFS=$'\n'
if [ -f "$PWD/$file_name" ]; then
	# Find Out the Unique Values for vendors
	unique=$(tail -n +2 $file_name | sort | cut -d',' -f1 | uniq )

	echo "sorted and unique works"
	
	# This should reorganize the 2019 taxi datasets by vendorid
	tail -n +2 $file_name | awk -F',' -v dateTime="$dateTime" '{print $0 >> dateTime "-" $1 ".csv"}'

	echo "reorg dataset works"
	# add all csv files into .gitignore and also create ws4.txt and include the result from wc command
	for item in $unique; do
		name="$dateTime-$item.csv"
		echo "$name" >> .gitignore
		wc "$name" >> $result
	done
	echo 'adding additonal info to ws4.txt works'

	# add cat .gitignore to ws4.txt
	echo "$( cat .gitignore)" >> $result	
else
	echo "Script cannot find the file"
fi




