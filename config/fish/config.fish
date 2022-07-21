#!/usr/bin/env fish
set -xU EDITOR "vim -f"
set -xU GIT_EDITOR "vim -f"
set -x UID (id -u)
set -x GID (id -g)

# fisher
set -x FZF_COMPLETE 1
set -x FZF_TMUX 1
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'

# for fisher
#for file in ~/.config/fish/conf.d/*.fish
#  source $file
#end

# The .ssh folder: 700 (drwx------)
chmod 700 ~/.ssh
# The private key: 600 (-rw-------)
chmod 644 ~/.ssh/*.pub
# The public key: 644 (-rw-r--r--)
ls ~/.ssh/* | grep -v pub | xargs chmod 600

source ~/.asdf/asdf.fish
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions


