set fish_greeting ""
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --inline-info"
set -gx FZF_DEFAULT_COMMAND "fdfind --hidden -E .git -E node_modules"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx PATH node_modules/.bin $PATH

alias cp "cp -iv"
alias mv "mv -iv"
alias mkdir "mkdir -pv"
alias dir "dir --color=auto"
alias duh "du -ach"
alias g git
alias gb 'git branch | grep "*" | sed "s/* //"'
alias grep "grep --color=auto"
alias l "ls -1a"
alias ll "ls -alhp --color"
alias myip4 "dig @resolver1.opendns.com ANY myip.opendns.com +short -4"
alias myip6 "dig @resolver1.opendns.com ANY myip.opendns.com +short"
alias myip "curl ifconfig.co"
alias en0 "ipconfig getpacket en1 | grep -h ip"
alias en1 "ipconfig getpacket en1 | grep -h ip"
alias ports "lsof -Pn -i4 | grep LISTEN"
alias ports "lsof -Pn -i4 | grep LISTEN"
alias sudo "sudo "

# program aliases
alias vi "nvim"
alias fim "vim (fzf)"
alias job "echo (jobs|fzf) | awk '{print $1}' | fg"

# tmux
# alias tn "tmux new -s"
# alias ta "tmux attach "
# alias tk "tmux kill-session"

mkdir -p ~/.config/fish/functions/
echo fzf_key_bindings > ~/.config/fish/functions/fish_user_key_bindings.fish

## start asdf
if not test -f ~/.config/fish/completions/asdf.fish
	mkdir -p ~/.config/fish/completions; 
	ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

# export asdf
if test -f ~/.asdf/asdf.fish
	source ~/.asdf/asdf.fish
end

# export fd
if not test -f ~/.local/bin/fd 
	and type -q fdfind
	ln -s (which fdfind) ~/.local/bin/fd
end

# export lua lsp
if test -f ~/workspace/lua-language-server/bin
	set -gx PATH ~/workspace/lua-language-server/bin $PATH
end


# export catbat as bat
if not test -f ~/.local/bin/bat
	ln -s /usr/bin/batcat ~/.local/bin/bat
end
