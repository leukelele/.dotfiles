#!/bin/bash

# define the base directory path
base_dir="$HOME/.nb/"

# randomly select between the "fleeting" and "permanent" directories
selected_dir=$(shuf -e "fleeting" "permanent" -n 1)

# get a random file from the selected directory
file=$(shuf -e $(find "$base_dir$selected_dir" -type f) -n 1)

# open the selected file with vim
vim "$file"
