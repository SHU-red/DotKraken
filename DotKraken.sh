#!/bin/bash

# Change working directory to direcory of this script
DKRK_DIR=$(dirname "$(readlink -f "$0")")
cd $DKRK_DIR

# Source print script
source bin/prnt.sh

# Source prompt scripts
source bin/prmpt.sh

# Source git functions
source bin/git.sh

# Show header
echo""
prnt_line HEADING "▀██▀▀█▄             ▄   ▀██▀  █▀                  ▀██                       "
prnt_line HEADING " ██   ██    ▄▄▄   ▄██▄   ██ ▄▀    ▄▄▄ ▄▄   ▄▄▄▄    ██  ▄▄    ▄▄▄▄  ▄▄ ▄▄▄   "
prnt_line HEADING " ██    ██ ▄█  ▀█▄  ██    ██▀█▄     ██▀ ▀▀ ▀▀ ▄██   ██ ▄▀   ▄█▄▄▄██  ██  ██  "
prnt_line HEADING " ██    ██ ██   ██  ██    ██  ██    ██     ▄█▀ ██   ██▀█▄   ██       ██  ██  "
prnt_line HEADING "▄██▄▄▄█▀   ▀█▄▄█▀  ▀█▄▀ ▄██▄  ██▄ ▄██▄    ▀█▄▄▀█▀ ▄██▄ ██▄  ▀█▄▄▄▀ ▄██▄ ██▄ "
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
prnt_line HEADING "Loading custom config"
source $CONF_PATH
prnt_line DEFAULT "$CONF_PATH"
echo ""

# Show parameters
prnt_line HEADING "Parameters for Backup"
prnt_line DEFAULT "DotKraken directory: $GSHLT_DIR"
prnt_line DEFAULT "Config file: $CONF_FILE"
prnt_line DEFAULT "Config directory: $CONF_DIR"
prnt_line DEFAULT "Backup destination: $BUP_PATH"
prnt_line DEFAULT "Log file: $LOG_PATH"
echo""
# Show file definition
prnt_line DEFAULT "Defined Backup Files:"
for i in ${!BUP_FILES[@]}; do
prnt_line DEFAULT "$i: ${BUP_FILES[$i]}"
done

echo ""
# Prompt parameters
prnt_line QUESTION "Proceed with this config? [y/n]"
prmpt_read
prmpt_yes


# Output message
echo ""
prnt_line HEADING "1st Step: Backup files (full path)"

# Iterate through all files
for i in "${!BUP_FILES[@]}" ; do

    # Get realpath
    REALPATH=$(eval "realpath ${BUP_FILES[$i]}")

    # Store realpath
    BUP_FILES[$i]=$REALPATH

    # Output
    prnt_line DEFAULT $REALPATH

done

# Output message
echo ""
prnt_line HEADING "2nd Step: Deleted files (full path)"

# Iterate through all files
for i in "${!DEL_FILES[@]}" ; do

    # Get realpath
    REALPATH=$(eval "realpath ${DEL_FILES[$i]}")

    # Store realpath
    DEL_FILES[$i]=$REALPATH

    # Output
    prnt_line DEFAULT $REALPATH

done

# Prompt files
echo ""
prnt_line QUESTION "Listed files are correct? [y/n]"
prmpt_read
prmpt_yes
echo ""

# Notify on creating directory
prnt_line HEADING "Preparing destination folder"

# Check if target directory exists
if ! [[ -d $BUP_PATH ]]; then

    # Output that directory will be created
    prnt_line DEFAULT "Target directory does not exist"

else

    # Output that directory will be cleared
    prnt_line DEFAULT "Target directory exists"
    rm -f -r $BUP_PATH
    prnt_line DEFAULT "Target directory has been erased"

fi

# Create Backup directory
mkdir -p $BUP_PATH
prnt_line DEFAULT "Target directory has been created"
echo ""

# Copying files
prnt_line HEADING "Backup"


# Iterate through all files
for i in "${!BUP_FILES[@]}" ; do

    # Copy file
    mkdir -p $(eval "dirname $BUP_PATH${BUP_FILES[$i]}")
    cp -r ${BUP_FILES[$i]} $BUP_PATH${BUP_FILES[$i]}

    # Output
    prnt_line DEFAULT "copied ${BUP_FILES[$i]}"
    prnt_line DEFAULT "to $BUP_PATH${BUP_FILES[$i]}"
    echo ""

done
echo ""

# Deleting files
prnt_line HEADING "Delete"


# Iterate through all files
for i in "${!DEL_FILES[@]}" ; do

    # Delete file
    rm -f -r $BUP_PATH${DEL_FILES[$i]}

    # Output
    prnt_line DEFAULT "deleted $BUP_PATH${DEL_FILES[$i]}"

done
echo ""


# Backup done
prnt_line HEADING "Backup done!"


# Prompt GitPush
echo ""
prnt_line QUESTION "Shall backup immediately be pushed to GitHub? [y/n]"
git_read
prmpt_yes



git_push
echo ""


# GitHub Push done
prnt_line HEADING "GitHub Push done"

read
