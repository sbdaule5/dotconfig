-- This file contains keybindings and settings that I use specifically when using with markdown
-- All the keybindings will start with <Leader>m

-- Some convenience shortcuts

vim.api.nvim_create_user_command("OpenWiki",
  function()
    vim.cmd("WikiIndex")
    vim.cmd("lcd ~/notes/")
  end, {})

vim.keymap.set("n", "<Leader>ww", ":OpenWiki<CR>", { remap = false })

vim.keymap.set("n", "<Leader>mf", "ysiw`", { remap = true });
vim.keymap.set("n", "<Leader>mF", "ysiW`", { remap = true });

function NotesSettings()
  vim.opt.conceallevel = 2

  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4
end

function NotesKeybindings()
  vim.keymap.set("n", "<Leader>mf", "ysiw`", { remap = true });
  vim.keymap.set("n", "<Leader>mF", "ysiW`", { remap = true });
  vim.keymap.set("n", "<Leader>w<leader>p", ":WikiJournalPrev<CR>", { remap = false, silent = true });
  vim.keymap.set("n", "<Leader>w<leader>n", ":WikiJournalPrev<CR>", { remap = false, silent = true });
  vim.keymap.set("n", "<Leader>wp", ":PeekToggle<CR>", { remap = false, buffer = true })
end

function GoyoEnter()
end

function GoyoLeave()
end
