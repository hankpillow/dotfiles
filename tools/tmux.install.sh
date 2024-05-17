if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache

curl -s https://api.github.com/repos/nelsonenzo/tmux-appimage/releases/latest \
| grep "browser_download_url.*appimage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - \
&& chmod +x tmux.appimage

## optionaly, move it into your $PATH
sudo mv tmux.appimage /usr/local/bin/tmux
echo "tmux installed at /usr/local/bin/tmux"
cd -
