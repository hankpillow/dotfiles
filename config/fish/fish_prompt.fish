# strongly based on omf/theme-default
function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l runningjobs (jobs | wc -l | grep -oh "[0-9]")
  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄ "
  set -l dirty    "⨯"
  set -l none     "◦"
  set -l status_color (set_color green)

  if test $last_command_status -ne 0
    set status_color (set_color red -u)
  end

  echo -n -s (set_color cyan) $runningjobs

  if git_is_repo
    echo -n -s " " (set_color blue) $cwd (set_color normal)
    echo -n -s " " (set_color yellow --bold) "(" (git_branch_name)

    if git_is_touched
      echo -n -s " " $dirty
    else
      echo -n -s " " (git_ahead $ahead $behind $diverged $none)
    end

    echo -n -s ")"

  else
    echo -n -s " " (set_color blue) $cwd (set_color normal)
  end

  echo -n -s " " $status_color "\$" (set_color normal) " "
end
