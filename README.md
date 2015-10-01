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
   * Do set all db that you don't require for this operation
       * conf/ignore.list
   * ./adhoc.sh

## Warning
   * This script are not for archiving
   * This script will override all file inside backup folder
   * Do backup all file inside backup folder before proceed
