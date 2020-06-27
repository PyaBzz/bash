#!/bin/bash
source ../bashSource/functions.sh

function getScriptDir {
    # We cannot source this from another file as the returned
    # value reflects the directory where this script exists
    echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
}

function applyBazBash {
    if ( askUser "Mod bashrc?" ) then
        if (fileExists ./bashrc.bak) then
            echo "Backup file exists!"
            if (askUser "Overwrite it?") then
                echo "Overwriting backup file ..."
            else
                echo "Skipping bashMod ..."
                return
            fi
        fi

        #===================  Make backup  ===================
        cp ~/.bashrc ./bashrc.bak
        echo "Backup saved in ./bashrc.bak"

        #===================  Bashrc  ===================
        echo "" >> ~/.bashrc
        echo "" >> ~/.bashrc
        echo "#===================  BazMod  ===================" >> ~/.bashrc
        echo "" >> ~/.bashrc
        echo "source $(getScriptDir)/bashrcSrc.sh" >> ~/.bashrc
        echo "" >> ~/.bashrc

        #===================  Bashrc dynamic  ===================
        if (fileExists ./bashrcSrcDynamic.sh) then
            echo "Dynamic file exists!"
            if (askUser "Overwrite it?") then
                echo "Overwriting dynamic file ..."
                echo "" > ./bashrcSrcDynamic.sh
            else
                echo "Using existing dynamic file"
                return
            fi
        fi
        echo "#===================  Aliases  ===================" >> ./bashrcSrcDynamic.sh
        echo "" >> ./bashrcSrcDynamic.sh
        echo "Bashrc Mod Applied!"
    else
        echo "Skipped bashMod"
    fi
}

applyBazBash
