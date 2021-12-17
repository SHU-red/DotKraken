
# Function to print lines in different colors
git_read(){

# If prompts are activated
if [[ $GITPSH == true ]]; then

    # Print message, that prompts are deactivated
    prnt_line DEFAULT "GitPush activated --> y"

    # Set return value to "y"
    REPLY="y"

else

    # get user input
    read

fi

}

# Pushing changes to GitHub
git_push(){

    echo ""
    prnt_line HEADING "GitHub: Preparing Push"

    # Change to backup directory
    cd $CONF_DIR

    # Show new path
    prnt_line DEFAULT "Changed working directory to: $PWD"

    echo ""
    prnt_line HEADING "GitHub: Status"

    # Git Status
    git status

    # Add all files
    git add .

    # Commit all files and changes
    GITCOM="AutoBackup $(date +"%d-%m-%Y %H:%M:%S")"

    echo ""
    prnt_line HEADING "GitHub: Commit and Push"

    # Show Commit comment
    prnt_line DEFAULT "GitCommit Comment: $GITCOM"

    git commit -a -m "$GITCOM"

    # Push all changes
    git push

    # Change directory back to DotKraken
    cd $DKRK_DIR

    echo ""
    prnt_line HEADING "GitHub: Push done"
    # Show new path
    prnt_line DEFAULT "Restored working directory: $PWD"

}
