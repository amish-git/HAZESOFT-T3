#!/bin/bash
if [ -z :"$1" ]; then 
    echo "Please enter the directory path you want to backup"
    exit 1
fi

#sourcce directory input 
src_dir="$1"

# timestamp for backup
current_timestamp=$(date "+%Y-%M-%d-%H:%M:%S")
echo $current_timestamp
backup_filename="backup_${current_timestamp}.tar.gz"
echo $backup_filename

#backup directory location
echo "Enter the path where you want to save your backup:"
read backup_dir 

# create backup archive
tar -czf "${backup_dir}/${backup_filename}" "${src_dir}"

# checking status of backup
if [ "$?" -eq 0 ]; then 
    echo "Backup complete. Archive has been saved to:${backup_dir}/${backup_filename}"
else
    echo "Backup failed.Please try again!"
fi    
