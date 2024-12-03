return {
    -- nvim-dap 核心插件
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",  -- UI 支持
        "mfussenegger/nvim-dap-python"  -- Python 支持
    },
    opts = function()
        local dap = require("dap")
    
        -- Example for Python adapter
        dap.adapters.python = {
            type = "executable",
            command = "python",
            args = { "-m", "debugpy.adapter" },
        }
    
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}", -- 当前文件路径
                pythonPath = function()
                    return "/opt/homebrew/anaconda3/bin/python" -- 或使用虚拟环境的路径
                end,
            },
        }
    
        -- Set up some key bindings for dap
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dc", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Set Conditional Breakpoint" })
        vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
        vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
        vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
        vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
    end,
    config = function()
        local dap = require("dap")
        local dap_python = require("dap-python")
        local dap_ui = require("dapui")

        -- Setup dap-ui
        dap_ui.setup()

        -- Automatic UI opening/closing
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dap_ui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dap_ui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dap_ui.close()
        end

        -- Setup dap-python
        if vim.fn.has("win32") == 1 then
            dap_python.setup("C:\\path\\to\\python\\Scripts\\python.exe") -- Windows路径
        else
            dap_python.setup("/opt/homebrew/anaconda3/bin/python")
        end
    end,
}