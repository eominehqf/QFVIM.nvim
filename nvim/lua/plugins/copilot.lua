return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot", -- 仅在调用 Copilot 相关命令时加载
    event = "InsertEnter", -- 在插入模式下加载
    opts = {
      suggestion = { 
        enabled = true,-- 自动建议
        debounce = 75, -- 防抖，单位毫秒
      }, 
      panel = { enabled = true }, -- 显示建议面板
      filetypes = {
        python = true, -- 在 markdown 文件中启用
        help = false, -- 禁用在 help 文件中
        --["*"] = true, -- 其他所有文件类型启用
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
      vim.keymap.set("i", "<C-J>", function()
        require("copilot.suggestion").accept()
      end, { desc = "Accept Copilot Suggestion" })
      
      vim.keymap.set("i", "<C-K>", function()
        require("copilot.suggestion").next()
      end, { desc = "Next Copilot Suggestion" })
      
      vim.keymap.set("i", "<C-L>", function()
        require("copilot.suggestion").prev()
      end, { desc = "Previous Copilot Suggestion" })
      
      vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Open Copilot Panel" })
    end,
}