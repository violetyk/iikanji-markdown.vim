let s:save_cpo = &cpo
set cpo&vim

function! iikanji#markdown#register_variables() abort
  let languages = get(g:, 'markdown_fenced_languages', [])
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
  let languages = uniq(sort(languages))

  let all_syntax = map(split(globpath(&runtimepath, 'syntax/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")')
  let g:markdown_fenced_languages = filter(languages, 'index(all_syntax, split(v:val, "=")[-1]) != -1')

  let g:iikanji#markdown#use_abbrev       = get(g:, 'iikanji#markdown#use_abbrev', 1)
  let g:iikanji#markdown#abbrev           = get(g:, 'iikanji#markdown#abbrev', {})
  let g:iikanji#markdown#abbrev.task      = get(g:iikanji#markdown#abbrev, 'task', 'td')
  let g:iikanji#markdown#abbrev.task_list = get(g:iikanji#markdown#abbrev, 'task_list', 'tl')

  let g:iikanji#markdown#use_indent_with_tab = get(g:, 'iikanji#markdown#use_indent_with_tab', 1)

  let g:iikanji#markdown#mapping#toggle_checkbox = get(g:, 'iikanji#markdown#mapping#toggle_checkbox', '<Leader><Leader>')


endfunction

function! iikanji#markdown#toggle_checkbox() abort
  let l = getline('.')
  if l =~ '\-\s\[\s\]'
    call setline('.', substitute(l, '\-\s\[\s\]', '- [x]', ''))
  elseif l =~ '\-\s\[x\]'
    call setline('.', substitute(l, '\-\s\[x\]',  '- [ ]', ''))
  elseif l =~ '+\s\[\s\]'
    call setline('.', substitute(l, '+\s\[\s\]', '+ [x]', ''))
  elseif l =~ '+\s\[x\]'
    call setline('.', substitute(l, '+\s\[x\]',  '+ [ ]', ''))
  elseif l =~ '\*\s\[\s\]'
    call setline('.', substitute(l, '\*\s\[\s\]', '* [x]', ''))
  elseif l =~ '\*\s\[x\]'
    call setline('.', substitute(l, '\*\s\[x\]',  '* [ ]', ''))
  end
endfunction

function! iikanji#markdown#indent_with_tab(arrow) abort
  let l = getline('.')
  if l =~ '^\s*[\-\+\*]'
    let c = col('.')
    if a:arrow > 0
      let c += shiftwidth()
      execute 'normal ' count . '>>'
    else
      let c -= shiftwidth()
      execute 'normal ' count . '<<'
    endif
    if strwidth(getline('.')) == c
      let c += 1
    endif
    call cursor(line('.'), c)
  end
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:set fenc=utf-8 ff=unix ft=vim fdm=marker:
