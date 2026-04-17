return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)

    -- THE FIX: Force all CodeCompanion buffers to be modifiable
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "codecompanion" },
      callback = function()
        vim.opt_local.modifiable = true
        vim.opt_local.readonly = false
      end,
    })
  end,
  opts = {
    strategies = {
      chat = {
        adapter = "ollama",
        opts = { is_modifiable = true },
      },
      inline = { adapter = "ollama" },
      agent = {
        adapter = "ollama",
        opts = {
          allow_insecure_commands = true,
          -- THE FIX: Automatically approve tool calls to stop the g1/q1 menu
          auto_submit_success = true,
          auto_submit_errors = false,
        },
        -- ALL TOOLS ENABLED HERE
        tools = {
          "ask_questions", -- Allows model to ask you for clarification
          "create_file", -- Allows model to create new files
          "delete_file", -- Allows model to delete files
          "file_search", -- Allows model to find files by name
          "get_changed_files", -- Allows model to see git diffs
          "get_diagnostics", -- Allows model to see LSP errors/warnings
          "grep_search", -- Allows model to search text inside files
          "insert_edit_into_file", -- Allows model to rewrite code blocks
          "read_file", -- Allows model to read file contents
          "run_command", -- Allows model to run terminal commands (pytest, etc.)
          "fetch_webpage", -- Allows model to see web content (requires jina)
        },
      },
    },
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = { default = "qwen3.5:latest" },
            num_ctx = { default = 16384 },
            temperature = { default = 0.2 },
          },
        })
      end,
    },
    -- Global instructions to keep Qwen efficient
    opts = {
      system_prompt = function()
        return [[You are an expert developer. Be concise. 
When using tools, strictly follow the XML format provided in the tool documentation.
Do not think out loud or use <think> tags.]]
      end,
    },
  },
}
