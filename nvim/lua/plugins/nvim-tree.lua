return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
    "nvim-tree/nvim-web-devicons", -- 可选：文件图标支持
    },
    opts = { -- 使用 opts 配置插件
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        update_cwd = true,
        respect_buf_cwd = true,
        view = {
            width = 30,
            side = "left",
        },
        renderer = {
            group_empty = true, -- 组内无文件时隐藏
            icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                },
                git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
                },
            },
            },
        },
        filters = {
            dotfiles = false, -- 是否显示隐藏文件
            custom = { ".git", "node_modules", ".cache" }, -- 自定义隐藏文件
        },
    },
    config = function(_, opts)
    require("nvim-tree").setup(opts)
    end,
}