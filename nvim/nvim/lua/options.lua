-- 共享剪切板与系统
vim.opt.clipboard = 'unnamedplus'
-- 补全功能，一般与nvim-cmp搭配
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
-- 允许使用鼠标在Nvim中
vim.opt.mouse = 'a'

-- 决定tab的字符宽度
vim.opt.tabstop = 4
-- tab时光标移动的宽度
vim.opt.softtabstop = 4
-- 自动缩进时采用的空格数
vim.opt.shiftwidth = 4
-- 将tab转为空格
vim.opt.expandtab = true

-- 显示绝对行号
vim.opt.number = true
-- 显示相对行号
vim.opt.relativenumber = true
-- 高亮光标所在行
vim.opt.cursorline = true
-- 水平拆分窗口，新窗口出现在下方
vim.opt.splitbelow = true
-- 垂直拆分窗口，新窗口出现在右方
vim.opt.splitright = true
-- 控制是否显示模式状态
vim.opt.showmode = true


-- 启用增量搜索功能
vim.opt.incsearch = true
-- 不高亮所有搜索结果
vim.opt.hlsearch = false
-- 搜索时忽略大小写
vim.opt.ignorecase = true
-- 如果搜索时包含大写字母，则区分大小写
vim.opt.smartcase = true


-- 启用基于 Treesitter 的折叠
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- 默认不折叠
vim.opt.foldlevel = 99     -- 设置默认折叠级别为 99，所有代码展开


vim.o.completeopt = "menu,menuone,noinsert,noselect,popup"