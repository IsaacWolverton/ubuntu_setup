set splitbelow
set splitright
set nocompatible
filetype off
set nowrap
set number
set cc=80

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
