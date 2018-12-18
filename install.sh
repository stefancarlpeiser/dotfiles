#!/bin/bash

# THIS IS FOR DEB/APT BASED SYSTEMS
apt update

apt upgrade -y

# Next we fetch the programs we want to use.
xargs -d '\n' -- apt install -y < ./programs.txt

# Next we fetch programs that are not in the standard repositories

snap install spotify
snap install slack

mkdir ./tmp/

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ./tmp


# playerctl
wget https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb

dpkg -i ./tmp/*.deb

apt install -y -f

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Move dotfiles
cp -r ./i3/config-single-monitor ~/.config/i3/config
cp -r ./i3/i3blocks-desktop.conf ~/.config/i3/i3blocks.conf

mkdir -p ~/.config/compton

cp ./compton.conf ~/.config/compton

cp ./Xresources ~/.Xresources

cp ./vimrc ~/.vimrc

cp -r ./wallpapers ~/Pictures/


# i3 blocks files

wget https://raw.githubusercontent.com/vivien/i3blocks-contrib/master/key_layout/key_layout -O /usr/share/i3blocks

chmod 755 /usr/share/i3blocks/key_layout

#wget https://raw.githubusercontent.com/vivien/i3blocks-contrib/master/battery2/battery2 -O /usr/share/i3blocks

#rm /usr/share/i3blocks/battery

rm /usr/share/i3blocks/mediaplayer

wget https://raw.githubusercontent.com/vivien/i3blocks-contrib/master/mediaplayer/mediaplayer -O /usr/share/i3blocks

#mv /usr/share/i3blocks/battery2 /usr/share/i3blocks/battery

#chmod 755 /usr/share/i3blocks/battery /usr/share/i3blocks/mediaplayer

# Install python powerline
pip3 install powerline-status

# Install powerline Go
go get -u github.com/justjanne/powerline-go

# Install vim plugins
vim +PluginInstall +qall

rm -rf ./tmp/

# Install oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

cp ./zshrc ~/.zshrc

chown -R stefan:stefan /home/stefan/

usermod -s /bin/zsh $(cut -d: -f1 /etc/passwd | tail -n1)
