#!/bin/bash
# Author: David Agbaraoluwa
# Purpose: Backs up GuessMaster files automatically with timestamp
# Version: v1


set -e
set -o pipefail


# ==== VARIABLES ====
GAME_FILES="/home/david-agbaraoluwa/html"
BACKUP_DIR="/home/david-agbaraoluwa/projects/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="guessmaster_backup_$TIMESTAMP"

# ===== CREATE BACKUP FOLDER ===== 
echo "===== GuessMaster Backup Script ====="
echo "Starting backup at: $TIMESTAMP"

mkdir -p "$BACKUP_DIR/$BACKUP_NAME"
echo "Created backup folder: $BACKUP_NAME"

# ===== COPY GAME FILES =====
echo ""
echo "Copying game files..."

for FILE in index.html style.css game.js sw.js
do

	cp "$GAME_FILES/$FILE" "$BACKUP_DIR/$BACKUP_NAME/"
	echo "Backed up: $FILE"
done


# ===== CONFIRM BACKUP =====
echo ""
echo "===== Backup Complete ====="
echo "Location: $BACKUP_DIR/$BACKUP_NAME"
echo "Files backed up:"
ls "$BACKUP_DIR/$BACKUP_NAME"
