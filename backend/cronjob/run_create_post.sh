#!/usr/bin/bash
set -x  # Enable debug mode
# Define paths
PYTHON_PATH="/home/deepesh/Development/private/freelance/learnza/backend/.venv/bin/python"
LOG_PATH="/home/deepesh/Development/private/freelance/learnza/logs/create_post.log"
SCRIPT_PATH="/home/deepesh/Development/private/freelance/learnza/backend/app/scripts/create_post.py"
# Run the Python script and log the output
$PYTHON_PATH $SCRIPT_PATH >> $LOG_PATH 2>&1
