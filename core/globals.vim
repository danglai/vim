let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false
let g:logging_level = 'info'

let g:loaded_python_provider = 1

let g:loaded_perl_provider = 0

let g:loaded_ruby_provider = 0

let g:loaded_node_provider = 0

let g:did_install_default_menus = 1  " do not load menu

if executable('python3')
   if g:is_win
    let g:python3_host_prog=substitute(exepath('python'), '.exe$', '', 'g')
    let g:python_host_prog=substitute(exepath('python'), '.exe$', '', 'g')
  elseif g:is_linux || g:is_mac
    let g:python3_host_prog=exepath('python3')
  endif
else
  echoerr 'Python 3 executable not found! You must install Python 3 and set its PATH correctly!'
endif

let mapleader = ','

let g:vimsyn_embed = 'l'

let g:netrw_liststyle = 3
if g:is_win
  let g:netrw_http_cmd = 'curl --ssl-no-revoke -Lo'
endif

let g:loaded_2html_plugin = 1

let g:loaded_zipPlugin = 1
let loaded_gzip = 1
let g:loaded_tarPlugin = 1

let g:loaded_tutor_mode_plugin = 1  " do not load the tutor plugin

let g:loaded_matchit = 1
let g:loaded_matchparen = 1

set guifont=Monaco:h16