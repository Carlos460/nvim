require "nvchad.mappings"
local harpoon = require "harpoon"

-- general

local map = vim.keymap.set

-- navigating up and down half a page 
map("i", "jk", "<ESC>")
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- tmux navigation in nvim
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { noremap = true, silent = true })
map("n", "<C-k>", "<cmd>TmuxNavigateRight<cr>", { noremap = true, silent = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { noremap = true, silent = true })
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true, silent = true })
map("n", "<C-\\>", "<cmd>TmuxNavigateLastActive<cr>", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- harpoon
map("n", "<leader>a", function()
  harpoon:list():add()
end)
map("n", "<leader><tab>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- map("n", "<C-h>", function() harpoon:list():select(1) end)
-- map("n", "<C-t>", function() harpoon:list():select(2) end)
-- map("n", "<C-n>", function() harpoon:list():select(3) end)
-- map("n", "<C-s>", function() harpoon:list():select(4) end)

-- toggle pervious & next buffers stored within Harpoon list
map("n", "<tab>", function()
  harpoon:list():prev()
end)
map("n", "<S-tab>", function()
  harpoon:list():next()
end)
