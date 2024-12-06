return {
    "glepnir/dashboard-nvim",
    event = "VimEnter", -- 在启动时加载
    opts = {
        theme = 'doom', -- 选择一个主题，比如 'doom', 'hyper'
        config = {
            header = {
                '',     
                '', 
                '', 
                '',
                '',
                '',                                                                                          
                "  ██████╗ ███████╗██╗   ██╗██╗███╗   ███╗",
                " ██╔═══██╗██╔════╝██║   ██║██║████╗ ████║",
                " ██║   ██║█████╗  ██║   ██║██║██╔████╔██║",
                " ██║▄▄ ██║██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║",
                " ╚██████╔╝██║      ╚████╔╝ ██║██║ ╚═╝ ██║",
                "  ╚══▀▀═╝ ╚═╝       ╚═══╝  ╚═╝╚═╝     ╚═╝",               
                '', 
                '🚀 Welcome to QFVIM!',
                '',
                '',
                '',
                '',
            }, -- 自定义欢迎页面标题
            center = {
                {
                    icon = '  ',
                    desc = 'Recently opened files  ',
                    action = 'Telescope oldfiles',
                    key = 'r',
                },
                {
                    icon = '  ',
                    desc = 'Find File              ',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    icon = '  ',
                    desc = 'File Explorer          ',
                    action = 'NvimTreeToggle',
                    key = 'e',
                },
                {
                    icon = '  ',
                    desc = 'Open Config            ',
                    action = 'edit ~/.config/nvim/init.lua',
                    key = 'c',
                },
                {
                    icon = '  ',
                    desc = 'Quit                   ',
                    action = 'quit',
                    key = 'q',
                },
            },
            footer = {
                '', 
                'Have a productive day!',
                ''
            }, -- 自定义页脚
        },
    },
    config = function(_, opts)
        require('dashboard').setup(opts)
        local colors = { "#ff79c6", "#8be9fd", "#50fa7b", "#f1fa8c", "#ffb86c", "#bd93f9" }
        local random_color = colors[math.random(#colors)]
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = random_color, bold = true })
    end,
}