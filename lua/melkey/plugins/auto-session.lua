return {
	"rmagatti/auto-session",
	lazy = false,
	dependencies = {
		"nvim-telescope/telescope.nvim", -- optional for Telescope integration
	},
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_enable_last_session = false,
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			auto_session_use_git_branch = false,

			-- Session management keybindings
			session_lens = {
				-- If you want to use telescope for session picker
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},

			-- Hooks to properly handle nvim-tree
			pre_save_cmds = {
				function()
					-- Close nvim-tree before saving session
					local api = require("nvim-tree.api")
					if api.tree.is_visible() then
						api.tree.close()
					end
				end,
			},
			post_restore_cmds = {
				function()
					-- Open nvim-tree after restoring session
					local api = require("nvim-tree.api")
					api.tree.open()
				end,
			},
		})

		-- Set keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>qs", "<cmd>SessionSave<CR>", { desc = "Save session" })
		keymap.set("n", "<leader>qr", "<cmd>SessionRestore<CR>", { desc = "Restore session" })
		keymap.set("n", "<leader>qd", "<cmd>SessionDelete<CR>", { desc = "Delete session" })
		keymap.set("n", "<leader>qf", "<cmd>Telescope session-lens<CR>", { desc = "Find sessions" })
	end,
}
