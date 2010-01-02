
" Author:  Cornelius  <cornelius.howl@gmail.com>
"          Tatsuhiro Ujihisa <ujihisa@gmail.com>
" Date: 一 Sat Jan  2 08:03:54 PST 2010
" Script type: plugin
" Script id:   2893

" filetype completion hacks
fun! FiletypeCompletion(lead, cmd, pos)
  let list = glob(expand('$VIMRUNTIME/syntax'). '/*.vim') .
        \ glob(expand('$HOME/.vim/syntax'). '/*.vim')
  let items = split(list, "\n")
  cal map(items, 'matchstr(v:val, ''\w\+\(.vim$\)\@='')')
  cal filter(items, "v:val =~ '^" . a:lead . "'")
  return items
endf
com! -complete=customlist, FiletypeCompletion -nargs=1 SetFiletype :setf <args>
cabbr sft SetFiletype
cabbr setf SetFiletype



