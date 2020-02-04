#!/bin/bash

envToJson=$(sed 's/=/:/; s/\(:\)/"\1/g; s/^/"/; s/$/,/; $ s/.$//; $s/$/\}/; 1s/^/\{/' <../.env)
echo $envToJson
jsonToEnv=$(echo $envToJson | sed 's/":"/"="/g; s/, "/ /g; s/"=/=/g; s/{"/ /g; s/"}//g')
echo $jsonToEnv
