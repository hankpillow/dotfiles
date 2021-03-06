function fish_prompt
  # current time
  set -l last_status $status
  if test $last_status -ne 0
    set status_color (set_color red -o)
  else
    set status_color (set_color cyan)
  end
  echo -n -s $status_color (date '+%T')

  # jobs
  set -l runningjobs (jobs | wc -l | grep -oh "[0-9]")
  echo -n -s (set_color normal) " " $runningjobs

  # working dir
  set -l cwd (prompt_pwd)
  echo -n -s " " (set_color green) $cwd ""

  # git branch

  if test -e  $HOME/.config/fish/functions/git_is_repo.fish && git_is_repo
    echo -n -s " " (set_color white -o) "(" (git_branch_name) ")"
  end

  # done
  echo -n -s (set_color normal) " "
end
