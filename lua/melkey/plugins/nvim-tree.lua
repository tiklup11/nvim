return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 30,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				-- Default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- Custom mappings to open files in new tab by default
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- Custom function to open file in a new tab (VSCode style)
				local function open_file_in_new_tab()
					local node = api.tree.get_node_under_cursor()
					if node.type == "directory" then
						-- For directories, use default toggle behavior
						api.node.open.edit()
					elseif node.type == "file" then
						-- Check if there are any windows to the right
						local current_win = vim.api.nvim_get_current_win()
						vim.cmd("wincmd l")
						local right_win = vim.api.nvim_get_current_win()

						-- If we didn't move to a different window, create a vertical split first
						if current_win == right_win then
							vim.cmd("vsplit")
						end

						-- Open file in a new tab in the right area
						vim.cmd("tabnew " .. vim.fn.fnameescape(node.absolute_path))

						-- Reopen nvim-tree in the new tab on the left
						vim.cmd("NvimTreeOpen")
						vim.cmd("wincmd H") -- Move tree to far left
						vim.cmd("vertical resize 30")
						vim.cmd("wincmd l") -- Move cursor back to file
					end
				end

				-- Override default open behavior
				vim.keymap.set("n", "<CR>", open_file_in_new_tab, opts("Open: In New Tab"))
				vim.keymap.set("n", "o", open_file_in_new_tab, opts("Open: In New Tab"))
				vim.keymap.set("n", "<2-LeftMouse>", open_file_in_new_tab, opts("Open: In New Tab"))
			end,
		})

		-- Auto-reveal current file in tree when switching buffers
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("NvimTreeAutoReveal", { clear = true }),
			callback = function()
				local api = require("nvim-tree.api")
				if api.tree.is_visible() then
					api.tree.find_file({ open = true, focus = false })
				end
			end,
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>eo", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer open/toggle" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Explorer find current file" })
		keymap.set("n", "<leader>ex", "<cmd>NvimTreeClose<CR>", { desc = "Explorer close" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Explorer refresh" })
	end,
}
