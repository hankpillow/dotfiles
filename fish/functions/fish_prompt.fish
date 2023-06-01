function fish_prompt
	set laststatus $status
	set -g __fish_git_prompt_showupstream auto
	# set -g __fish_git_prompt_show_informative_status true
    set jobs_bg (jobs | head | wc -l) 
    if test $jobs_bg != "0"
        printf '%s ' (set_color purple) $jobs_bg
    end
	if [ $laststatus -eq 0 ]
		printf '%s' (set_color yellow --bold)(prompt_pwd)
	else
		printf '%s' (set_color red)(prompt_pwd) 
	end
	printf '%s' (set_color blue) (fish_git_prompt) 
	printf '%s\n' (set_color normal) '$ '
end
