return {

      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      },
      build = "make tiktoken", -- Only on MacOS or Linux
      opts = {
        -- system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use (can be specified manually in prompt via /).
        system_prompt = 'You are a helpful coding assistant. Your goal is to assist the user in writing code, fixing bugs, and understanding technical concepts.Respond concisely, prioritize clarity, and provide examples where applicable. please speak in Chinese',
        model = 'gpt-4o', -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
        agent = 'copilot', -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
        context = nil, -- Default context or array of contexts to use (can be specified manually in prompt via #).
        temperature = 0.1, -- GPT result temperature

        headless = false, -- Do not write to chat buffer and use history(useful for using callback for custom processing)
        callback = nil, -- Callback to use when ask response is received

        -- default window options
        window = {
            layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
            width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
            height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
            -- Options below only apply to floating windows
            relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
            border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
            row = nil, -- row position of the window, default is centered
            col = nil, -- column position of the window, default is centered
            title = 'Copilot Chat', -- title of chat window
            footer = nil, -- footer of chat window
            zindex = 1, -- determines if window is on top or below other floating windows
        },

        show_help = true, -- Shows help message as virtual lines when waiting for user input
        show_folds = true, -- Shows folds for sections in chat
        highlight_selection = true, -- Highlight selection
        highlight_headers = true, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
        auto_follow_cursor = true, -- Auto-follow cursor in chat
        auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
        insert_at_end = false, -- Move cursor to end of buffer when inserting text
        clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

        -- Static config starts here (can be configured only via setup function)

        debug = false, -- Enable debug logging (same as 'log_level = 'debug')
        log_level = 'info', -- Log level to use, 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections

        chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)
        history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history

        question_header = '# User ', -- Header to use for user questions
        answer_header = '# Copilot ', -- Header to use for AI answers
        error_header = '# Error ', -- Header to use for errors
        separator = '───', -- Separator to use in chat

        -- default contexts
        contexts = {
            buffer = {
            -- see config.lua for implementation
            },
            buffers = {
            -- see config.lua for implementation
            },
            file = {
            -- see config.lua for implementation
            },
            files = {
            -- see config.lua for implementation
            },
            git = {
            -- see config.lua for implementation
            },
            url = {
            -- see config.lua for implementation
            },
            register = {
            -- see config.lua for implementation
            },
        },

        -- default prompts
        prompts = {
            Explain = {
            prompt = '> /COPILOT_EXPLAIN\n\n用文字段落对所选代码进行解释。',
            },
            Review = {
            prompt = '> /COPILOT_REVIEW\n\n查看所选代码。',
            -- see config.lua for implementation
            },
            Fix = {
            prompt = '> /COPILOT_GENERATE\n\n这段代码有问题。请重写代码，以显示已修复错误的代码。',
            },
            Optimize = {
            prompt = '> /COPILOT_GENERATE\n\n优化所选代码，以提高性能和可读性。',
            },
            Docs = {
            prompt = '> /COPILOT_GENERATE\n\n请为所选代码添加文档注释。',
            },
            Tests = {
            prompt = '> /COPILOT_GENERATE\n\n请为我的代码生成测试。',
            },
            Commit = {
            prompt = '> #git:staged\n\n按照 commitizen 惯例为更改编写提交信息。确保标题最多不超过 50 个字符，信息最多不超过 72 个字符。用 gitcommit 语言将整个信息封装在代码块中。',
            },
        },

        -- default mappings
        mappings = {
            complete = {
            insert = '<Tab>',
            },
            close = {
            normal = 'q',
            insert = '<C-c>',
            },
            reset = {
            normal = '<C-l>',
            insert = '<C-l>',
            },
            submit_prompt = {
            normal = '<CR>',
            insert = '<C-s>',
            },
            toggle_sticky = {
            detail = 'Makes line under cursor sticky or deletes sticky line.',
            normal = 'gr',
            },
            accept_diff = {
            normal = '<C-y>',
            insert = '<C-y>',
            },
            jump_to_diff = {
            normal = 'gj',
            },
            quickfix_diffs = {
            normal = 'gq',
            },
            yank_diff = {
            normal = 'gy',
            register = '"',
            },
            show_diff = {
            normal = 'gd',
            },
            show_info = {
            normal = 'gi',
            },
            show_context = {
            normal = 'gc',
            },
            show_help = {
            normal = 'gh',
            },
        },
      },
      -- See Commands section for default commands if you want to lazy load on them
}
