#run this, comment out after the shell is swapped to bash
#This config requires node, python2, python3, ruby
# Install Homebrew - this currently doesn't work as intended
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.zshrc
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc

#Kitty
brew install --cask kitty
brew install autoconf
brew install openssl@1.1
brew install wxwidgets
brew install libxslt fop

# Neovim
asdf plugin add neovim
asdf install neovim 0.7.0
asdf global neovim 0.7.0

#Erlang
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl@1.1)"
asdf install erlang 25.0.2
asdf global erlang 25.0.2

#Elixir
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.13.4-otp-25
asdf global elixir 1.13.4-otp-25

# NodeJs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.4.0
asdf global nodejs 18.4.0
npm i -g neovim

# Python
asdf plugin add python
asdf install python 3.10.0
asdf global python 3.10.0
python -m pip install --user --upgrade pynvim
sudo pip3 install powerline-status

# Ruby
asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest
gem install neovim

# Go
brew install coreutils
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang latest
asdf global golang latest

# Rust
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf install rust latest
asdf global rust latest

# Lua  - Does not work on MacOS at the moment
#asdf plugin-add luaJIT https://github.com/smashedtoatoms/asdf-luaJIT.git
#asdf install luaJIT latest
#asdf global luaJIT latest




# Tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Nvim Packer
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/opt/packer.nvim



#Non Standard Installations (Pls remember cleanup)
git clone git@github.com:ryanoasis/nerd-fonts.git
./nerd-fonts/install.sh Hack
rm -rf nerd-fonts/


#Brew Installations
brew install wget
brew install ctags
brew install fzf
brew install ripgrep
brew install fonts-powerline
brew install bat
brew install lsd
brew install starship





cp .zshrc ~/.zshrc
cp .starship.toml ~/.config/starship.toml
