## Initiate Basic variable
DIR="$(dirname $0)"
CONF="$DIR/conf"
BACKUP_FOLD="$DIR/backup"
BIN="/usr/bin"

## function to create backup
backup() {
    echo -e "Start doing backup ..."
    $BIN/mariadb --defaults-file="$CONF/my.cnf" --batch --skip-column-names -e "show databases" | grep -v -f "$CONF/ignore.list" > "$CONF/db.list"

    for db in `cat $CONF/db.list`
    do
        $BIN/mariadb-dump --defaults-file="$CONF/my.cnf" --events --dump-date $db  > "$BACKUP_FOLD/$db.sql"
        echo "dumped $db to $BACKUP_FOLD/$db.sql"
    done
}

create_db() {
    $BIN/mariadb --defaults-file="$CONF/my.cnf" -e "\
        DROP DATABASE IF EXISTS ${1};
        CREATE DATABASE ${1}
    "
}

restore_db() {
    for db in `cat $CONF/db.list`
    do
        create_db $db
        $BIN/mariadb --defaults-file=$CONF/my.cnf $db < "$BACKUP_FOLD/$db.sql"
        echo "restored $db from $BACKUP_FOLD/$db.sql."
    done
}
