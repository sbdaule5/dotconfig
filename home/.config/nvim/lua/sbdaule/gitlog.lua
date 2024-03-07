vim.cmd([[
    " Git log function
    function! GitLog(oneline = 1)
        let l:count = v:count
        if l:count == 0
            " If no count is provided, default to 1
            let l:count = 10
        endif
        if a:oneline
          execute "Git log --oneline -n" . l:count
        else
          execute "Git log -n" . l:count
        endif
    endfunction
]])
