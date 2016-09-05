"compatibility
set nocompatible
set modelines=0
set encoding=utf-8
filetype off
execute pathogen#infect()
"Syntax highlighting

"Detect filetype
filetype indent plugin on
"Enable syntax highlighting
syntax enable
"Dark Solarized scheme
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

syntax on "Turn on syntax highlighting


"Tabs, indentation and lines

"4 spaces please
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Custom indent colors
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=blue
" Tab completion as bash
set wildmode=longest,list,full
set wildmenu
"Round indent to nearest multiple of 4
set shiftround
"Line break on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"Interactions
"Start scrolling slightly before de cursor reaches an edge
set scrolloff=5
set sidescrolloff=5
"Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
"Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]
"Underscore denote words
set iskeyword-=_

"Yanking to system clipboard
set clipboard=unnamed

"Visual Decorations

"Show matching braces
set showmatch
"Show status line
set laststatus=2
"Show mode you're currently in
set showmode
"Show what commands you're typing
set showcmd
"Allow modelines
set modeline
"Show current line and column position in file
set ruler
"Show file title in terminal tab
set title
"Show line numbers
set relativenumber
"Highlight current line
set cursorline
"Don't keep results highlighted after searchingâ€¦
set nohlsearch
"â€¦ust highlight as we type
set incsearch
"Ignore case when searchingâ€¦
set ignorecase
"â€¦except if we input capital letter
set smartcase

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Mustache abbreviations activations
let g:mustache_abbreviations = 1

"Key mappings

" Learn to use hjkl

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"jj to throw you into normal mode from insert mode
inoremap jj <esc>
"jk to throw you into normal mode from insert mode
inoremap jk <esc>
"So I can use mouse
set mouse=a

" Change mapleader from \ to ,
let mapleader = ","

" Clear search with ,<space>
nnoremap <leader><space> :noh<cr>
"Using emmet with tab keymapping
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"Shortcuts to open in broswers
nnoremap <F5>f :exe ':silent !open -a /Applications/Firefox.app %'<CR>
nnoremap <F5>c :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F5>g :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F5>s :exe ':silent !open /Applications/Safari.app %'<CR>

" Delete trailing spaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>w <esc>:w<CR> 
nnoremap <leader>wq <esc>:wq<CR>
"
nnoremap <leader>a :Ack
" Fold tag
nnoremap <leader>ft Vatzf
" Unfold tag
nnoremap <leader>uf za
" Sort CSS
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Jump to bottom of file and center last line
nnoremap G Gzz
xnoremap p pgvy

" shortcut for opening splits
nnoremap <Leader>v :vsp <C-R>=expand('%:p:h') . '/'<CR>

nnoremap <Leader>h :sp <C-R>=expand('%:p:h') . '/'<CR>


"To be able to copy text from vi to clipboard
map <C-v> :r !pbpaste<CR>
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

