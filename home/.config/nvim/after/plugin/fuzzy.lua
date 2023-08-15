local fzf = require('fzf')
dotfiles = function ()
  coroutine.wrap(function ()
    local result = fzf.fzf("config -l", "", {border = false})

    if result then
      result = result[1]
      local pos = string.find(result, ':')
      if pos then
        result = string.sub(result, pos+1)
        vim.cmd("e " .. result)
      end
    end

  end)()
end
