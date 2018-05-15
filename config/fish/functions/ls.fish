function ls
	switch (uname)
		case Linux
			command ls --color=auto $argv
		case Darwin
			command ls -G $argv
	end
end
