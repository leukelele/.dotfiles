#!/bin/bash
dir=$HOME
dir+="/.nb/"
dir+=$(ls $dir | shuf -n 1)
nvim $dir
