return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
	opts = {
		options = {
			numbers = "none",
			close_command = "bdelete! %d",
			right_mouse_command = nil,
			left_mouse_command = "buffer %d",
			middle_mouse_command = nil,
			indicator = {
			  icon = "▎", -- this should be omitted if indicator style is not 'icon'
			  style = "icon",
			},
			offsets = {
				{
				  filetype = "NvimTree", -- NvimTree 缓冲区偏移
				  text = "File Explorer",
				  text_align = "center",
				  separator = true,
				},
			  },
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 18,
			max_prefix_length = 15,
			tab_size = 10,
			diagnostics = false,
			custom_filter = function(bufnr)
			  -- if the result is false, this buffer will be shown, otherwise, this
			  -- buffer will be hidden.
		
			  -- filter out filetypes you don't want to see
			  local exclude_ft = { "qf", "fugitive", "git" }
			  local cur_ft = vim.bo[bufnr].filetype
			  local should_filter = vim.tbl_contains(exclude_ft, cur_ft)
		
			  if should_filter then
				return false
			  end
		
			  return true
			end,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			separator_style = "slant",
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			sort_by = "id",
		  },
	},
	-- 切换到下一个缓冲区
	vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Next buffer" }),
	-- 切换到上一个缓冲区
	vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Previous buffer" }),
	-- 关闭当前缓冲区
	vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", { noremap = true, silent = true, desc = "Close buffer" }),
}
