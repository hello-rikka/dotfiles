-- local map = vim.keymap.set
local map = vim.api.nvim_set_keymap

-- lưu và thoát file

map("n", "<C-w>", "<cmd>wq!<CR>", { desc = "exit and save files" })
map("n", "<C-s>", "<cmd>w!<CR>", { desc = "save files" })


-- sử dụng telescope
map("n", "<C-f>", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<C-P>", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })
map("n", "<C-t>", "<cmd>Telescope telescope-tabs list_tabs<CR>", { desc = "telescope find files" })

-- sử dụng file manager
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

local opts = { noremap = true, silent = true }

-- di chuyển tab
map('n', '<A-Right>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-Left>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- tải lại phiên làm việc trước
vim.keymap.set("n", "<A-t>", function() require("persistence").load({ last = true }) end,
    { noremap = true, silent = true })
