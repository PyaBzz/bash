alias daze='date +"year: %Y, month: %m, day: %d, hours: %H, minutes: %M" | tee /dev/tty | tr -d "\n" | clip.exe'

alias dockerps="docker ps --format 'table{{.Names}}\t{{.ID}}\t{{.Status}}\t{{.Ports}}'"
alias dockeru="docker-compose up -d"
alias dockerd="docker-compose down"
alias dockers="docker stop"
