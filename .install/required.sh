# ------------------------------------------------------
# Check for required packages to run the installation
# - I don't know if I really need rsync; regardless, it
#   is already on endeavouros so I'll hold off revising
#   this for now.
# ------------------------------------------------------

# Synchronize packages
sudo pacman -Sy
echo

# Check for required packages
echo "Checking that required packages for the installation are installed..."
_installPackagesPacman "rsync" "gum" "figlet" "python";

# Double check rsync
if ! command -v rsync &> /dev/null; then
    echo ":: Force rsync installation"
    sudo pacman -S rsync --noconfirm
else
    echo ":: rsync double checked"
fi
echo
