return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- 安装或更新 Treesitter 解析器
    config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { 
          "python", 
          "lua", 
          "markdown", 
          "vim", 
          "vimdoc", 
          "luadoc" 
        }, -- 指定要安装的解析器
        incremental_selection = { -- 增量选择
          enable = true,
          keymaps = {
            init_selection = "<CR>", -- 启动选择
            node_incremental = "<CR>", -- 扩展到下一个节点
            scope_incremental = "<Tab>", -- 扩展到作用域
            node_decremental = "<BS>", -- 收缩选择
          },
        },
        sync_install = false, -- 是否同步安装解析器
        auto_install = true,  -- 自动安装缺失的解析器
        highlight = {
          enable = true, -- 启用语法高亮
          disable = { "help" }, -- 可选：禁用某些语言的语法高亮
          additional_vim_regex_highlighting = false, -- 禁用 Vim 原生语法高亮
        },
        indent = { 
          enable = true -- 启用基于 Treesitter 的智能缩进
        },
        fold = {
          enable = true, -- 开启折叠功能
          disable = {},  -- 可选：禁用某些语言的折叠
        },
      })
    end,
    event = { "BufReadPost", "BufNewFile" }, -- 懒加载触发事件
  }