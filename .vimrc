" This must be first, because it changes other options as side effect
set nocompatible    " nocp

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#infect()

" curtesy to nvie, this is so long ;D
" http://nvie.com/posts/how-i-boosted-my-vim/
set title

set tabstop=4
set shiftwidth=4 
set softtabstop=4
set shiftround
set smarttab
set expandtab
set nowrap

set autoindent
set copyindent
set number  " nu

set mouse=a

"set visualbell
"set noerrorbells

set hlsearch
set incsearch
set smartcase " or ignorecase
set showmatch

set backspace=indent,eol,start

set wildignore=*.swp,*.bak,*.pyc,*.class,*.tbz,*.tgz;*.zip;*.tar

set nobackup
set noswapfile

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set listchars-=eol:$

if &t_Co > 2 || has("gui_running")
    syntax on "sy on
endif

filetype plugin indent on

if &t_Co >= 256 || false
    if has('gui_running')
        set background=dark
        colorscheme solarized
    else
        set background=light
        colorscheme mustang
    endif
endif

if has('autocmd')
    autocmd filetype python set expandtab
    autocmd filetype html,xml set listchars-=tab:>.
    autocmd filetype raw set nolist
    autocmd BufWritePost *.py call Flake8()
endif

set pastetoggle=<F2>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null
