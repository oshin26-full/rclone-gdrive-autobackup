REMOTE_NAME="YOUR_RCLONE_REMOTE:"              
LOCAL_PATH="/path/to/your/local/backup/folder" 
ZIP_OUT_DIR="/path/to/your/zip/archives"       
FILTER_FILE="/path/to/your/daftar_folder.txt"  
LOG_FILE="/var/log/rclone_backup.log"          
3
mkdir -p $ZIP_OUT_DIR

echo "=== Backup & Zip dimulai: $(date) ===" >> $LOG_FILE

/usr/bin/rclone copy $REMOTE_NAME $LOCAL_PATH --include-from $FILTER_FILE >> $LOG_FILE 2>&1

FILE_NAME="backup_gdrive_$(date +%Y-%m-%d).zip"

PARENT_DIR=$(dirname "$LOCAL_PATH")
TARGET_DIR=$(basename "$LOCAL_PATH")

cd $PARENT_DIR
zip -r "$ZIP_OUT_DIR/$FILE_NAME" "$TARGET_DIR" >> $LOG_FILE 2>&1

echo "=== Backup & Zip selesai: $(date) ===" >> $LOG_FILE
