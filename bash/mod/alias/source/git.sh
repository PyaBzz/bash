alias g='git status && gitWindowTab'
alias giff='git diff'
alias gadd='git add'
alias getch='git fetch && g'
alias gull='git pull'
alias gush='git push'
alias geckout='git checkout'
alias gistash='git stash'
alias granch='git branch'
alias gommit='git commit'
alias glog='git log'
alias glean='git clean'

alias gitFilenamesPipe='git diff HEAD --name-only | xargs '
alias gitChmod='gitFilenamesPipe chmod -x && gitFilenamesPipe ll'
alias gitBranchNamesPipe='git for-each-ref refs/heads --format="%(refname:short)" | xargs '
alias gitWindowTab='echo -ne "\033]0;$(basename `git rev-parse --show-toplevel`)\a"'
