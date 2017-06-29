#!/bin/bash

PAGE="$1"
REFERER=$(echo $PAGE | sed 's/http:\/\///' | sed 's/\/.*//g' )
DOMAIN=$(echo $REFERER | sed 's/^www//' | sed 's/^[0-9]//g' | sed 's/^\.//')
AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0"
DEPTH=1
DRY=0

function dump {
  echo ""
	echo "# Running crawler"
	echo "# page: $PAGE"
	echo "# domain: $DOMAIN"
	echo "# referer: http://$REFERER"
	echo "# depth: $DEPTH"
  echo "$ agent: $AGENT"
  echo ""
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
			--referer=*)
			REFERER="${i#*=}"
			shift
			;;
			-help|--help|-h)
			bold=$(tput bold)
			normal=$(tput sgr0)
			echo -e ""
			echo -e "${bold}spider.sh${normal} is a simple interface for most commom usage of wget as crawler"
			echo -e "Usage: spider.sh <URL> [OPTION]"
			echo -e ""
			echo -e "${bold}Options:"
			echo -e "\t ${bold}--domain${normal}\tDomain name to feed wget's -D. Default is extrating the domain from target URL"
			echo -e "\t ${bold}--agent${normal}\tUser agent to feed wget's --user-agent. Default is Mozilla"
			echo -e "\t ${bold}--depth${normal}\tDefine how deep the crawler can go in (wget's -l param). Default is 1"
			echo -e "\t ${bold}--referer${normal}\tRequest Referer (wget's --referer param). Default is extrating referer from target URL"
			echo -e "\t ${bold}--dry${normal}  \tJust dump the command without calling it. Good to see/edit before calling"
			exit
			;;
	esac
done

dump

CMD="wget --spider -r -l$DEPTH --max-redirect=10 --force-html -H -D$DOMAIN -nd -np -S --referer=http://$REFERER --user-agent=\"$AGENT\" $PAGE"
# CMD="wget --spider -r -l$DEPTH --max-redirect=10 --force-html -H -D$DOMAIN -nd -np -S --referer=http://$REFERER --user-agent=\"$AGENT\" $PAGE 2>&1"

if [[ $DRY == 0 ]];
then
	eval $CMD 2>&1
else
  echo "Run:"
	echo "$CMD"
fi
