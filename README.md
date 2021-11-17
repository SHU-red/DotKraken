# ⚛️ SniperGit :atom:
Lets you easily and as exact as a sniper pick specific files from the whole system without the need of symlinks.

## ❓ How it works 
1. Execute `$ SniperGit.sh CONFIGFILE` whereas `CONFIGFILE`has to be replaced by the SniperGit file, specifying the backup
    * Example: `$ SniperGit.sh ~/UserBackup1/SniperGit.conf`
    * This gives the opportunity to run backups with different configurations on one machine by just creating differnt config-files and running/executing them through `SniperGit.sh`
2. __SniperGit__ will now
   1. Creat and/or fully clean the specified `temp-folder` (specified in `SniperGit.conf`), placed in the local git-repository for your backups
   2. Copy all files/folders for backup (specified in `SniperGit.conf`) into the `TEMPFOLDER`(specified in `SniperGit.conf`)

You can now backup all of those files, because the `TEMPFOLDER`is placed in your local Git repository for backing up your files

## 💣 Pro/Con

__Pro:__
* Collecting also system-files without the need of root permissions
* Collecting also system-files without the need of being somewhere in $HOME-directory
* No need for symlinks or cleaning broken symlinks
* No risk of breaking your system through manipulation of files by replacing them with symlinks

__Con:__
* All files will be available as copy which needs space to store (not much if only text files)
* Possibility to edit files like symlinks behave (but you just have to edit the files where they would actually belong)

## ❗Why use it
This script has been created to have a very simple way to freely backup files and directories as picked throughout the whole system, no matter if it is a root, or a user file/directory and what the permissions are.

Thats why it is super easy to also use on e.g. RaspberryPies with custom distributions, storing important files not in $HOME directory.

Its super simple to create e.g. daily-backups by setting a crontab, executing `$ SniperGit.sh CONFIGFILE` from your machine or RaspberryPies.

## 👷‍♂️ How to get it working

Get the SniperGit repository somewhere by using
````
$ git clone XXX ~/SniperGit
````
Create your own repository for your backup by either creating it yourself or using the `BackupTemplate`-folder from the __SniperGit__-repository

__BE CAREFUL!__ the `TEMPFOLDER` (specified in `SniperGit.conf`) will frequently be completely cleaned. Thats why this folder should __NOT BE EXACLTY__ your local repository folder, but __AN ADDITIONAL FOLDER INSIDE__.
