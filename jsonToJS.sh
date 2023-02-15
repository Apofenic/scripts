#!/bin/bash
# $1 "file" for converting 1 file , or "dir" for converting a directory of files
# $1 should be the path the the .json file to parse
# $2 should be the path of the .js  or .ts file to write to

cat $1 | json-to-js > $2
