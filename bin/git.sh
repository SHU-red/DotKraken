
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

    # Change to backup directory
    cd $CONF_DIR

    # Show new path
    prnt_line DEFAULT "Changed working directory to: $PWD"

    # Git Status
    git status

    # Add all files
    git add .

    # Commit all files and changes
    GITCOM="AutoBackup $(date +"%d-%m-%Y %H:%M:%S")"

    # Show Commit comment
    prnt_line DEFAULT "GitCommit Comment: $GITCOM"

    git commit -a -m "$GITCOM"

    # Push all changes
    git push

    # Change directory back to DotKraken
    cd $DKRK_DIR

}
