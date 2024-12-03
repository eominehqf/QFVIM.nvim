return {
    -- Mason 主插件
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- 安装或更新时自动更新 Mason 包
    cmd = "Mason", -- 在使用 Mason 命令时加载
    opts = {
        ui = {
            border = "rounded", -- 美化 Mason UI 边框
            width = 0.8,
            height = 0.9,
            icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
            },
        },
        keymaps = {
            ---@since 1.0.0
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            ---@since 1.0.0
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            ---@since 1.0.0
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            ---@since 1.0.0
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            ---@since 1.0.0
            -- Keymap to update all installed packages
            update_all_packages = "U",
            ---@since 1.0.0
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            ---@since 1.0.0
            -- Keymap to uninstall a package
            uninstall_package = "X",
            ---@since 1.0.0
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            ---@since 1.0.0
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
            ---@since 1.1.0
            -- Keymap to toggle viewing package installation log
            toggle_package_install_log = "<CR>",
            ---@since 1.8.0
            -- Keymap to toggle the help view
            toggle_help = "g?",
        },
    },
}  