return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		spec = {
			{ "<leader>e", group = "Explorer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>t", group = "Tab" },
			{ "<leader>w", group = "Window" },
			{ "<leader>x", group = "Trouble" },
		},
	},
}
