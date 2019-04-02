## Synopsis

This is my personal vim configuration


## Installation

Clone this repository, then:

cd bundle

$ git clone https://github.com/VundleVim/Vundle.vim.git vundle

launch vim

type :VundleInstall

Install fonts via "apt-get install fonts-powerline"

or 

Manually install [fonts](https://powerline.readthedocs.io/en/master/installation/linux.html#fonts-installation)

## Features

* autocomplete support for PHP
* syntax highligthing for PHP
* git; show difference in the "gutter" (sign column). Shows lines that have been added-removed-modified
* ctags support
* syntax checking for virtually every language you will use
* folding support for PHP
* auto-creation of getters and setters for PHP (use ctrl-p)
* file browser (use ctrl-n to enable/disable it)
* buffer explorer (ctrl-b) shows open buffers
* tagbar (ctrl-t) shows a tagbar with functions and symbols, allows to navigate
* PHP refactoring support: shortcuts to rename variables, methods, classes and other refactoring facilities
* syntax highlighting for TWIG
* vim-sync: with ctrl-u you can upload a file to testing/production, you can write your own script to do it
* full GIT support via vim-fugitive, you can do all git operations from within vim
* specific vim-fugitive support for gitlab (you can configure your domain in vimrc)
* fuzzy-finder (ctrl-f) to make fuzzy searches for files, buffers, bookmarks, tags 
* vdebug support: you can remotely debug from within vim
* auto-pairs; autocompletes pharenteses, quotes
* full-featured status line
* PHP documentator; with ctrl-d automatically generates documentation
* comment blocks of code with gc{motion} or by visual selecting and then gc. see tcomment_vim for further details

## Keyboard shortcuts

* ctrl-left and ctrl-right navigate between buffers
* ctrl-j jumps to tag
* shift-arrows resize tabs, both horizontally and vertically
* ctrl-l cleans urls: removes everything except the domain, in the whole file
* ctrl-k removes duplicate lines in the file, without sorting, keeps the first occurance, pretty fast
* ctrl-i assuming that the current file contains a list of domains, removes all the subdomains of domains that are present in the file, without sorting, keeps the first occurance, may be slow if the list contains thousands of entries
* ctrl-\ followed by: s to find symbol, g find global, c find calls, t find text, e egrep, f find file, i find includes, d find called
* ctrl-g updates ctags and cscope for current project
* ctrl-a my own domain blacklisting tool
