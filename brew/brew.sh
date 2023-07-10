#!/usr/bin/env bash 

if ! command -v brew &> /dev/null; then
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi 

brew update &> /dev/null && brew upgrade &> /dev/null;

while read -r formula; do
  brew install $formula &> /dev/null
  if [ $? -eq 0 ]; then
    echo "[ INSTALLED ] ............ ${formula}"
  else
    echo "[ FAILED ] ............ ${formula}"
  fi
done < formulas.txt

while read -r cask; do
  brew install --cask $cask &> /dev/null
  if [ $? -eq 0 ]; then
    echo "[ INSTALLED ] ............ ${cask}"
  else
    echo "[ FAILED ] ............ ${cask}"
  fi
done < casks.txt
