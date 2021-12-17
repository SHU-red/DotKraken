# 🦑 DotKraken
Lets you easily backup files and folders throughout the whole system (and not only from the users home-folder)

## ❗ Preamble
Im a very fresh Linux user which means that my coding skills and understanding of the whole system itsself has limits.
Thats why also constructive criticism is welcome.

## ❓ How it works 
Dot Kraken basically works in three steps
1. Copy all defined files/folders into a backup directory named `root`, right next to the DotKraken-config-file
2. Delete all defined files/folders which are defined in DotKraken-config-file (This is like a cherry-picking step to give you the possibility to delete sensible content from backed up folders)
3. Push to GitHub

Backup is done!

## ☝️ Why was it designed this way
I found all available tools for the topic "Backing up DotFiles"
- very complicated
- using/requiring the DotFiles to be linked via symlinks
- are not able to backup system files outside of the users home-folder

## 👷‍♂️ How to get DotKraken working

### Clone repository to your favourite destination
````
$ git clone https://github.com/SHU-red/DotKraken.git ~
````
### Create your custom repository for backing up your DotFiles and clone
````
$ git clone https://github.com/YOU/DotKraken_Backup.git ~
````
### Copy the default config as starting-point to your backup directory
````
$ cp -i ~/DotKraken/default.conf ~/DotKraken_Backup/DotKraken.conf
````
### Modify your new DotKraken.conf config file as you like
- Add Files to backup
- Add Files to not-backup (which will only be deleted within the backup folder)
- Activate Prompts
- Activate GitPush automatic
- Activate Logging
### Execute Backup
Just execute DotKraken.sh and as parameter provide the destination to your config-file
````
$ bash ~/DotKraken/DotKraken.sh ~/DotKraken_Backup/DotKraken.conf
````
### Automatic Backup
To frequently auto-backup your important files, just open `crontab -e` and add a linke like
```
# DotKraken Backup daily
0 0 * * * ~/DotKraken/DotKraken.sh ~/DotKraken_Backup/DotKraken.conf
```
This will cause a daily push of changes
### 🤯 Thats it
- Your backup will be placed in the folder ~/DotKraken_Backup/root
- This root-folder will be erased and re-created at each and every backup to provide the clean up-to-date status of your system-files
