return{
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine", "zbirenbaum/copilot.lua" },
    opts = function()
      return {
        options = {
          theme = "gruvbox",
          icons_enabled = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 
            'branch', 
            'diff',
            {
              'diagnostics',
              sources = { "nvim_diagnostic" },
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
          },
          lualine_c = { 'filename' },
          lualine_x = {
            { 'copilot',
              -- Default values
              symbols = {
                  status = {
                      icons = {
                          enabled = " ",
                          sleep = " ",   -- auto-trigger disabled
                          disabled = " ",
                          warning = " ",
                          unknown = " "
                      },
                      hl = {
                          enabled = "#50FA7B",
                          sleep = "#AEB7D0",
                          disabled = "#6272A4",
                          warning = "#FFB86C",
                          unknown = "#FF5555"
                      }
                  },
                  spinners = require("copilot-lualine.spinners").dots,
                  spinner_color = "#6272A4"
              },
              show_colors = false,
              show_loading = true 
            },
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { 'nvim-tree', 'quickfix' },
      }
    end,
  }