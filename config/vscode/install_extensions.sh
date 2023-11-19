#!/bin/sh

if [[ $(which code) ]]; then
    echo "Visual Studio Code is installed.."
    i=0; 
    # j=0; k=0;
    extensions_list=[];
    # installed_extensions=[];
    # to_install=[];

    while read line; do 
        extensions_list[$i]="$line"
        i=$((i+1))
        code --install-extension $line
    done < config/vscode/plugins.txt

    # while read line; do
    #     installed_extensions[$i]="$line"
    #     j=$((j+1))
    # done < $(code --list-extensions);

    # to_install=(`echo ${Array1[@]} ${Array2[@]} | tr ' ' '\n' | sort | uniq -u `) 

    # for k in "${to_install[@]}"; do  
    #     echo "Installing $k"
    #     code --install-extension $k  
    # done 
fi