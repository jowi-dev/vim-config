#This config requires node, python2, python3, ruby
asdf plugin-install ruby
asdf plugin-install python
asdf install ruby 3.0.2
asdf install python 3.6.12
asdf plugin install python 2.7.6

#Nvim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


#Non Standard Installations (Pls remember cleanup)
git clone git@github-dev:ryanoasis/nerd-fonts.git
./nerd-fonts/install.sh Hack
rm -rf nerd-fonts/

wget https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb
wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb
sudo dpkg -i bat_0.11.0_amd64.deb lsd_0.20.1_amd64.deb
rm bat_0.11.0_amd64.deb lsd_0.20.1_amd64.deb

#Apt Installations
sudo apt-get install ctags
sudo apt install tmux
sudo apt-get install fzf
sudo apt-get install ripgrep
sudo apt-get install fonts-powerline

#installing bat via apt causes the executable to be named batcat.
#create a symlink so the system still knows where to find bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat


sudo pip3 install powerline-status
npm i -g neovim


cp .bash_aliases ~/
cp alacritty.yml ~/
cp .nvimrc ~/

mkdir -p ~/.config/nvim
echo 'source ~/.nvimrc' > ~/.config/nvim/init.vim
