# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------

# Warning for if .dotfiles are placed in the home directory
echo "You can cancel the installation at any time with CTRL + C"
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
if [ $SCRIPTPATH = "/home/$USER/.dotfiles" ]; then
    echo ""
    echo "IMPORTANT: You're running the installation script from the installation target directory."
    echo "Please move the installation folder .dotfiles e.g. to ~/Downloads/ and start the script again."
    echo "Proceeding is not recommended!"
    if [ ! $mode == "dev" ]; then
        exit
    fi
fi

# Confirmation for proceeding with installation script
if [ ! -d ~/.dotfiles ];then
    if gum confirm "DO YOU WANT TO START THE INSTALLATION OF THE .DOTFILES NOW?" ;then
        echo "Installation started."
    elif [ $? -eq 130 ]; then
            exit 130
    else
        echo ":: Installation canceled."
        exit;
    fi
else
    if gum confirm "DO YOU WANT TO START THE UPDATE OF YOUR .DOTFILES NOW?" ;then
        echo ":: Update started."
    elif [ $? -eq 130 ]; then
            exit 130
    else
        echo ":: Update canceled."
        exit;
    fi
fi
echo ""
