return {
    -- 主补全引擎
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
    "hrsh7th/cmp-nvim-lsp",      -- LSP 补全源
    "hrsh7th/cmp-buffer",        -- Buffer 补全源
    "hrsh7th/cmp-path",          -- 文件路径补全
    "hrsh7th/cmp-cmdline",       -- 命令行补全
    "L3MON4D3/LuaSnip",          -- 片段引擎
    "saadparwaiz1/cmp_luasnip",  -- LuaSnip 补全源
    },
    opts = function()
        local cmp = require("cmp")
        return {
            snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- 使用 LuaSnip 作为片段引擎
            end,
            },
            mapping = cmp.mapping.preset.insert({
            -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
            -- ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-c>"] = function(fallback)
              if cmp.visible() then
                cmp.abort() -- 取消补全
              else
                fallback() -- 执行默认的 <C-c> 行为
              end
            end,
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 确认补全
            ["<C-j>"] = cmp.mapping.select_next_item(), -- 下一个补全项
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- 上一个补全项
            ["<Down>"] = cmp.mapping.select_next_item(), -- 使用方向键选择下一个
            ["<Up>"] = cmp.mapping.select_prev_item(),   -- 使用方向键选择上一个
            }),

      
            cmp.setup.cmdline(":", {
              mapping = cmp.mapping.preset.cmdline(),
              sources = cmp.config.sources({
                { name = "path" }, -- 路径补全
              }, {
                { name = "cmdline" }, -- 命令补全
              }),
            }),

            sources = cmp.config.sources({
            { name = "nvim_lsp" },  -- LSP 补全
            { name = "luasnip" },   -- 片段补全
            }, {
            { name = "buffer" },    -- Buffer 补全
            { name = "path" },      -- 文件路径补全
            }),
        }
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts)

      -- 配置搜索（/ 和 ?）
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- 配置命令行（:）
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }, -- 路径补全
        }, {
          { name = "cmdline" }, -- 命令补全
        }),
      })
    end,
}