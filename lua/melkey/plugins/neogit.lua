return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")

		neogit.setup({
			-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
			-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
			auto_refresh = true,
			-- Value used for `--sort` option for `git branch` command
			-- By default, branches will be sorted by commit date descending
			-- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
			sort_branches = "-committerdate",
			-- Disable signs
			signs = {
				-- { CLOSED, OPENED }
				hunk = { "", "" },
				item = { ">", "v" },
				section = { ">", "v" },
			},
			-- Integration settings
			integrations = {
				-- If enabled, use telescope for menu selection rather than vim.ui.select.
				telescope = true,
				-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
				diffview = true,
			},
			-- Setting any section to `false` will make the section not render at all
			sections = {
				-- Reverting/Cherry Picking
				sequencer = {
					folded = false,
					hidden = false,
				},
				untracked = {
					folded = false,
					hidden = false,
				},
				unstaged = {
					folded = false,
					hidden = false,
				},
				staged = {
					folded = false,
					hidden = false,
				},
				stashes = {
					folded = true,
					hidden = false,
				},
				unpulled_upstream = {
					folded = true,
					hidden = false,
				},
				unmerged_upstream = {
					folded = false,
					hidden = false,
				},
				unpulled_pushRemote = {
					folded = true,
					hidden = false,
				},
				unmerged_pushRemote = {
					folded = false,
					hidden = false,
				},
				recent = {
					folded = true,
					hidden = false,
				},
				rebase = {
					folded = true,
					hidden = false,
				},
			},
			-- mappings can be customized if needed
			-- mappings = {
			-- 	status = {
			-- 		-- custom mappings here
			-- 	},
			-- },
		})

		-- Set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>gs", function()
			neogit.open()
		end, { desc = "Git status (Neogit)" })

		keymap.set("n", "<leader>gc", function()
			neogit.open({ "commit" })
		end, { desc = "Git commit" })

		keymap.set("n", "<leader>gp", function()
			neogit.open({ "push" })
		end, { desc = "Git push" })

		keymap.set("n", "<leader>gP", function()
			neogit.open({ "pull" })
		end, { desc = "Git pull" })

		keymap.set("n", "<leader>gb", function()
			neogit.open({ "branch" })
		end, { desc = "Git branch" })

		keymap.set("n", "<leader>gl", function()
			neogit.open({ "log" })
		end, { desc = "Git log" })

		keymap.set("n", "<leader>gd", function()
			vim.cmd("DiffviewOpen")
		end, { desc = "Git diff (Diffview)" })

		keymap.set("n", "<leader>gD", function()
			vim.cmd("DiffviewClose")
		end, { desc = "Git diff close" })

		keymap.set("n", "<leader>gh", function()
			vim.cmd("DiffviewFileHistory")
		end, { desc = "Git file history" })
	end,
}
