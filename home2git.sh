echo "...gitconfig"
cp -vf ~/.gitconfig .

echo "...bashrc"
cp -vf ~/.bashrc .

echo "...fish"
rsync -rahv ~/.config/fish/ fish --exclude completions --exclude fish_variables

echo "...nvim"
rsync -rahv ~/.config/nvim/ nvim --exclude plugin
