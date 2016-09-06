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
set background=dark
let g:solarized_visibility= 'normal'
colorscheme solarized

" Set the dimmed colour for Limelight
let g:limelight_conceal_ctermfg = 'LightGrey'


" NERDTree

" map open/close NERDTree to ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Close VIM if only NERDTree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Set relevant filetypes
au BufRead,BufNewFile *.scss set filetype=scss.css
au BufRead,BufNewFile *.md set filetype=markdown


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
set wrap 
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
nmap <leader>l :set list!<CR>
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
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
        set numberwidth=5
    endif
" Limit line-length to 80 columns by highlighting col 81 onward
if exists("+colorcolumn")
  set colorcolumn=+1
endif
" Force cursor onto a new line after 80 characters
set textwidth=80
" Highlight current line
set cursorline

augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
    autocmd BufEnter * match OverLength /\%80v.*/
augroup END

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


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

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

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

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
" Abbreviations and auto-completions

" lipsum<Tab> drops some Lorem ipsum text into the document
iabbrev lipsum Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.
" Set up a section-level comment
iabbrev comsec 
\<CR>/* ==========================================================================
\<CR>#
\<CR>========================================================================== */
" Set up a sub-level comment
iabbrev comsub 
\<CR>/*
\<Cr>========================================================================== */
" Running the `@c` macro will always insert a section-level comment
let @c = 'O^Mcomsec><80>kbjk2?*^M^Vkr A'
" Running the `@x` macro will always insert a sub-level comment
let @x = 'O^Mcomsub><80>kbjk^[^r kA '
