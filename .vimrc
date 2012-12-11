call pathogen#infect()

:se tabstop=4
:se shiftwidth=4 
:se softtabstop=4
:se expandtab

:se autoindent
:se nu
:se mouse=a
:se hlsearch

syntax on
filetype plugin indent on

if has('gui_running')
    set background=dark
else
    set background=light
endif
colorscheme solarized
