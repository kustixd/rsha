#!/bin/bash
# db_create.sh
#
EXPECTED_ARGS=3 # maarame kasurea kaudu edatstatud parameetrite arv
E_BADARGS=65 # maarame sql veakood
MYSQL=`which mysql` # votame mysql /usr/bin/mysql tööle
# koostame sql lause
Q1="CREATE DATABASE IF NOT EXISTS $1;"
Q2="GRANT USAGE ON *.* TO $2@localhost IDENTIFIED BY '$3';"
Q3="GRANT ALL PRIVILEGES ON $1.* TO $2@localhost;"
Q4="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}${Q4}"
# kui skript on valesti kasutatud
# valjastame veateade
if [ $# -ne $EXPECTED_ARGS ]
then
echo "Usage: $0 dbname dbuser dbpass"
exit $E_BADARGS
fi
# muidu root nime alt sooritame paring
$MYSQL -uroot -p -e "$SQL"
