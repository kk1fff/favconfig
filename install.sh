#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASHRC=
PROFILE=

function decide_filenames {
    BASHRC=$HOME/.bashrc
    if [ -r $HOME/.bash_profile ]; then
        PROFILE=$HOME/.bash_profile
    else
        PROFILE=$HOME/.profile
    fi
}

function install_bash {
    echo "Installing bash config..."

    echo "Writing to rc file: $BASHRC"
    echo "### Added by Patrick's config ###" >> $BASHRC
    cat $SCRIPT_DIR/bashrc >> $BASHRC
    echo "" >> $BASHRC
    echo "### End Patrick's config ###" >> $BASHRC


    echo "Writing to profile file: $PROFILE"
    echo "### Added by Patrick's config ###" >> $PROFILE
    cat $SCRIPT_DIR/profile >> $PROFILE
    ## Also, write bashrc.
    cat $SCRIPT_DIR/bashrc >> $PROFILE
    echo "" >> $PROFILE
    echo "### End Patrick's config ###" >> $PROFILE

    echo "    Done!"
}

## Main

decide_filenames
install_bash
