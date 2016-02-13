" Show Ideographic Space (a.k.a. Zenkaku Space).
" Version: 1.0
" Author : thinca <thinca+vim@gmail.com>
" License: zlib License

if exists('g:loaded_zenspace')
  finish
endif
let g:loaded_zenspace = 1

command! -bar ZenSpaceOn call zenspace#on()
command! -bar ZenSpaceOff call zenspace#off()
command! -bar ZenSpaceList call zenspace#list()
command! -bar ZenSpaceUpdate call zenspace#update()

augroup plugin-zenspace
  autocmd!
  autocmd ColorScheme * call zenspace#setup_highlight()
  autocmd VimEnter,WinEnter,FileType * call zenspace#update()
  if exists('##OptionSet')
    autocmd OptionSet list call zenspace#update()
  endif
augroup END
