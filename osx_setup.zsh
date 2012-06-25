#!/bin/zsh
# This script sets up a fresh osx install
# Prerequisites include:
#			1) Command line tools for xcode
echo "install homebrew"
/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)" && \

echo "go to town with some brews"
brew install mysql && \
brew install git && \
brew install zsh && \
brew install tmux && \
brew install vim && \

echo "rvm with ruby"
curl -L https://get.rvm.io | bash -s stable --ruby && \

echo "install dot files"
cd ~ && git clone git@gitlab.com:chumpy/dot_files.git && \
ln -s ~/dot_files/.zshrc ~/.zshrc && \
ln -s ~/dot_files/.tmux.config ~/.tmux.config && \
ln -s ~/dot_files/.vimrc ~/.vimrc && \
source ~/.zshrc && \

echo "default shell house keeping" # FIXME - the version in the zsh path makes this brittle
sudo mv /bin/zsh /bin/zsh.BAK && sudo ln -s /usr/local/Cellar/zsh/4.3.17/bin/zsh /bin/zsh && \
chsh -s /bin/zsh && \

echo "install pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim && \

echo "solarized terminal colors"
cd ~ && \
git clone https://github.com/altercation/solarized.git && \
cd ~/solarized/vim-colors-solarized/colors && \
mv solarized.vim ~/.vim/colors/ && \
cd ~ && \

