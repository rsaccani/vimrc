
filetype off
filetype plugin indent on " Turns on filetype detection, filetype plugins, and filetype indenting
syntax enable             " Turns on filetype detection and applies filetype-specific highlighting.

set nocompatible " to get all the Vim-only options
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'

" show added-changed-removed lines
Bundle 'airblade/vim-gitgutter'

" better syntax highlighting for php
Plugin 'StanAngeloff/php.vim'

" autocomplete for php
Plugin 'shawncplus/phpcomplete.vim'
let g:phpcomplete_complete_for_unknown_classes = 0
let g:phpcomplete_search_tags_for_variables = 0
let g:phpcomplete_parse_docblock_comments = 1
"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"            \ "\<lt>C-n>" :
"            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
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
"map <F5> za
" expand all from current pos
"map <F6> zO
" expand all
"map <F7> zR
" clase all
"map <F8> zM
" default foldlevel
set foldlevelstart=20
" override debian default
set foldenable

" getters and setters
Plugin 'docteurklein/php-getter-setter.vim'
map <buffer> <C-p> <Plug>PhpgetsetInsertBothGetterSetter

" File browsing
Plugin 'scrooloose/nerdtree'
" ctrl-n
map <C-n> :NERDTreeToggle<CR>
" open if no file
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if this is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize = 50
let NERDTreeQuitOnOpen=1

" Buffer explorer
let g:buffergator_suppress_keymaps=1 
Bundle 'jeetsukumaran/vim-buffergator'
map <C-b> :BuffergatorToggle<CR>
let g:buffergator_vsplit_size=80

" Tag Bar
Plugin 'majutsushi/tagbar'
map <C-t> :TagbarToggle<CR>

" PHP refactoring
Plugin 'adoy/vim-php-refactoring-toolbox'
let g:vim_php_refactoring_phpdoc = "pdv#DocumentCurrentLine"
" Default mappings
" nnoremap <unique> <Leader>rlv :call PhpRenameLocalVariable()<CR>
" nnoremap <unique> <Leader>rcv :call PhpRenameClassVariable()<CR>
" nnoremap <unique> <Leader>rm :call PhpRenameMethod()<CR>
" nnoremap <unique> <Leader>eu :call PhpExtractUse()<CR>
" vnoremap <unique> <Leader>ec :call PhpExtractConst()<CR>
" nnoremap <unique> <Leader>ep :call PhpExtractClassProperty()<CR>
" vnoremap <unique> <Leader>em :call PhpExtractMethod()<CR>
" nnoremap <unique> <Leader>np :call PhpCreateProperty()<CR>
" nnoremap <unique> <Leader>du :call PhpDetectUnusedUseStatements()<CR>
" vnoremap <unique> <Leader>== :call PhpAlignAssigns()<CR>
" nnoremap <unique> <Leader>sg :call PhpCreateSettersAndGetters()<CR>
" nnoremap <unique> <Leader>da :call PhpDocAll()<CR>

" twig highlight
Plugin 'evidens/vim-twig'

" Fuzzy find
Plugin 'eparreno/vim-l9'
Plugin 'vim-scripts/FuzzyFinder'
map <C-m> :FufCoverageFile<CR>
unmap <CR>

" vim-sync
Plugin 'eshion/vim-sync'
"autocmd BufWritePost * :call SyncUploadFile()
nnoremap <C-u> <ESC>:call SyncUploadFile()<CR>

" fugitive
Plugin 'tpope/vim-fugitive'

" fugitive-gitlab
Plugin 'shumphrey/fugitive-gitlab.vim'
let g:fugitive_gitlab_domains = ['http://code.libra.srl']

" supertab
Plugin 'ervandew/supertab'

" Vdebug
Bundle 'joonty/vdebug.git'
if !exists("g:vdebug_options")
        let g:vdebug_options = {}
endif
let g:vdebug_options['path_maps'] = {"/var/www/html": "/home/rsa/git/Esva"}

" auto pairs
Bundle 'jiangmiao/auto-pairs'

" better statusline
" You should also install the font:
" https://powerline.readthedocs.org/en/master/installation/linux.html#fontconfig
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline_section_z = "0x%B %3p%% %#__accent_bold#%{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#%#__restore__#%#__accent_bold#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#%#__restore__# :%3v "

" PHP documentator
Bundle 'tobyS/pdv'
Plugin 'tobyS/vmustache'
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
map <C-d>  :call pdv#DocumentCurrentLine()<CR>

" Comments
Plugin 'tomtom/tcomment_vim'

" Save old versions of file on save
"Plugin 'vim-scripts/savevers.vim'
"set backup
"set patchmode=.clean
"let savevers_dirs='.ignore/backup,.backup,/home/rsa/.vim/backup'
"let savevers_types = "*.c,*.h,*.vim,*.php,*.css,*.js.*.cf,*.pm,*.sh,*.conf"
"let savevers_max = 99


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
colorscheme slate
" autocomplete box colors
"highlight Pmenu guifg=cyan guibg=darkgray
"highlight Pmenusel guifg=darkgray guibg=cyan
"highlight Pmenu ctermfg=cyan ctermbg=darkgray
"highlight Pmenusel ctermfg=darkgray ctermbg=cyan

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
set wrap  "linewraps
set scrolloff=5 "always show 5 lines before/after the cursor
set title "update term title
set visualbell "turn off audio beeps


set laststatus=2 " Always show a status line at the bottom
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Navigation
" ctrl-left, ctrl-right switch between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
" ctrl-j jumps to tag
noremap <silent> <C-j> <C-]>
" + and - horizontally resize tabs
if bufwinnr(1)
    map <S-Right> <C-W>>
    map <S-Left> <C-W><
    map <S-Down> <C-W>+
    map <S-Up> <C-W>-
endif  
" fix for ctrl-left and ctrl-right in screen
set term=xterm
" Alt-arrows change window
map <Leader><Up> <C-W><Up>
map <Leader><Down> <C-W><Down>
map <Leader><Left> <C-W><Left>
map <Leader><Right> <C-W><Right>
" allow thte mouse to select the window
set mouse+=a
set ttymouse=xterm2
" to make airline themes work fine
set t_Co=256
" ctrl-l clean urls
noremap <silent> <C-l> :.,$s/\[\.\]/./e<CR>:.,$s/\ .*//e<CR>:.,$s/\(https\?:\/\/\)\?\(www\.\)\?\([^/]*\).*/\3/ie<CR>:noh<CR>
" ctrl-k remove duplicates without sorting, keeps first one
"noremap <silent> <C-k> :GitGutterDisable<CR>:g/^/m0<CR>:g/^\(.*\)\n\1$/d<CR>:g/^/m0<CR>:noh<CR>:GitGutterEnable<CR>
noremap <silent> <C-k> :%!awk '\!a[$0]++'<CR>


" cscope
if has("cscope")
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag
    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0
    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    " show msg when any other cscope db added
    set cscopeverbose  
    " key bindings
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  
    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR> 
    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left
    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>   
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100
endif

" Change search highlight colors
hi  Search ctermfg=black ctermbg=brown
