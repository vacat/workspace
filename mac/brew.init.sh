#!usr/bin/env bash

# 1. install home brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 2. prepare for multi-users
sudo chgrp -R brew /usr/local
sudo chmod -R g+w /usr/local
sudo chgrp -R brew /Library/Caches/Homebrew
sudo chmod -R g+w /Library/Caches/Homebrew

# 3. install brew cask
