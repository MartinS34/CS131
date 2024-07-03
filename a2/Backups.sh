"Backup.sh" 29L, 1136C                                                                                                                                                       29,4          All
#!/bin/bash
#
# cronjob :    */1 * * * * $HOME/bin/Backup.sh
# ~/.bahrc :  alias backup="$HOME/bin/Backup.sh"
#
# Variable is set to the directory path that we wish to run script for, to be changed by the user
ProtectedDir="/mnt/scratch/martinsu24/cs131/"

# Variables used to get our backups directory and log the script's history
BackupsDir="$HOME/backups"
log="$BackupsDir/backup.log"

# If our BackupsDir or log file do not exist, then we will create them.
if [ ! -d "$BackupsDir" ] || [ ! -f "$log" ]; then
    mkdir -p "$BackupsDir"
     touch "$log"
fi

# Iterates through the files in the protected directory
for i in "$ProtectedDir"/*; do
        # Checks if the current file is a regular file and if the file is newer than log
        if [ -f "$i" ] && [ "$i" -nt "$log" ]; then
            # Perform the backup operation by copying the modified file into the backups directory.
            cp "$i" "$BackupsDir"
            # updates our log with a date and time of the last backed up file.
            echo "$(date)   - Successfully backed up!  $i" >> "$log"
            echo "Successfully Backed Up File:  $i in Directory:  $ProtectedDir"
        fi
done

