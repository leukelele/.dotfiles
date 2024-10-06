#!/bin/sh

#   ___ _____ ___ _     _____   ____  _             _    
#  / _ \_   _|_ _| |   | ____| / ___|| |_ __ _ _ __| |_  
# | | | || |  | || |   |  _|   \___ \| __/ _` | '__| __| 
# | |_| || |  | || |___| |___   ___) | || (_| | |  | |_  
#  \__\_\|_| |___|_____|_____| |____/ \__\__,_|_|   \__| 
#                                                        
#  
# by Stephan Raabe (modified by Luke Le) 2024
# ----------------------------------------------------- 

# Readjusts to laptop resolution
#pkill -f kanshi
#kanshi &

# wlr-randr solution bc it doesn't have an output like
# kanshi
wlr-randr --output eDP-1 --on --scale 1.75

# Notification service
pkill -f mako
mako &

# Network manager applet
# run nm-applet &
