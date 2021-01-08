# upgrade existing packages
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove

# install new packages
sudo apt install -y vim tree tmux ripgrep python3-pip python3-dev cmake git curl htop gparted net-tools build-essential

# install python packages
sudo pip3 install virtualenv jupyter numpy pandas matplotlib

# add to .bashrc
cat .bashrc_to_add >> ~/.bashrc
mv .bashrc_to_add .bashrc_added # keeps script idempotent

# setup tmux
cp .tmux.conf ~/.tmux.conf

# setup git
cp .gitconfig ~/.gitconfig

# setup vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp my_configs.vim ~/.vim_runtime/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer
