#!/bin/bash

# THIS IS FOR DEB/APT BASED SYSTEMS

# First update the repositories
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

apt update

apt upgrade

# Next we fetch the programs we want to use.

apt install git curl lxappearance i3-wm rofi i3blocks compton pavucontrol arc-theme numix-icon-theme
shutter blueman spotify-client qbittorrent vim-gtk zsh acpi python3-pip python3-pip feh
# Next we fetch programs that are not in the standard repositories

mkdir ./tmp/

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ./tmp

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.0.5-amd64.deb -P ./tmp

# playerctl
wget https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb

dpkg -i ./tmp/*.deb

apt install -f

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Install powerline fonts

git clone https://github.com/powerline/fonts.git --depth=1

fonts/install.sh

rm -rf ./fonts


# Move dotfiles
cp -r ./i3 ~/.config/

mkdir -p ~/.config/compton

cp ./compton.conf ~/.config/compton

cp ./Xresources ~/.Xresources

cp ./vimrc ~/.vimrc

cp -r ./wallpapers ~/Pictures/


# i3 blocks files

wget https://raw.githubusercontent.com/vivien/i3blocks-contrib/master/key_layout/key_layout -O
/usr/share/i3blocks

chmod 755 /usr/share/i3blocks/key_layout

wget https://raw.githubusercontent.com/vivien/i3blocks-contrib/master/battery2/battery2 -O
/usr/share/i3blocks

rm /usr/share/i3blocks/battery

mv /usr/share/i3blocks/battery2 /usr/share/i3blocks/battery

chmod 755 /usr/share/i3blocks/battery

# Install python powerline
pip3 install python-powerline

# Install font awesome
wget https://github.com/FortAwesome/Font-Awesome/archive/v4.7.0.zip 

unzip Font*.zip

cp Font*/fonts/*.ttf /usr/share/fonts/

rm -rf Font-Awesome*

# Install vim plugins
vim +PluginInstall +qall

rm -rf ./tmp/

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ./zshrc ~/.zshrc
