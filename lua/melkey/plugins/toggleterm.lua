return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>so", "<cmd>ToggleTerm direction=float<CR>", { desc = "Shell open (floating)" })
		keymap.set("n", "<leader>sh", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Shell horizontal" })
		keymap.set("n", "<leader>sv", "<cmd>ToggleTerm direction=vertical size=80<CR>", { desc = "Shell vertical" })
		keymap.set("n", "<leader>sx", "<cmd>ToggleTerm<CR>", { desc = "Shell close" })

		-- Terminal mode mappings
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
