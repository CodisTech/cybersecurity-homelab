#!/bin/bash
# Backup script for cybersecurity homelab

# Define backup directory and filename
BACKUP_DIR="/backup"
DATE=$(date +"%Y-%m-%d")
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Create the backup
tar -czf $BACKUP_FILE /path/to/important/files

echo "Backup completed: $BACKUP_FILE"

