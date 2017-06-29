#!/bin/bash

PAGE="$1"
REFERER=$(echo $PAGE | sed 's/http:\/\///' | sed 's/\/.*//g' )
DOMAIN=$(echo $REFERER | sed 's/^www//' | sed 's/^[0-9]//g' | sed 's/^\.//')
AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0"
DEPTH=1
DRY=0
APPEND=""

bold=$(tput bold)
normal=$(tput sgr0)
function help {
  echo -e ""
  echo -e "${bold}spider.sh${normal} is a simple interface for most commom usage of wget as crawler"
  echo -e "Usage: spider.sh <URL> [OPTION]"
  echo -e ""
  echo -e "${bold}Options:"
  echo -e " ${bold}--domain${normal}\tDomain name to feed wget's -D. Default is extrating the domain from target URL"
  echo -e " ${bold}--agent${normal}\tUser agent to feed wget's --user-agent. Default is Mozilla"
  echo -e " ${bold}--depth${normal}\tDefine how deep the crawler can go in (wget's -l param). Default is 1"
  echo -e " ${bold}--referer${normal}\tRequest Referer (wget's --referer param). Default is extrating referer from target URL"
  echo -e " ${bold}--dry${normal}  \tJust dump the command without calling it. Good to see/edit before calling"
  echo -e " ${bold}--append${normal}  \tAppend whichever flag you want. good for unusual cases of ssl etc. ex: --append=\"--secure-protocol=TLSv1\""
}

for i in "$@"
do
	case $i in
			--domain=*)
			DOMAIN="${i#*=}"
			shift
			;;
			--agent=*)
			AGENT="${i#*=}"
			shift
			;;
			--dry)
			DRY=1
			shift
			;;
			--depth=*)
			DEPTH="${i#*=}"
			shift
			;;
			--append=*)
			APPEND="${i#*=}"
			shift
			;;
			--referer=*)
			REFERER="${i#*=}"
			shift
			;;
			-help|--help|-h)
      help
			exit
			;;
	esac
done

if [[ $PAGE == "" ]];
then
  help

else
  CMD="wget --spider -r -l$DEPTH --no-check-certificate --max-redirect=10 --force-html -H -D$DOMAIN -nd -np -S --referer=http://$REFERER --user-agent=\"$AGENT\" $APPEND $PAGE"
  echo -e "${bold}Running:${normal}"
  echo "$CMD"

  if [[ $DRY == 0 ]];
  then
    eval $CMD 2>&1
  fi

fi
