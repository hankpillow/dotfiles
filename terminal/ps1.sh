#
# ps1.sh
#

get_ps1 () {
  local EXIT="$?"

  local RESET="\[$(tput sgr0)\]"

  local BBLACK="\[\e[1;30m\]"
  local BLACK="\[\e[0;30m\]"
  local BGBLACK="\[\e[40m\]"
  local RED="\[\e[0;31m\]"
  local BRED="\[\e[1;31m\]"
  local BGRED="\[\e[41m\]"
  local GREEN="\[\e[0;32m\]"
  local BGREEN="\[\e[1;32m\]"
  local BGGREEN="\[\e[1;32m\]"
  local YELLOW="\[\e[0;33m\]"
  local BYELLOW="\[\e[1;33m\]"
  local BGYELLOW="\[\e[1;33m\]"
  local BLUE="\[\e[0;34m\]"
  local BBLUE="\[\e[1;34m\]"
  local BGBLUE="\[\e[1;34m\]"
  local MAGENTA="\[\e[0;35m\]"
  local BMAGENTA="\[\e[1;35m\]"
  local BGMAGENTA="\[\e[1;35m\]"
  local CYAN="\[\e[0;36m\]"
  local BCYAN="\[\e[1;36m\]"
  local BGCYAN="\[\e[1;36m\]"
  local WHITE="\[\e[0;37m\]"
  local BWHITE="\[\e[1;37m\]"
  local BGWHITE="\[\e[1;37m\]"

  local BRANCH=""

  if [ -n "$(type -t __git_ps1)" ] && [ "$(type -t __git_ps1)" = function ]; then
    BRANCH="$(__git_ps1)"
  fi

  if [ $EXIT != 0 ]; then
    ST=${RED}
  else
    ST=${GREEN}
  fi

  # local DOCKER="$(__docker_machine_ps1 | sed 's/\s//g')"
  # PS1="${ST}⦁${BLUE}\D{%T} ${WHITE}\u ${BLUE}\j${BYELLOW}${BRANCH} ${GREEN}${PWD#"${PWD%/*/*}/"} ${WHITE}> "
  # PS1='${ST}\D{%T} ${BLUE}\j${BYELLOW}${BRANCH} ${GREEN}\W ${WHITE}> '
  export PS1="${ST}\D{%T} ${BGCYAN}\j ${BBLUE}\w${BYELLOW}${BRANCH}\n${RESET}> "
}
PROMPT_COMMAND=get_ps1
