let s:save_cpo = &cpo
set cpo&vim

function! iikanji#markdown#register_variables() abort
  let languages = get(g:, 'markdown_fenced_languages', [])
  " let languages += map(split(globpath(&runtimepath, 'syntax/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")')
  let languages += [
        \ 'vim',
        \ 'c',
        \ 'cpp',
        \ 'java',
        \ 'python',
        \ 'perl',
        \ 'php',
        \ 'ctp=php',
        \ 'ruby',
        \ 'erb=eruby',
        \ 'sql',
        \ 'mysql',
        \ 'diff',
        \ 'sh',
        \ 'zsh',
        \ 'haskell',
        \ 'erlang',
        \ 'coffee',
        \ 'javascript',
        \ 'js=javascript',
        \ 'json=javascript',
        \ 'css',
        \ 'sass',
        \ 'html',
        \ 'xml',
        \ ]
  let g:markdown_fenced_languages = uniq(sort(languages))
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:set fenc=utf-8 ff=unix ft=vim fdm=marker:
