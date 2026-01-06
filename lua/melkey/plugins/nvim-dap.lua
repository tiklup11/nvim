return {
	-- DAP (Debug Adapter Protocol) - Core debugger
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- UI for DAP
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",

			-- Virtual text showing variable values
			"theHamsta/nvim-dap-virtual-text",

			-- Language-specific adapters
			"leoluz/nvim-dap-go", -- Go debugger
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Setup DAP UI
			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 10,
						position = "bottom",
					},
				},
			})

			-- Setup virtual text
			require("nvim-dap-virtual-text").setup()

			-- Setup Go debugger (Delve) with explicit path
			require("dap-go").setup({
				delve = {
					path = vim.fn.expand("~/go/bin/dlv"), -- absolute path to dlv
					initialize_timeout_sec = 20,
					port = "${port}",
				},
			})

			-- Automatically open/close DAP UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Terminate debug session when exiting nvim
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					if dap.session() then
						dap.terminate()
					end
				end,
			})

			-- VSCode-like launch.json support
			-- Map VSCode's "go" type to nvim-dap's "delve"
			require("dap.ext.vscode").load_launchjs(nil, {
				go = { "go" },
				delve = { "go" },
				node = { "javascript", "typescript" },
			})

			-- Keymaps (VSCode-like)
			local keymap = vim.keymap

			keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			keymap.set("n", "<S-F5>", dap.terminate, { desc = "Debug: Stop" })
			keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
			keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
			keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
			keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Conditional Breakpoint" })

			-- Additional keymaps
			keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
			keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })
			keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Debug: Toggle UI" })
			keymap.set("n", "<leader>dc", function()
				require("dapui").open("console")
			end, { desc = "Debug: Open Console" })
		end,
	},
}
