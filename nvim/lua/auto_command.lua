-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--     pattern = ":",
--     callback = function()
--         require("cmp").setup.cmdline(":", {
--         mapping = require("cmp").mapping.preset.cmdline(),
--         sources = require("cmp").config.sources({
--             { name = "path" },
--         }, {
--             { name = "cmdline" },
--         }),
--         })
--     end,
-- })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.cmd([[LspStart marksman]])
    end,
})

-- 实时预览html，需要npm install -g live-server
vim.api.nvim_create_user_command("PreviewHTML", function()
    local filename = vim.fn.expand("%:p")
    vim.cmd("!live-server " .. filename)
end, {})
