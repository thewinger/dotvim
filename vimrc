" Lt use Pathogen
execute pathogen#infect()
" comma as Leader
let mapleader = ","
" Use Vim features, not Vi
set nocompatible
set encoding=utf-8

" Syntax highlighting

" Detect filetype
filetype indent plugin on
" Enable syntax highlighting
syntax enable
" Dark Solarized scheme
" 256 colours please
set t_Co=256
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" Set the dimmed colour for Limelight
let g:limelight_conceal_ctermfg = 'LightGrey'


" NERDTree

" Run NERDTree as soon as we launch Vim...
autocmd vimenter * NERDTree
" ... but focus on the file itself, rather than NERDTree
autocmd vimenter * wincmd p
" Close VIM if only NERDTree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Set relevant filetypes
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.less set filetype=less

" Buffer management

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Tabs, indentation and lines

"4 spaces please
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Tab completion as bash
set wildmode=longest,list,full
set wildmenu
" Round indent to nearest multiple of 4
set shiftround
" Line break on 500 characters
set lbr
set tw=500
" Auto indent
set ai 
" Smart indent
set si 
" Wrap lines
set nowrap 
" Underscore denote words
set iskeyword-=_


" Interactions

" Start scrolling slightly before de cursor reaches an edge
set scrolloff=5
set sidescrolloff=5
" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]
"Yanking to system clipboard
set clipboard=unnamed

"Visual Decorations

" Show matching braces
set showmatch
" Show status line
set laststatus=2
" Show mode you're currently in
set showmode
" Show what commands you're typing
set showcmd
" Allow modelines
set modeline
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title
" Show invisibles
set list
set listchars=tab:>-,trail:¬∑
" Set relative line numbers if we can...
if exists("+relativenumber")
    " Due to a problem with relative line numbers not persisting across new
    " tabs and splits, set no line numbers at all...
    set nonumber
    " ..then set relative ones...
    set relativenumber
    " ...otherwise let‚Äôs just have regular ones
    else
        set number
    endif
" Limit line-length to 80 columns by highlighting col 81 onward
if exists("+colorcolumn")
  set colorcolumn=81
endif
" Force cursor onto a new line after 80 characters
set textwidth=80
" Highlight current line
set cursorline


" Search

" Don't keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input capital letter
set smartcase

" Mustache abbreviations activations
let g:mustache_abbreviations = 1


" Key mappings

" Learn to use hjkl (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap j gj
nnoremap k gk
" Make 'Y' behave like 'C' and 'D'
map Y y$
" 'vv' to highlight just the text (i.e. no indents) in a line
map vv ^vg_
" jj to throw you into normal mode from insert mode
inoremap jj <esc>
" jk to throw you into normal mode from insert mode
inoremap jk <esc>
" So I can use mouse
set mouse=a


" Clear search with ,<space>
nnoremap <leader><space> :noh<cr>
" Using emmet with tab keymapping
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Shortcuts to open in broswers
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
