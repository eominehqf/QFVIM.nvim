return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- 自动更新解析器
    opts = {
    -- Treesitter 配置
    ensure_installed = { "python", "lua", "markdown", "vim", "vimdoc", "luadoc", }, -- 需要安装的解析器
    sync_install = false, -- 异步安装
    auto_install = true,  -- 自动安装缺失的解析器
    highlight = {
        enable = true, -- 启用语法高亮
        disable = "help",
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true }, -- 启用缩进
    fold = {
        enable = true, -- 开启折叠功能
        disable = {},  -- 可选：禁用某些语言的折叠
    },
    },
    -- 可选：设置 lazy.nvim 特性，例如事件触发加载
    event = { "BufReadPost", "BufNewFile" }, -- 在读取文件时加载插件
  }