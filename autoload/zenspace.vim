" Show Ideographic Space (a.k.a. Zenkaku Space).
" Version: 1.0
" Author : thinca <thinca+vim@gmail.com>
" License: zlib License

scriptencoding utf-8

if !exists('g:zenspace#default_mode')
  let g:zenspace#default_mode = 'list'
endif

function! zenspace#setup_highlight() abort
  highlight default ZenSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
endfunction

function! zenspace#on() abort
  let w:zenspace_mode = 'on'
  call zenspace#update()
endfunction

function! zenspace#off() abort
  let w:zenspace_mode = 'off'
  call zenspace#update()
endfunction

function! zenspace#list() abort
  let w:zenspace_mode = 'list'
  call zenspace#update()
endfunction

function! zenspace#update() abort
  let on = zenspace#is_on()
  let current_state = exists('w:zenspace_match_id')

  if on == current_state
    return
  endif

  if on
    let w:zenspace_match_id = matchadd('ZenSpace', '　')
  else
    call matchdelete(w:zenspace_match_id)
    unlet w:zenspace_match_id
  endif
endfunction

function! zenspace#is_on() abort
  if !exists('w:zenspace_mode')
    let w:zenspace_mode = g:zenspace#default_mode
  endif
  if w:zenspace_mode ==# 'list'
    return &l:list
  endif
  return w:zenspace_mode ==# 'on'
endfunction

call zenspace#setup_highlight()
