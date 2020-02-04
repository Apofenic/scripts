#!/bin/bash
echo "hello $1"
dt=$(date '+ %r - %B %d, %Y (%A)');
if [ -z "$2" ]
then msg="basic save commit ; $dt"
else msg="$2 ; $dt"
fi
cd ~/"$1" && 
git add .
echo "commit message: $msg"
git commit -m "$msg"
git push


