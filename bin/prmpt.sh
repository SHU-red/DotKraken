#!/bin/bash

# Function to print lines in different colors
prmpt_yes(){

    # If answer is not y
    if ! [[ $REPLY == "y" ]]; then

        # Print output
        prnt_line ABORT "Execution aborted!"

        # Abort execution
        exit 1

    fi

}

# Function to print lines in different colors
prmpt_read(){

# If prompts are activated
if [[ $PRMPT == true ]]; then

    # get user input
    read

else

    # Print message, that prompts are deactivated
    prnt_line DEFAULT "Prompts are deactivated --> y"

    # Set return value to "y"
    REPLY="y"

fi

}
