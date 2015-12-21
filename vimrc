" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" better syntax highlighting
Plugin 'StanAngeloff/php.vim'
" ctags
Plugin 'szw/vim-tags'
" code validation
Plugin 'joonty/vim-phpqa'
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_autorun = 0
call vundle#end()
filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" tab 4 chars
set expandtab
set tabstop=4
set shiftwidth=4

" syntax
syntax on

" menu
set wildmenu

autocmd FileType php set keywordprg=pman


