#!/bin/bash

# Function to print lines in different colors
prmpt_yes(){

    # If answer is not y
    if ! [[ $REPLY == "y" ]]; the

        # Print output
        prnt_line ABORT "Execution aborted!"

        # Abort execution
        exit 1

    fi

}
