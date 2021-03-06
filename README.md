# Config vim

<br/>
<p align='right'><em>Đặng Quốc Lai</em></p>

> https://tuckerchapman.com/2020/05/09/vimrc_organization/

## Thông tin các nhánh
- Nhánh cho window:
  - [nvim0.6](https://github.com/danglai/vim/tree/nvim0.6): Nhánh mới nhất nvim 0.6 with packer (COC suggestion and Language Server Protocol in comment)
- Nhánh cho linux:
- 
## .vimrc

```
" ~/.vimrc

syntax enable
syntax on

source ~/.vim/init/plugins.vimrc   " plugin specific settings
source ~/.vim/init/general.vimrc   " general settings
source ~/.vim/init/leader.vimrc    " leader key settings
source ~/.vim/init/functions.vimrc " custom functions
source ~/.vim/init/python.vimrc    " config for python

```

## Init file organization
- `plugins`   : install plugins and their config
- `general`	  : store tab settings, color and other general settings
- `leader`	  : shortcut keyboard, key call function
- `functions` : store custom functions
- `python`    : custom setting for language

## Install with PlugInstall
- `vim x`
- `:PlugInstall`

## .vimrc
```bash
scriptencoding utf-8

set splitbelow splitright 
set ttimeoutlen=50
set clipboard=unnamedplus


set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,":",':',《:》

set number relativenumber  " Show line number and relative line number

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=↪

set fileformats=unix,dos  " Fileformats to use for new files

" Ask for confirmation when handling unsaved or read-only files
set confirm

set visualbell noerrorbells  " Do not use visual and errorbells
set history=500  " The number of command and search history to keep

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣

" Auto-write the file based on some condition
set autowrite

set title


" Completion behaviour
" set completeopt+=noinsert  " Auto select the first completion entry
set completeopt+=menuone  " Show menu even if there is only one item
set completeopt-=preview  " Disable the preview window

set pumheight=10  " Maximum number of items to show in popup menu

" Insert mode key word completion setting
set complete+=kspell complete-=w complete-=b complete-=u complete-=t

set shiftround

set virtualedit=block  " Virtual edit is useful for visual block edit

set formatoptions+=mM

set tildeop

set synmaxcol=200  " Text after this column number is not highlighted
set nostartofline

set termguicolors

set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20

" Remove certain character from file name pattern matching
set isfname-==
set isfname-=,

set nowrap  " do no wrap
set autochdir " create file in child folder instead of parent folder
set rtp+=~/.fzf


let mapleader="," 

nnoremap <leader>h :noh<CR> " toggle search highlighting
map <leader>vd :call ToggleThemeMode('dark')<CR>
map <leader>va :call ToggleThemeMode('')<CR>

" Exit terminal mode by C-d
" tnoremap jj <C-\><C-n><CR>
" nnoremap <leader>sp :sp term://cmd<CR> " Add cmd below
" nnoremap <leader>vsp :vsp term://cmd<CR> " Add cmd left

" Toggle Word wrap
nnoremap <A-z> :set wrap!<CR>
 
" Ctrl Backspace to cw
imap <C-BS> <C-W>

" scroll to begin line from previous end line
nnoremap o 0o

" go to start and end line
nnoremap <leader>s 0
nnoremap <leader>e $
vnoremap <leader>s 0
vnoremap <leader>e $

let key_not_cut = ["c", "d", "x"]
let modes = ['v', 'n']

for key in key_not_cut
  for mode in modes
    " let query = mode.'noremap '.key . ' "_' . key
    " echo query
    " execute query

    execute mode.'noremap '.key . ' "_' . key
    execute mode.'noremap '.toupper(key) . ' "_' . toupper(key)
    execute mode.'noremap <leader>'.key . ' ' . key 
    execute mode.'noremap <leader>'.toupper(key) . ' ' . toupper(key)
    
  endfor
endfor


" Backspace to remove tab previous
set backspace=indent,eol,start

"Map jj to ESC" 
inoremap jj <ESC>

" Use ctrl-[hjkl] to select the active split
nnoremap <silent> <C-k> <c-w>k<CR>
nnoremap <silent> <C-j> <c-w>j<CR>
nnoremap <silent> <C-h> <c-w>h<CR>
nnoremap <silent> <C-l> <c-w>l<CR>

" Toggle NERDTree
" nnoremap <C-b> :NERDTreeToggle<CR>


" [Format Python code in vim](https://www.linuxtut.com/en/4ae1b9ac504567ad4142/)
nmap <leader>f :silent %!autopep8 --ignore=E501 -<CR>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
```
