function! utils#Cabbrev(key, value) abort
  execute printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
        \ a:key, 1+len(a:key), <SID>Single_quote(a:value), <SID>Single_quote(a:key))
endfunction


function! s:Single_quote(str) abort
  return "'" . substitute(copy(a:str), "'", "''", 'g') . "'"
endfunction

" Generate random integers in the range [Low, High] in pure vim script,
" adapted from https://stackoverflow.com/a/12739441/6064933
function! utils#RandInt(Low, High) abort
  " Use lua to generate random int. It is faster. Ref: https://stackoverflow.com/a/20157671/6064933
  call v:lua.math.randomseed(localtime())
  return v:lua.math.random(a:Low, a:High)
endfunction

" Selection a random element from a sequence/list
function! utils#RandElement(seq) abort
  let l:idx = utils#RandInt(0, len(a:seq)-1)

  return a:seq[l:idx]
endfunction

function! XmlBeautify()
  call XmlMinify()
  execute "%s/></>\r</e"
  normal! gg=G
endfunction
  
function! XmlMinify()
  set filetype=xml
  filetype indent on
  normal! ggVGJ
  execute "%s/>\s\+</></e"
  execute "%s/> </></e"
endfunction

augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

command! XmlBeautify    execute "call XmlBeautify()" | execute "call XmlBeautify()"
command! XmlMinify      execute "call XmlMinify()"