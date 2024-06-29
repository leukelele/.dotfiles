# ------------------------------------------------------
# Install preferred packages
# ------------------------------------------------------

# Synchronize packages
sudo pacman -Sy
echo

# Check for required packages
echo "Installing packages for the installation are installed..."
_uninstallPackagesPacman "nano";
_installPackagesPacman "rsync" "figlet" "gum" "python";
