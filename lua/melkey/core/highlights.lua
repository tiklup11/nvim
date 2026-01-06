-- Custom syntax highlighting with bold styles (preserving theme colors)
local M = {}

function M.setup()
	-- Function to get existing highlight and merge with new attributes
	local function set_hl(group, new_attrs)
		-- Get existing highlight
		local existing = vim.api.nvim_get_hl(0, { name = group })
		-- Merge existing colors with new attributes
		local merged = vim.tbl_extend("force", existing, new_attrs)
		vim.api.nvim_set_hl(0, group, merged)
	end

	-- Make functions bold (keep theme colors)
	set_hl("Function", { bold = true })
	set_hl("@function", { bold = true })
	set_hl("@function.call", { bold = true })
	set_hl("@function.method", { bold = true })

	-- Make keywords bold (keep theme colors)
	set_hl("Keyword", { bold = true })
	set_hl("@keyword", { bold = true })
	set_hl("@keyword.function", { bold = true })
	set_hl("@keyword.return", { bold = true })

	-- Make types bold (keep theme colors)
	set_hl("Type", { bold = true })
	set_hl("@type", { bold = true })
	set_hl("@type.builtin", { bold = true })
	set_hl("@type.definition", { bold = true })
	set_hl("@type.qualifier", { bold = true })

	-- Make class names bold (keep theme colors)
	set_hl("@constructor", { bold = true })
	set_hl("@class", { bold = true })


	-- Make comments italic (keep theme colors)
	set_hl("Comment", { italic = true })

	-- Make error/warning messages bold (keep theme colors)
	set_hl("DiagnosticError", { bold = true })
	set_hl("DiagnosticWarn", { bold = true })
end

return M
