setlocal autoindent
setlocal formatoptions=tcroqln
setlocal nofoldenable
setlocal comments=s1:/*,mb:*,ex:*/,://,:%,:XCOMM,n:>
setlocal comments+=b:-\ [\ ],b:-\ [x],b:-
setlocal comments+=b:+\ [\ ],b:+\ [x],b:+
setlocal comments+=b:*\ [\ ],b:*\ [x],b:*

let s:_abbrevs = {
      \ 'task' : '[ ]',
      \ 'task_list' : '- [ ]',
      \ }

if g:iikanji#markdown#use_abbrev
  for i in items(g:iikanji#markdown#abbrev)
    let context = i[0]
    let mapping = i[1]
    if has_key(s:_abbrevs, context) == 1 && type(mapping) == type('')
      execute printf('abbreviate %s %s', mapping, s:_abbrevs[context])
    end
  endfor
endif

if g:iikanji#markdown#use_indent_with_tab
  noremap  <silent><buffer> <Tab> :call iikanji#markdown#indent_with_tab(1)<CR>
  noremap  <silent><buffer> <S-Tab> :call iikanji#markdown#indent_with_tab(-1)<CR>
  inoremap <silent><buffer> <Tab> <C-o>:call iikanji#markdown#indent_with_tab(1)<CR>
  inoremap <silent><buffer> <S-Tab> <C-o>:call iikanji#markdown#indent_with_tab(-1)<CR>
  vnoremap <silent><buffer> <Tab> :call iikanji#markdown#indent_with_tab(1)<CR>
  vnoremap <silent><buffer> <S-Tab> :call iikanji#markdown#indent_with_tab(-1)<CR>
end

if !hasmapto('<Plug>(iikanji-markdown-toggle-checkbox-n)')
  execute printf('nnoremap <buffer><silent> %s :call iikanji#markdown#toggle_checkbox()<CR>',
        \ g:iikanji#markdown#mapping#toggle_checkbox)
endif

if !hasmapto('<Plug>(iikanji-markdown-toggle-checkbox-v)')
  execute printf('vnoremap <buffer><silent> %s :call iikanji#markdown#toggle_checkbox()<CR>',
        \ g:iikanji#markdown#mapping#toggle_checkbox)
endif
