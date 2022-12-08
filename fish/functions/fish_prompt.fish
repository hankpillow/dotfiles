function fish_prompt
	set laststatus $status
	set -g __fish_git_prompt_showupstream auto
	set -g __fish_git_prompt_show_informative_status true
	if [ $laststatus -eq 0 ]
		printf '%s' (set_color white --bold)(prompt_pwd)
	else
		printf '%s' (set_color red)(prompt_pwd) 
	end
	printf '%s' (set_color blue) (fish_git_prompt) 
	printf '%s' (set_color normal) ' $ '
end
