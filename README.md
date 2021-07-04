# Dolphin Backup Tools
    Common operation script for mysql backup
## Requirement
   * require root access for adhoc.sh 
   * root folder need to be writable 
   * require to run inside mysql host
   * require mysql client

## Usage
   * sudo su or su
   * chmod +x adhoc.sh
   * set username and password
       * conf/my.cnf 
   * Do set all db that you don't require for this operation
       * conf/ignore.list
   * ./adhoc.sh

## Tested
   * Only on debian
   * Feel free to share your experiences
   
## Future update 
   * backup restore all from backup folder
   * backup restore selected db
   * backup from remote access
   * option to archived backup before override
