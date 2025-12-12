return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    focus = true,
  },
  cmd = "Trouble",
  keys = {
    { "<leader>po", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Problems open (current file)" },
    { "<leader>pw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Problems workspace" },
    { "<leader>px", "<cmd>Trouble diagnostics toggle<CR>", desc = "Problems close" },
    { "<leader>pq", "<cmd>Trouble quickfix toggle<CR>", desc = "Problems quickfix" },
    { "<leader>pl", "<cmd>Trouble loclist toggle<CR>", desc = "Problems location list" },
    { "<leader>pt", "<cmd>Trouble todo toggle<CR>", desc = "Problems todos" },
  },
}
