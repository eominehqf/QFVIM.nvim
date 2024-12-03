return{
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "gruvbox", -- 状态栏主题，可更换为其他主题如 "onedark", "solarized"
        icons_enabled = true, -- 启用图标
        component_separators = { left = '|', right = '|' }, -- 组件分隔符
        section_separators = { left = '', right = '' }, -- 区域分隔符
      },
      sections = {
        lualine_a = { 'mode' }, -- 显示模式
        lualine_b = { 'branch', 'diff', 'diagnostics' }, -- Git 分支、差异和诊断信息
        lualine_c = { 'filename' }, -- 当前文件名
        lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- 文件编码、格式、类型
        lualine_y = { 'progress' }, -- 进度
        lualine_z = { 'location' } -- 光标位置
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = { 'nvim-tree', 'quickfix' } -- 支持 nvim-tree 和 quickfix
    }
}