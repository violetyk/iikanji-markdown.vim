if exists('g:loaded_iikanji_markdown_vim')
  finish
endif
let g:loaded_iikanji_markdown_vim = 1

let s:save_cpo = &cpo
set cpo&vim

call iikanji#markdown#register_variables()

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:set fenc=utf-8 ff=unix ft=vim fdm=marker:
