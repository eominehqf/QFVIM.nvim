return {
    -- markdown preview from nvim
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      vim.g.mkdp_auto_start = 1  -- 自动启动
      vim.g.mkdp_markdown_css = "/path/to/your/custom.css"  -- 自定义样式路径
      vim.g.mkdp_theme = 'light'  -- 主题设置
      vim.g.disable_sync_scroll = 0
    end,
  }