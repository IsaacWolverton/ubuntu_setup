set splitbelow
set splitright
set nocompatible
filetype off
set nowrap
set number
set cc=100

fun! SetTab(num)
    let &l:tabstop = a:num
    let &l:shiftwidth = a:num
endfun

command! -nargs=1 SetTab :call SetTab(<q-args>) " allows for 'SetTab 2' instead of ':call SetTab(2)'

inoremap jk <Esc>
inoremap kj <Esc>

" Space to toggle fold
nnoremap <space> za

" Y to copy until end of line
nnoremap Y y$

" ,+s to substitute all instances of word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'justinmk/vim-sneak'
call plug#end()

" coc.nvim related settings ####################################################
set updatetime=300

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" ##############################################################################
