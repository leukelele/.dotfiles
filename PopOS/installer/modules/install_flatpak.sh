!/bin/bash

function install
{
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        flatpak install --system --app -y $1
    fi
}

# development
install netbeans

# applications
install obsidian
install org.chromium.Chromium
install xournalpp
install spotify
