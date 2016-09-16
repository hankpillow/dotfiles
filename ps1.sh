
#REGULAR TEXT COLOR
BLACK='\[\e[0;30m\]'

#BOLD TEXT COLOR
BBLACK='\[\e[1;30m\]'

#BACKGROUND COLOR
BGBLACK='\[\e[40m\]'
RED='\[\e[0;31m\]'
BRED='\[\e[1;31m\]'
BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
BGREEN='\[\e[1;32m\]'
BGGREEN='\[\e[1;32m\]'
YELLOW='\[\e[0;33m\]'
BYELLOW='\[\e[1;33m\]'
BGYELLOW='\[\e[1;33m\]'
BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
BGBLUE='\[\e[1;34m\]'
MAGENTA='\[\e[0;35m\]'
BMAGENTA='\[\e[1;35m\]'
BGMAGENTA='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
BCYAN='\[\e[1;36m\]'
BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
BWHITE='\[\e[1;37m\]'
BGWHITE='\[\e[1;37m\]'

get_ps1(){
	local BRANCH="$(__git_ps1)"
	local DOCKER="$(__docker_machine_ps1 | sed 's/\s//g')"
	PS1="$CYAN\D{%T} ${BGMAGENTA}\j $WHITE\w$BGCYAN${BRANCH} \n$BGWHITE${DOCKER}$WHITE\u@\h $ "
	#PS1="$DOCKER $ "
}
PROMPT_COMMAND=get_ps1
