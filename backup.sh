#!/bin/bash

#Klayton DalPra
#A script that takes 2 arguments and copies the files from the first directory, to the 2nd directory only if the file has been modified since the last time a backup was performed


#check for 2 additional agruments
if [ $# -ne 2 ]; then
	echo "Usage: $0 sourceDirectory backupDirectory"
	exit 1
fi

#check if the source exists
if [ ! -d "$1" ]; then
	echo "The directory does not exist"
	exit 1
fi

#check if backup directory exists, make it if it doesn't
if [ ! -d "$2" ]; then
	mkdir -p "$2"
fi

#for each file in the source directroy, copy the file to the back up directory
# -u makes it so that the file will only be copied if the source file is newer than the one in the backup directory (or doesn't exist in the backup yet)

for file in "$1"/*; do
	if [ -f "$file" ]; then
		cp -u "$file" "$2"
	fi
done

echo "Backup Successful."