#!/bin/bash -e

# Set up configures your $CTF_ROOT and adds it to $PATH. Also apt-get install's important packages required for tools.
# list      - recursively looks for install-ctf.sh scripts and the directory they are in. The tool name is the directory.
#             Note that this assumes the structure of tools is $CTF_ROOT/<category_dir>/<tool_name_dir>/install-ctf.sh
# Install   - runs the install-ctf.sh if it exists in the tool directory.
# Uninstall - tries to run an uninstall-ctf.sh if it exists in the tool directory.

function usage()
{
    cat <<END
Usage: $(basename $0) [-s] (list|setup|install|uninstall) tool

Where:
    tool        the name of the tool. if "all", does the action on all
            tools

Actions:
    setup       set up the environment (adds ctf-tools/bin to your
            \$PATH in .bashrc)
    list        list all tools (-i: only installed, -u: only
            uninstalled)
    install     installs a tool
    uninstall   uninstalls a tool

END
}

ACTION=$1
TOOL=$2
PACKAGE_REQS="build-essential libtool g++ gcc texinfo curl wget automake autoconf python-dev git subversion"

if [ "$TOOL" == "all" ]
then
    for t in $($0 list)
    do
        $0 $ACTION $t
    done
elif [ -z "$TOOL" -a "$ACTION" != "list" -a "$ACTION" != "setup" ]
then
    usage
    exit
fi

cd $(dirname "${BASH_SOURCE[0]}")/..

case $ACTION in
    setup)
        sudo apt-get install $PACKAGE_REQS
        echo "export CTF_ROOT=\"$PWD\" # DO NOT EDIT This is added by sec-tools" >> ~/.bashrc
        echo "export PATH=\"$CTF_ROOT/bin:\$PATH\" # DO NOT EDIT This is added by sec-tools" >> ~/.bashrc
        source ~/.bashrc
        ;;
    list)
        for t in ./*/*
        do
            [ ! -e "$t/install-ctf.sh" ] && continue
            echo $t
        done
        ;;
    install)
        cd $TOOL

        echo "Installing $TOOL"
        if ./install-ctf.sh
        then
            echo "[+] Install finished"
        else
            echo "[-] Install FAILED"
            cat install-ctf.log >&2
            exit 1
        fi
        ;;
    uninstall)
        cd $TOOL
        [ -x ./uninstall.sh ] && ./uninstall.sh
        cd ..
        ;;
esac