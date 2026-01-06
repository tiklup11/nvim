return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
      -- Show path relative to workspace/cwd
      name_formatter = function(buf)
        -- Get the file path relative to current working directory
        local filepath = vim.fn.fnamemodify(buf.path, ':~:.')
        return filepath
      end,
      -- Show full path in tab name
      tab_name_formatter = function(tab)
        local bufnr = vim.fn.tabpagebuflist(tab.tabnr)[vim.fn.tabpagewinnr(tab.tabnr)]
        local filepath = vim.api.nvim_buf_get_name(bufnr)
        -- Get path relative to workspace
        return vim.fn.fnamemodify(filepath, ':~:.')
      end,
    },
  },
}
