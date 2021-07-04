# Dolphin Backup Tools
    Common operation script for mysql backup
## Features
* Backup all db per file (adhoc.sh)
* Restore all db (restore.sh)
* Archive db (archive.sh)


## Requirement
   * require root access for adhoc.sh 
   * root folder need to be writable 
   * require to run inside mysql host
   * require mysql client

## Usage
### setup
```bash
sudo su
git clone https://github.com/faizal2007/dolphin_backup.git
cd dolphin_backup
```
#### Backup all db
```bash
chmod +x adhoc.sh
./adhoc.sh
```
#### Archives all db
```bash
chmod +x archive.sh
./archive.sh
```
### Restore all db
```bash
chmod +x restore.sh
./restore.sh
```

## Tested
   * Only on debian
   * Feel free to share your experiences
   
