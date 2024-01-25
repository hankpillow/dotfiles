
set fish_greeting ""
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --inline-info"
set -gx FZF_DEFAULT_COMMAND "fd --hidden -E .git -E node_modules"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx TERM xterm
# set -gx TERM screen-256color
set -gx EDITOR nvim
set -gx PATH ~/workspace/node_modules/.bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH

# export lua lsp
if test -f ~/workspace/lua-language-server/bin/lua-language-server
	set -gx PATH ~/workspace/lua-language-server/bin $PATH
end

set -gx DISPLAY_NUMBER "0.0"
set -gx DISPLAY (grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):$DISPLAY_NUMBER

alias cp "cp -iv"
alias mv "mv -iv"
alias mkdir "mkdir -pv"
alias dir "dir --color=auto"
alias duh "du -ach"
alias g git
alias gb 'git branch | grep "*" | sed "s/* //"'
alias grep "grep --color=auto"
alias l "exa -1a"
alias ll "exa --icons --git -lau"
# alias ll "ls -alhp --color"
alias myip4 "dig @resolver1.opendns.com ANY myip.opendns.com +short -4"
alias myip6 "dig @resolver1.opendns.com ANY myip.opendns.com +short"
alias myip "curl ifconfig.co"
alias en0 "ipconfig getpacket en1 | grep -h ip"
alias en1 "ipconfig getpacket en1 | grep -h ip"
alias ports "lsof -Pn -i4 | grep LISTEN"
alias sudo "sudo "
alias open "explorer.exe"
alias ex "exa --long --git -a"
alias groot "cd (git rev-parse --show-toplevel)"
# program aliases
alias vi "nvim"
alias fim "nvim (fzf)"
alias job "echo (jobs|fzf) | awk '{print $1}' | fg"

# python setup
alias python "python3"
alias pip "pip3"

function tml ; tmux ls; end
function tmc ; tmux -2 new -s $argv; end
function tma ; tmux attach-session -t $argv; end
function tmk ; tmux kill-session -t $argv; end

function gtree
    git co -b $argv
    set -l slug (string replace -r -a '/' '-' $argv)
    git worktree add -f "tree-$slug" $argv
    cd "tree-$slug"
    echo "worktree $argv created!"
    echo "-> gtree-init to setup links"
end

function gtree-init
    git submodule update --init
    ln -s ../node_modules .
    cd src/core
    ln -s ../../../src/core/node_modules/ node_modules
    cd -
    npm run build:tokens
end

## config asdf autocomplete
if not test -f ~/.config/fish/completions/asdf.fish
	mkdir -p ~/.config/fish/completions; 
	ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

# export asdf
if test -f ~/.asdf/asdf.fish
	source ~/.asdf/asdf.fish
end

# start starship as promp
if type -q starship
    starship init fish | source
else
    echo "install starship for better prompt"
end

mkdir -p ~/.config/fish/functions/
echo fzf_key_bindings > ~/.config/fish/functions/fish_user_key_bindings.fish
