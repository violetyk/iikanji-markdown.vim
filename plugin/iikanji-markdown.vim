if exists('g:loaded_iikanji_markdown_vim')
  finish
endif
let g:loaded_iikanji_markdown_vim = 1

let s:save_cpo = &cpo
set cpo&vim


" for s in split(globpath(&runtimepath, 'syntax/*.vim'), '\n')
  " echo fnamemodify(s, ':t:r')
" endfor
" add
let g:markdown_fenced_languages = [
      \ 'coffee',
      \ 'css',
      \ 'erb=eruby',
      \ 'javascript',
      \ 'js=javascript',
      \ 'json=javascript',
      \ 'ruby',
      \ 'sass',
      \ 'xml',
      \ 'php',
      \]

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:set fenc=utf-8 ff=unix ft=vim fdm=marker:
