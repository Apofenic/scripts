#!/bin/bash
echo "hello $1"
dt=$(date '+ %r - %B %d, %Y (%A)');
if [ -z "$2" ]
then msg="miscellaneous changes; $dt"
else msg="$2 ; $dt"
fi
cd ~/"$1" && 
    git add .
echo "commit message: $msg"
git commit -m "$msg" --no-verify
git push
