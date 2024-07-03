Bachup.sh @author Martin -Jul 3, 2024

This command will execute the process of backing up files from a specified directory into a backup backup directory.

The directory that to be backed up will need to be specified in the shell script before being executed. Once executed, the script will first check if the necessary backup directory and log exist. If they do not exist, then they are created. This backup directory will only contain copies of files that have been recently modified. The log file will documnent the script's history of all recently backed up files. The script will then begin it's backup process by comparing all the modified times of the files in the specified diretory, and compare them to the last modified time of our log. If the specified file is newer than the log, then we will copy the file to backups directory. Then update the log to document the last backup. Updating the log will change the modified time and allow us to use it as a referenee for when a file is recenlty modified.

This script can be useful to help prevent complete data loss that could result from, accidents or hardware failure. The script can save some space by only backing up files that are actively modified, and can be set to protect any specified directory. Logs are also provided to track when and what files are being backed up.

This script can be executed with ./Backup.sh after it has been added to your PATH or creating an alias in bashrc. This script can also be executed with cron : * * * * * $PATH/Backup.sh to allow for automated backups.

EX:

	[martinsu24@sjsu ~]$ ls
	bin cs131 index.html taxidata
# Backups dir does not exist

	[martinsu24@sjsu ~]$ backup && ls backups
	bin cs131 index.html taxidata
# Directory 'backups' has been created.

	[martinsu24@sjsu ~]$ ls -l backups
	total 0
	-rw-rw-r-- 1 martinsu24 martinsu24 0 Jul 2 18:04 backup.log
# Only log is contained in backups as no fies have been modified

	[martinsu24@sjsu ~]$ touch cs131/shtest && backup
	Successfully Backed Up File: /mnt/scratch/martinsu24/cs131//shtest in Directory: /mnt/scratch/martinsu24/cs131/
# Touch/modify shtest & then execute backup

	[martinsu24@sjsu ~]$ ls -l backups
	total 8
	-rw-rw-r-- 1 martinsu24 martinsu24 96 Jul 2 18:07 backup.log
	-rw-rw-r-- 1 martinsu24 martinsu24 38 Jul 2 18:07 shtest
# shtest was successfully backed up in backups directory`
