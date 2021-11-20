#!/bin/bash

# Function to print lines in different colors
prnt_line(){

    # Color definition
    BLACK="\033[0;30m"
    BLUE="\033[0;34m"
    GREEN="\033[0;32m"
    CYAN="\033[0;36m"
    RED="\033[0;31m"
    PURPLE="\033[0;35m"
    ORANGE="\033[0;33m"
    LGRAY="\033[0;37m"
    DGRAY="\033[1;30m"
    LBLUE="\033[1;34m"
    LGREEN="\033[1;32m"
    LCYAN="\033[1;36m"
    LRED="\033[1;31m"
    LPURPLE="\033[1;35m"
    YELLOW="\033[1;33m"
    WHITE="\033[1;37m"
    NORMAL="\033[m"

    # Color assignment
    ERROR=$RED
    DEFAULT=$NORMAL
    QUESTION=$PURPLE
    HEADING=$ORANGE
    ABORT=$YELLOW

    # If normal message
    if [[ "$1" == "DEFAULT" ]]; then

        # Set Output String
        PRNT_OUT="$2"

        # If defautl text has to be printed
    elif [[ "$1" == "HEADING" ]]; then

        # Print
        PRNT_OUT="███   $2   ███"

    elif [[ "$1" == "ERROR" || "$1" == "ABORT" ]]; then

        PRNT_OUT="[ $1 ] $2"

    else
        # Print message without type in front
        PRNT_OUT="$2"
    fi

    # Preparing the color
    color=\$${1:-NORMAL}

    # Setting the color
    echo -ne "$(eval echo ${color})"

    # Print message to console
    echo "$PRNT_OUT"

    # Reset color to normal
    echo -ne "${NORMAL}"

    # If logging is activated
    if [[ $LOG == true ]]; then

        # Put to logfile
        echo "$PRNT_OUT" >> $LOG_PATH

    fi

}

