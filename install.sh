#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASHRC=
PROFILE=
SYSTEM=`uname -s`

function decide_filenames {
    BASHRC=$HOME/.bashrc
    if [ -r $HOME/.bash_profile ]; then
        PROFILE=$HOME/.bash_profile
    else
        PROFILE=$HOME/.profile
    fi
}

function write_bashrc_by_os {
    local file=$SCRIPT_DIR/bashrc_$SYSTEM
    echo "- OS Specified file is: $file"
    if [ -r $file ]; then
        echo "   Writing"
        cat $file >> $BASHRC
    else
        echo "   Not found"
    fi
}

function write_profile_by_os {
    local file=$SCRIPT_DIR/profile_$SYSTEM
    echo "- OS Specified file is: $file"
    if [ -r $file ]; then
        echo "    Writing"
        cat $file >> $PROFILE
    else
        echo "    Not found"
    fi
}

function install_bash {
    echo "Installing bash config..."
    echo "  Current system is: $SYSTEM"

    echo "Writing to rc file: $BASHRC"
    echo "### Added by Patrick's config ###" >> $BASHRC
    cat $SCRIPT_DIR/bashrc >> $BASHRC
    write_bashrc_by_os
    echo "" >> $BASHRC
    echo "### End Patrick's config ###" >> $BASHRC


    echo "Writing to profile file: $PROFILE"
    echo "### Added by Patrick's config ###" >> $PROFILE
    cat $SCRIPT_DIR/profile >> $PROFILE
    write_profile_by_os
    echo "" >> $PROFILE
    echo "### End Patrick's config ###" >> $PROFILE

    echo "- Done!"
}

## Main

decide_filenames
install_bash
