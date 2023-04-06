#!/bin/bash
rsync -ravh fish/ ~/.config/fish --exclude completions --exclude fish_variables
