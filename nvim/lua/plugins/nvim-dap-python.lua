return {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    config = function()
      local dap_python = require("dap-python")
      -- 设置 Python 调试器路径，可以是 `debugpy` 可执行文件路径
      dap_python.setup("/opt/homebrew/anaconda3/bin/python")
      vim.keymap.set("n", "<leader>dt", function() dap_python.test_method() end, { desc = "Debug Python Test" })
    end,
}