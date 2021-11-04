#!/bin/bash
### Script to validate tf codes
CO_ID=$1
fList=$(git diff-tree --no-commit-id --name-only -r $CO_ID | grep "\.tf")
[ -z "$fList" ] && echo "no tf files modified" && exit 0

get_dir=$(git diff --name-only HEAD~1 | awk -F "/*[^/]*/*$" '{ print ($1 == "" ? "." : $1); }' | sort | uniq | grep -v github  | grep "tf-*")

echo $get_dir