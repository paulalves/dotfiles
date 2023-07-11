#!/usr/bin/env bash

if ! command -v dotnet &> /dev/null; then
  curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin
  if [ $? -eq 0 ]; then
    echo "[ INSTALLED ] ............ dotnet"
  else
    echo "[ FAILED ] ............... dotnet"
    exit 1
  fi

  export DOTNET_ROOT="$HOME/.dotnet"
  export PATH="$PATH:$DOTNET_ROOT"

  echo 'export DOTNET_ROOT=$HOME/.dotnet' | tee -a ~/.zshrc ~/.bashrc
  echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' | tee -a ~/.zshrc ~/.bashrc  
fi

while read -r package; do
  dotnet tool install --global $package &> /dev/null
  if [ $? -eq 0 ]; then
      echo "[ INSTALLED ] ............ $package"
  else
      echo "[ ALREADY INSTALLED ] ...... $package"
  fi
done < packages.txt
