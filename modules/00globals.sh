#
bashrcFile=$HOME/.bashrc
bashModDir=$HOME/.bashMod
aliasDir=$bashModDir/aliases
desktopDir=$HOME/Desktop

isBashModded() {
    isBackedUp $bashrcFile
}
