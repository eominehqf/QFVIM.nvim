return {
    -- Mason LSP 配置
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
    ensure_installed = { "pyright", "lua_ls", "marksman" }, -- 自动安装这些 LSP
    automatic_installation = true, -- 自动安装未安装的 LSP
    },
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 自动设置 Mason 安装的 LSP
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                lspconfig[server_name].setup {
                    capabilities = capabilities,
                }
            end,
        })
    end,
}