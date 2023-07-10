#!/usr/bin/env bash 

if ! command -v mas &> /dev/null; then
  echo "mas is not installed"
  exit
fi  

while read -r app; do
  info=($app)
  mas install "${info[0]}" &> /dev/null
  if [ $? -eq 0 ]; then
    echo "[ INSTALLED ] .......... ${info[1]}"
  else
    echo "[ FAILED ] .......... ${info[1]}"
  fi
done < apps.txt
