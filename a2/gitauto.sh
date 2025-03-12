#!/bin/bash

# This is the commit message
commit=$1

# This is keeping track of how many files/folders were actually added
adds=0

# If there are less than 2 arguments provided, there is something wrong
if [ $# -lt 2 ]; then
	echo "Not enough arguments were provided"
	exit 1
fi

# skip the first element as it is a comment for commiting
shift

# for every other argument, check if that file/folder exist and add it
# Also, keep a track fo how may valid files/folders were added
for arg in "$@"; do
	if [ -d "$arg" ]; then
		git add $arg
		((adds++))1
		echo "$arg was added"
	else
		echo "$arg not found"
	fi
done

# If no valid files/folders were added then do no commit or push
if [ $adds -gt 0 ]; then
	git commit -m "$commit"
	git push
	echo "Changes has been pushed to GitHub"
else
	echo "No changes were pushed because all files were invalid"
fi	
