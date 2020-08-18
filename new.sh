#!/bin/sh

NAME=`echo $1 | sed -E 's/[ \.\/]/_/'`
FILE="data/$NAME.json"
DATE=`date +%Y-%m-%d`

cp template.json $FILE
sed -E -i "" "s/2020-01-01/$DATE/" $FILE
sed -E -i "" "s/\"id\": \"\"/\"id\": \"$NAME\"/" $FILE

$EDITOR $FILE
