" Abbrivations
let g:abbreviation_marker = "Abbreviations"
function! LoadAbb()
  let markerline = search(g:abbreviation_marker, 'nw')
  let lastline = line('$')
  let p = markerline + 2
  if markerline != 0
    " Clear existing Abbrivations
    abclear <buffer>
    " Load Abbrivations
    while p <= lastline
      let curr_line = getline(p)
      if curr_line =~ "^[^ ]\+ [^ ].*$"
        execute 'Abolish -buffer '..curr_line
      endif
      let p = p + 1
    endwhile
  endif
endfunction

function! AdjustHeaders()
  let l:line = 1
  let l:lastline = line('$')
  let l:dash_found = 0
  while l:line <= l:lastline
    let l:current_line = getline(l:line)
    let l:prev_line = getline(l:line - 1)

    if l:current_line =~# '^=\+$' && l:prev_line =~# '^.\+$'
      let l:equals = repeat('=', len(l:prev_line))
      call setline(l:line, l:equals)
    elseif l:current_line =~# '^--\+$' && l:prev_line =~# '^[^-].\+$'
      let l:dash_found = l:dash_found + 1

      if l:dash_found > 1
        let l:equals = repeat('-', len(l:prev_line))
        call setline(l:line, l:equals)
      endif

    endif

    let l:line = l:line + 1
  endwhile
endfunction

augroup NotesGroup
  autocmd!
  autocmd BufRead *.md call LoadAbb()
  " autocmd BufRead *.md Toc
  autocmd BufWrite *.md call LoadAbb()
  autocmd BufWritePre *.md call AdjustHeaders()
  autocmd FileType markdown lua NotesKeybindings()
  autocmd FileType markdown lua NotesSettings()
  autocmd FileType markdown lua WritingMode()
  " autocmd BufWritePre *.md * %s/\s\+$//e "Autoremove trailing whitespace
augroup END

autocmd BufRead *.gd set filetype=gdscript

let g:wiki_journal = {
      \ 'name' : 'diary',
      \ 'frequency' : 'daily',
      \ }
