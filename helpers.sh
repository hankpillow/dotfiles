function ip(){
echo "$(ifconfig $1 2>/dev/null|awk '/inet / {print $2}'|sed 's/addr://')"
}
function rsa-create(){
	ssh-keygen -t rsa -b 4096 -C "$1"
	rsa-send-to-agent
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
}

function docker-clear(){
	docker rm -f "$(docker ps -a -q)"
}

function docker-create(){
	docker-machine create --driver virtualbox $1
}

function pacman-stop(){
	rm /var/lib/pacman/db.lck
}
