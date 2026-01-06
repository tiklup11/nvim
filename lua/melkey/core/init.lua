require("melkey.core.options")
require("melkey.core.keymaps")

-- Load custom highlights after plugins are loaded
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		require("melkey.core.highlights").setup()
	end,
})

-- Apply highlights immediately
vim.defer_fn(function()
	require("melkey.core.highlights").setup()
end, 100)
