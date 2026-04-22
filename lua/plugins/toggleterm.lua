return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "vertical",
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return math.floor(vim.o.columns * 0.4)
      end
    end,
    -- Configure the terminal to open side-by-side
    open_mapping = [[<leader>T]],
  },
  keys = {
    { "<leader>T", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal (Vertical)", mode = { "n", "i", "t", "v" } },
  },
}
