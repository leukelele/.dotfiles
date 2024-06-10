# ------------------------------------------------------
# Check for required packages to run the installation
# ------------------------------------------------------

# Synchronize packages
sudo pacman -Sy
echo

# Check for required packages
echo "Checking that required packages for the installation are installed..."
_uninstallPackagesPacman "nano";
_installPackagesPacman "rsync" "figlet" "gum" "python";
