function ls
	switch (uname)
		case Linux
			command ls --color=auto
		case Darwin
			command ls -G
	end
end
