#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install_bash {
    echo "Installing bash config..."

    echo "### Added by Patrick's config ###" >> $HOME/.bashrc
    cat $SCRIPT_DIR/bashrc >> $HOME/.bashrc
    echo "" >> $HOME/.bashrc
    echo "### End Patrick's config ###" >> $HOME/.bashrc


    echo "### Added by Patrick's config ###" >> $HOME/.profile
    cat $SCRIPT_DIR/profile >> $HOME/.profile
    echo "" >> $HOME/.profile
    echo "### End Patrick's config ###" >> $HOME/.profile

    echo "    Done!"
}

## Main

install_bash