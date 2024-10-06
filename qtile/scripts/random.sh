#!/bin/bash
dir=$HOME"/"
dir+=".nb/"
dir+=$(ls $dir | shuf -n 1)"/"
dir+=$(ls $dir | shuf -n 1)
vim $dir
