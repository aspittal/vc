set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles

Bundle 'git://github.com/gmarik/vundle.git'

Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/msanders/snipmate.vim.git'
Bundle 'git://github.com/scrooloose/snipmate-snippets.git'
Bundle 'git://github.com/tsaleh/vim-align.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/guns/xterm-color-table.vim.git'
Bundle 'git://github.com/hallettj/jslint.vim.git'
Bundle 'git://github.com/wincent/Command-T.git'

filetype plugin indent on

" Color Scheme
set t_Co=256
set background=dark
colorscheme ir_black

" Backups & Swap file dirs
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//

" UI
set title           " Change the terminal's title
set nu              " Line Numbers On
set wrap            " Turn on wrapping
set laststatus=2    " Always show status line
set cmdheight=2     " Set command line height
set encoding=utf-8  " Set font encoding
" Highlighting on diff
highlight DiffAdd cterm=none ctermfg=gray ctermbg=darkblue
highlight DiffDelete cterm=none ctermfg=gray ctermbg=cyan
highlight DiffChange cterm=none ctermfg=green ctermbg=black
highlight DiffText cterm=none ctermfg=green ctermbg=darkblue

" Behaviours
syntax enable       " Enable syntax highlighting
set autoread        " Automatically reload changes if detected
set wildmenu        " Turn on wild menu
set hidden          " Change buffer without saving
set history=768     " Number of things to remember in history
set cf              " Enable error files & error jumping
set autowrite       " Writes on make/shell commands
set timeoutlen=350  " Time to wait for a command (after leader forexample)
set foldlevelstart=99   " Remove folds by default
set formatoptions=crql  " See fo-table for details
set shiftround      " round indent to multiple of 'shiftwidth' for > and < commands
" Don't skip over wrapped lines
nnoremap j gj       
nnoremap k gk

" Clears Search
nmap <silent> // :nohlsearch<CR>    

" Text format
set tabstop=4       " Make tabs 4 spaces
set shiftwidth=4    " Intelligently indent 'tabs'
set cindent         " Intelligent indenting on newlines
set smarttab        " Insert spaces when hitting tab key on new lines
set expandtab       " Insert space when hitting tab in the middle of text
set backspace=2     " Makes backspace work as you'd expect

" Searching
set ignorecase      " Case Insensitive search
set smartcase       " Intelligent Case sensitive searching
set incsearch       " Incremental search, matches while typing
set hlsearch        " Highlight matches
" Ignore for following file types when using wildmenu
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.git,.hg,.bzr,.sass-cache,*.class
set tags=./tags,tags; " Set ctags in current directory and then up

" Visual
set showmatch       " Show matching brackets
set matchtime=2     " How many tenths of a second to blink

" Mouse
set mousehide       " Hide mouse after chars are typed
set mouse=a         " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U,]

" Bindings

map <F1> <Esc>
imap <F1> <Esc>

" Remove doc lookup binding
nmap K k
vmap K k

" Make line completion easer
imap <C-l> <C-x><C-l>

" Double percentage sign in command mode is expanded to directory of current
" file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Leader Commands

" Edit .vimrc
nmap <silent> <leader>ev :tabe ~/.vimrc<CR>

" Split movement
nmap <silent> <C-h> :wincmd h<cr>
nmap <silent> <C-j> :wincmd j<cr>
nmap <silent> <C-l> :wincmd l<cr>
nmap <silent> <C-k> :wincmd k<cr>

" Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

" Tab maps
map tn :tabnext<CR>
map tp :tabprevious<CR>

" Auto Commands
if has ("autocmd")
endif

" Plugin Configs

" NERDTree
nnoremap <leader>1 :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<cr>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 " Change NERDTree directory to the root node
let NERDTreeDirArrows=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Vundle
nmap <Leader>bi :BundleInstall<CR>
nmap <leader>bu :BundleInstall!<cr>
nmap <Leader>bc :BundleClean<cr>

" Command-T
" Make command-t show best match at bottom of screen
let g:CommandTMatchWindowReverse=1
" Let Control+X cancel the search
let g:CommandTCancelMap='<C-c>'
" Don't let it take up all of my screen
let g:CommandTMaxHeight=20

