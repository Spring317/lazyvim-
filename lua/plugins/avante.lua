return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, 
  opts = {
    provider = "ollama",
    system_prompt = [[You are an expert developer. Be concise. 
When using tools, strictly follow the XML format provided in the tool documentation.
Do not think out loud or use <think> tags.]],
    vendors = {
      ---@type AvanteProvider
      ollama = {
        __inherited_from = "openai",
        api_key_name = "",
        endpoint = "http://YOUR_CLUSTER_IP:11434/v1",
        model = "qwen3.5:latest",
        temperature = 0.2,
        max_tokens = 16384,
      },
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua", -- Used for providers='copilot' if you want a fallback
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
