# upgrade existing packages
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove

# install new packages
sudo apt install -y vim tree tmux ripgrep python3-pip python3-dev cmake git curl htop gparted net-tools build-essential pigz parallel

# install python packages
sudo pip3 install virtualenv jupyter numpy pandas matplotlib autopep8 joblib

# install nodejs lts
curl -sL install-node.vercel.app/lts | sudo bash -s -- -y

# add to .bashrc
cat .bashrc_to_add >> ~/.bashrc
mv .bashrc_to_add .bashrc_added # keeps script idempotent

# setup tmux
cp .tmux.conf ~/.tmux.conf

# setup git
cp .gitconfig ~/.gitconfig

# setup fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# setup vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp my_configs.vim ~/.vim_runtime/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
vim +'CocInstall -sync coc-pyright' +qall
vim +CocUpdateSync +qall
