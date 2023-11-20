#!/bin/sh

echo "Updating VS Code extensions"
code --list-extensions > config/vscode/plugins.txt 
sort config/vscode/plugins.txt
