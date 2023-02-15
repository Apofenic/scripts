#!/bin/bash
# stateNum= $1
jq  --argjson stateNum
name="_counties.json"
featureArray=$(cat ~/usCounties.json | jq '.features')
fips=$(cat ~/scripts/fips.json | jq '."01"'| sed -e 's/^"//' -e 's/"$//' )
counties=$(echo "$featureArray" | jq -c '.[] | select(.properties .STATE | contains("01"))')
newJSON = $( jq '.counties' 
echo $counties > "$fips$name"

