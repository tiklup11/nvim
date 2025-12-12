return {
	"mg979/vim-visual-multi",
	branch = "master",
	lazy = false, -- Load immediately, don't lazy load
	init = function()
		-- VM (Visual Multi) settings
		vim.g.VM_theme = "iceblue"
		vim.g.VM_mouse_mappings = 1

		-- Disable default mappings to avoid conflicts
		vim.g.VM_default_mappings = 0

		-- Custom mappings (VSCode-like)
		vim.g.VM_maps = {
			["Find Under"] = "<C-d>", -- Ctrl+d: Start multi-cursor and find under cursor (like VSCode)
			["Find Subword Under"] = "<C-d>", -- Same as above
			["Add Cursor Down"] = "<C-Down>", -- Add cursor down
			["Add Cursor Up"] = "<C-Up>", -- Add cursor up
			["Select All"] = "<C-A-n>", -- Select all occurrences
			["Skip Region"] = "q", -- Skip current and move to next
			["Remove Region"] = "Q", -- Remove current cursor
			["Undo"] = "u",
			["Redo"] = "<C-r>",
		}
	end,
}
