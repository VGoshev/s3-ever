#!/bin/sh

#Simple static site generator
# $1 - file name

cd `dirname $0`/../

FILE=`basename "$REQUEST_URI"`

[ -z "$FILE" ] && FILE="index"

#Well, we assume, that file 404 does exists
[ -f "./data/$FILE" ] || FILE="404"

cat "./data/header.htm" >  "./cache/$FILE"
cat "./data/$FILE"  >> "./cache/$FILE"
cat "./data/footer.htm" >> "./cache/$FILE"


echo "Content-type: text/html"
echo ""
cat "./cache/$FILE"
