return {
    -- LSP 基础配置插件
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- 延迟加载
    config = function()
        local lspconfig = require("lspconfig")

        -- 为各 LSP 设置通用配置
        local on_attach = function(client, bufnr)
            -- 自定义快捷键
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 示例 LSP 配置
        lspconfig.pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.marksman.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.html.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.cssls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.ts_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
            Lua = {
                diagnostics = {
                globals = { "vim" },
                },
            },
            },
        })
    end,
}  