#!/bin/zsh
# This script sets up a fresh osx install
# Prerequisites include:
#			1) Command line tools for xcode
# step 1: install homebrew
/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
# step 2: go to town with some brews
brew install mysql
brew install git
brew install zsh
brew install tmux
brew install vim
# step 3: rvm with ruby
curl -L https://get.rvm.io | bash -s stable --ruby
# step 4: install dot files
cd ~ && git clone git@gitlab.com:chumpy/dot_files.git
ln -s ~/dot_files/.zshrc ~/.zshrc
ln -s ~/dot_files/.tmux.config ~/.tmux.config
ln -s ~/dot_files/.vimrc ~/.vimrc
# step 5: default shell house keeping
sudo mv /bin/zsh /bin/zsh.BAK && sudo ln -s /usr/local/Cellar/zsh/4.3.17/bin/zsh /bin/zsh
chsh -s /bin/zsh

