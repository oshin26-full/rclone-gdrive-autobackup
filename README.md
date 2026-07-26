Automatic Google Drive Backup to a Local Server and ZIP

This Bash script downloads specific folders from Google Drive to the local hard drive of an Ubuntu server using Rclone, then packages them into a ZIP file every day.

This system uses a copy method (not sync), so the files on the server remain safe even if the files on the main Google Drive are accidentally deleted.

Features
- Secure backup: Files on the server won’t be deleted if the files in the cloud are lost.
- Daily archives: Automatic backups are compressed into separate .zip files based on the current date.
- Data filtering: Only registered folders are downloaded, saving storage space.

How to Use

1. Set Up Rclone
Make sure Rclone is installed on your Ubuntu server and connected to your Google Drive account via the rclone config command.

2. Create a List of Target Folders
Create a text file at /home/user/daftar_folder.txt and fill it with the names of the Google Drive folders you want to back up:
/YOUR-FOLDER-NAME1/
/YOUR-FOLDER-NAME2/

3. Configure the Script
Download the backup_gdrive.sh file from this repository, then open it with a text editor. Adjust the variables at the top of the script to match your server’s configuration (Rclone remote name, destination folder, and filter file location).

Enable the script’s execution permissions with the command:
chmod +x backup_gdrive.sh

4. Set Up an Automatic Schedule
Open the Linux job scheduler with the command:
crontab -e

Add the following line at the very bottom so the script runs automatically every night at 11 p.m.:
0 23 * * * /path/to/file/b
