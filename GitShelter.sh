#!/bin/bash

# Change working directory to direcory of this script
GSHLT_DIR=$(dirname "$(readlink -f "$0")")
cd $GSHLT_DIR

# Source print script
source bin/prnt.sh

# Source prompt scripts
source bin/prmpt.sh

# Show header
echo""
prnt_line HEADING "             ▄▄                ▄▄                  ▄▄                       "
prnt_line HEADING "  ▄▄█▀▀▀█▄█  ██   ██   ▄█▀▀▀█▄███                ▀███   ██                  "
prnt_line HEADING "▄██▀     ▀█       ██  ▄██    ▀███                  ██   ██                  "
prnt_line HEADING "██▀       ▀▀███ ██████▀███▄    ███████▄   ▄▄█▀██   ██ ██████  ▄▄█▀██▀███▄███"
prnt_line HEADING "██           ██   ██    ▀█████▄██    ██  ▄█▀   ██  ██   ██   ▄█▀   ██ ██▀ ▀▀"
prnt_line HEADING "██▄    ▀████ ██   ██  ▄     ▀████    ██  ██▀▀▀▀▀▀  ██   ██   ██▀▀▀▀▀▀ ██    "
prnt_line HEADING "▀██▄     ██  ██   ██  ██     ████    ██  ██▄    ▄  ██   ██   ██▄    ▄ ██    "
prnt_line HEADING "  ▀▀███████▄████▄ ▀████▀█████▀████  ████▄ ▀█████▀▄████▄ ▀████ ▀█████▀████▄  "
prnt_line DEFAULT "Checking given parameters ..."
echo""

# If no parameters are provided is provided
if (( $# == 0 )); then

    # Output error
    prnt_line ERROR "Path to config-file is not provided as parameter!"
    # Exit with error
    exit 1

fi


# Check if parameter points to existing file
if ! [[ -f $1 ]]; then

    # Output error
    prnt_line ERROR "Parameter does not point to file"
    # Exit with error
    exit 1

fi

# Write config file path to variable
CONF_PATH=$(realpath $1)
CONF_DIR=$(dirname $CONF_PATH)
CONF_FILE=$(basename $CONF_PATH)

# Print found config file
prnt_line HEADING "Config found"
prnt_line DEFAULT "File: $CONF_FILE"
prnt_line DEFAULT "Directory: $CONF_DIR"
echo""

# Load default configuration
prnt_line HEADING "Loading default config"
source default.conf
if [[ $LOG == true ]]; then
    echo "TIMESTAMP: $(date)" > $LOG_PATH
fi
prnt_line DEFAULT "default.config"
echo""

# Load custom configuration
prnt_line HEADING "Loading cutom config"
source $CONF_PATH
prnt_line DEFAULT "$CONF_PATH"
echo ""

# Show parameters
prnt_line HEADING "Parameters for Backup"
prnt_line DEFAULT "GitShelter directory: $GSHLT_DIR"
echo ""
prnt_line DEFAULT "Config file: $CONF_FILE"
prnt_line DEFAULT "Config directory: $CONF_DIR"
echo ""
prnt_line DEFAULT "Backup directory: $BUP_PATH"
echo ""
prnt_line DEFAULT "Logging: $LOG"
prnt_line DEFAULT "Log file: $LOG_PATH"
echo ""

# Prompt parameters
prnt_line QUESTION "Proceed with this config? [y/n]"
read
prmpt_yes
