let mapleader="," 

nnoremap <leader>h :noh<CR> " toggle search highlighting
map <leader>vd :call ToggleThemeMode('dark')<CR>
map <leader>va :call ToggleThemeMode('')<CR>

" Exit terminal mode by C-d
" tnoremap jj <C-\><C-n><CR>
" nnoremap <leader>sp :sp term://cmd<CR> " Add cmd below
" nnoremap <leader>vsp :vsp term://cmd<CR> " Add cmd left

" copy absolute path to clipboard
" nnoremap <leader>cf :let @+ = expand("%:p") <CR>

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
