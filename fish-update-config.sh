#!/bin/bash

# Send local
cp -v config/fish/functions/*.fish ~/.config/fish/functions/
cp -v config/fish/config.fish ~/.config/fish/

# Grant proper permissions
chmod +x ~/.config/fish/functions/*.fish
