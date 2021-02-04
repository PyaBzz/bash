#
bashrcFile=$HOME/.bashrc
bashModDir=$HOME/.bashMod
aliasDir=$bashModDir/aliases

isBashModded() {
    isBackedUp $bashrcFile
}
