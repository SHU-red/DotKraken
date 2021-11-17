# SniperGit
Lets you easily and as exact as a sniper pick specific files from the whole system without the need of symlinks.

## How it works
1. Execute `$ SniperGit.sh CONFIGFILE` whereas `CONFIGFILE`has to be replaced by the SniperGit file, specifying the backup
    * Example: `$ SniperGit.sh ~/UserBackup1/SniperGit.conf`
    * This gives the opportunity to run backups with different configurations on one machine by just creating differnt config-files and running/executing them through `SniperGit.sh`
2. *SniperGit* will now
   1. Creat and/or fully clean the specified `temp-folder` (specified in `SniperGit.conf`), placed in the local git-repository for your backups
   2. Copy all files/folders for backup (specified in `SniperGit.conf`) 

## Pro/Con
Pro:
* Collecting also system-files without the need of root permissions
* Collecting also system-files without the need of being somewhere in $HOME-directory
Con:
* All files will be available as copy which needs space to store
* Possibility to 
