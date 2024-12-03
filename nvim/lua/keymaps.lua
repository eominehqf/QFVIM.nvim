local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.g.mapleader = ' ' -- 设置空格为leader键

-----------------
-- Normal mode --
-----------------

-- 快速保存和退出
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)  -- 保存文件
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)  -- 退出文件

-- 分屏窗口导航
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)  -- 左窗口
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)  -- 下窗口
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)  -- 上窗口
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)  -- 右窗口

-- 调整窗口大小
vim.keymap.set('n', '<leader>=', '<C-w>=')  -- 窗口等宽等高
vim.keymap.set('n', '<leader>+', ':resize +2<CR>')  -- 垂直增加高度
vim.keymap.set('n', '<leader>-', ':resize -2<CR>')  -- 垂直减少高度
vim.keymap.set('n', '<leader><', ':vertical resize -2<CR>')  -- 水平减少宽度
vim.keymap.set('n', '<leader>>', ':vertical resize +2<CR>')  -- 水平增加宽度

-- 快速跳转到行首和行尾
vim.keymap.set('n', 'H', '0')  -- 行首（非空字符）
vim.keymap.set('n', 'L', '$')  -- 行尾

-- 在搜索结果中快速跳转
vim.keymap.set('n', 'n', 'nzzzv')  -- 保持跳转位置居中
vim.keymap.set('n', 'N', 'Nzzzv')


-----------------
-- Insert mode --
-----------------

-- 使用jk退出插入模式
vim.keymap.set('i', 'jk', '<Esc>', opts)


-----------------------
-- Telescrope Keymap --
-----------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

---------------
-- nvim-tree --
---------------
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })


