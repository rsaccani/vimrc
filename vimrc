" Vundle
filetype off
filetype plugin indent on " Turns on filetype detection, filetype plugins, and filetype indenting all of which add nice extra features to whatever language you're using
syntax enable             " Turns on filetype detection if not already on, and then applies filetype-specific highlighting.

set nocompatible " to get all the Vim-only options
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'

" better syntax highlighting
Plugin 'StanAngeloff/php.vim'

" autocomplete for php
Plugin 'shawncplus/phpcomplete.vim'
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_parse_docblock_comments = 0
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ctags
Plugin 'szw/vim-tags'

" code validation
Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type":    "style" }

" folding
Plugin 'swekaj/php-foldexpr.vim'
let b:phpfold_use = 1 " - Fold groups of use statements in the global scope.
let b:phpfold_group_iftry = 0 " - Fold if/elseif/else and try/catch/finally blocks as a group, rather than each part separate.
let b:phpfold_group_args = 1 " - Group function arguments split across multiple lines into their own fold.
let b:phpfold_group_case = 1 " - Fold case and default blocks inside switches.
let b:phpfold_heredocs = 1 " - Fold HEREDOCs and NOWDOCs.
let b:phpfold_docblocks = 0 " - Fold DocBlocks.
let b:phpfold_doc_with_funcs = 0 " - Fold DocBlocks. Overrides `b:phpfold_docblocks`.
let b:phpfold_text = 1 " - Enable the custom `foldtext` option.
let b:phpfold_text_right_lines = 1 " - Display the line count on the right instead of the left.
let b:phpfold_text_percent = 0 " - Display the percentage of lines the fold represents.
" toggle
map <F5> za
" expand all from current pos
map <F6> zO
" expand all
map <F7> zR
" clase all
map <F8> zM
" default foldlevel
set foldlevelstart=1
" override debian default
set foldenable

" File browsing
Plugin 'scrooloose/nerdtree'
" ctrl-n
map <C-n> :NERDTreeToggle<CR>
" open if no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if this is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Buffer explorer
Bundle 'jeetsukumaran/vim-buffergator'
map <C-b> :BuffergatorToggle<CR>

" Tag Bar
Plugin 'majutsushi/tagbar'
map <C-t> :TagbarToggle<CR>

" PHP refactoring
Plugin 'adoy/vim-php-refactoring-toolbox'
let g:vim_php_refactoring_phpdoc = "pdv#DocumentCurrentLine"

" PHP documentator
Bundle 'tobyS/pdv'
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
map <buffer> <C-p> :call pdv#DocumentCurrentLine()<CR>
Plugin 'tobyS/vmustache'

" twig highlight
Plugin 'evidens/vim-twig'

" Fuzzy find
Plugin 'eparreno/vim-l9'
Plugin 'vim-scripts/FuzzyFinder'
map <C-m> :FufCoverageFile<CR>

" vim-sync
Plugin 'eshion/vim-sync'
autocmd BufWritePost * :call SyncUploadFile()
nnoremap <C-u> <ESC>:call SyncUploadFile()<CR>


call vundle#end()
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

" php manual
autocmd FileType php set keywordprg=pman

" color
colorscheme desert
" autocomplete box colors
highlight Pmenu guifg=cyan guibg=darkgray
highlight Pmenusel guifg=darkgray guibg=cyan
highlight Pmenu ctermfg=cyan ctermbg=darkgray
highlight Pmenusel ctermfg=darkgray ctermbg=cyan

" presentation
set nu
set cursorline
set showmode  " shows the current mode
set backspace=indent,eol,start "backspaces behave like backspaces
set hidden "good multi-file behaviors
set wildmenu "better command line completion
set wildmode=list:longest " completion acts like the shell
set ignorecase  "case-insensitive searching
set smartcase "unless there's a capital letter there
set ruler "show cursor position in the corner
set hlsearch "highlight search matches
set incsearch "highlight search matches as I type
set laststatus=2 " Always show a status line at the bottom
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set wrap  "linewraps
set scrolloff=5 "always show 5 lines before/after the cursor
set title "update term title
set visualbell "turn off audio beeps


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Navigation
" ctrl-left, ctrl-right switch between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
" ctrl-j jumps to tag
noremap <silent> <C-j> <C-]>
" fix for ctrl-left and ctrl-right in screen
set term=xterm

