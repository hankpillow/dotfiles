## personal dotfiles

Clone the repo, go to its folder and:

1. `./setup-vim [install]` will apply the vimrc file at user's home. with "install" arg will also install all plugins (slow)

2. `./setup-terminal.sh [fast]` will create a bash_profile file at user's home (this includes git autocomplete and docker autocomplete, and the process is slower). with "fast" arg the autocomplete libs wont be loaded

> every update will first check and backup the old version at the same addin a trailing "#timestamp#.bkp"
