return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio", -- 用于调试和测试集成
    },
    opts = function()
        local dapui = require("dapui")

        dapui.setup({
            layouts = {
            {
                elements = {
                    { id = "scopes", size = 0.5 }, -- 左侧区域，40% 高度
                    { id = "breakpoints", size = 0.2 }, -- 30% 高度
                    { id = "stacks", size = 0.2 }, -- 30% 高度
                    { id = "watches", size = 0.1 }, -- 30% 高度

                },
                size = 40,
                position = "left",
            },
            {
                elements = {
                    { id = "repl", size = 0.5 }, -- 下方区域，50% 高度
                    { id = "console", size = 0.5 }, -- 50% 高度
                },
                size = 20,
                position = "bottom",
            },
            },
            floating = {
            max_height = 0.9,
            max_width = 0.9,
            },
        })

        -- 自动打开和关闭DAP-UI
        local dap = require("dap")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- 快捷键绑定
        vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
        vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
        vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
        vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
        vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dc", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Set Conditional Breakpoint" })
    end,
  }