#!/bin/bash

# Check if log directory was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR="$1"

# Check if directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory $LOG_DIR does not exist."
  exit 1
fi

# Create archive name with date and time
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_DIR="$HOME/log_archives"

# Create archive directory if not exists
mkdir -p "$ARCHIVE_DIR"

# Create the archive
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" .

# Log the operation
echo "$TIMESTAMP: Archived $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_NAME" >> "$ARCHIVE_DIR/archive_log.txt"

echo "Logs archived successfully as $ARCHIVE_NAME"
