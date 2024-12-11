#!/bin/bash

# Define paths
PYTHON_PATH="/home/deepesh/Development/private/freelance/learnza/backend/.venv/bin/python"
SCRIPT_PATH="/home/deepesh/Development/private/freelance/learnza/backend/app/scripts/create_post.py"
LOG_PATH="/home/deepesh/Development/private/freelance/learnza/logs/create_post.log"

# Run the Python script and log the output
$PYTHON_PATH $SCRIPT_PATH >> $LOG_PATH 2>&1