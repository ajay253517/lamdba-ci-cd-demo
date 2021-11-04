#!/bin/bash
### Script to check the pylint score 
CO_ID=$1
fList=$(git diff-tree --no-commit-id --name-only -r $CO_ID | grep "\.py")
[ -z "$fList" ] && echo "no tests" && exit 0 || pip install pylint

for i in `echo $fList | xargs -n1 | grep "\.py"`
do
  echo "modified py file is : $i "
  stat $i  > /dev/null
  if  [ "$?" == "0" ]; then
    echo "file exists and installing requirements"
    SCORE=$(pylint $i | sed -n 's/^Your code has been rated at \([-0-9.]*\)\/.*/\1/p' | cut -d "." -f1)
       if [ $SCORE -ge 8 ]; then
         echo "File $i pylint value is: $SCORE and success"
       else 
         echo "File $i pylint value is: $SCORE and it's failed"
         exit 1
       fi
    else
      echo "file doesnt exists"
    fi
  done