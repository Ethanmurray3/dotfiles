local ollama_chat_model = "qwen2.5-coder:7b"
local ollama_completion_model = "qwen2.5-coder:1.5b"

local function add_unique(list, value)
  for _, item in ipairs(list) do
    if item == value then
      return
    end
  end

  table.insert(list, value)
end

return {
  {
    "milanglacier/minuet-ai.nvim",
    event = "InsertEnter",
    cmd = "Minuet",
    opts = {
      provider = "openai_fim_compatible",
      n_completions = 1,
      request_timeout = 5,
      context_window = 1024,
      throttle = 600,
      debounce = 250,
      provider_options = {
        openai_fim_compatible = {
          api_key = "TERM",
          name = "Ollama",
          end_point = "http://localhost:11434/v1/completions",
          model = ollama_completion_model,
          stream = false,
          optional = {
            max_tokens = 96,
            top_p = 0.9,
          },
        },
      },
    },
  },

  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or { "lsp", "path", "snippets", "buffer" }
      add_unique(opts.sources.default, "minuet")

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.minuet = {
        name = "minuet",
        module = "minuet.blink",
        async = true,
        timeout_ms = 5000,
        score_offset = 80,
      }

      opts.keymap = opts.keymap or {}
      opts.keymap["<A-y>"] = require("minuet").make_blink_map()

      opts.completion = opts.completion or {}
      opts.completion.trigger = opts.completion.trigger or {}
      opts.completion.trigger.prefetch_on_insert = false
    end,
  },

  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd",
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI actions" },
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI chat" },
      { "<leader>ad", "<cmd>CodeCompanion /lsp<cr>", mode = { "n", "v" }, desc = "AI explain diagnostic" },
      { "<leader>ae", "<cmd>CodeCompanion /explain<cr>", mode = { "n", "v" }, desc = "AI explain code" },
      { "<leader>af", "<cmd>CodeCompanion /fix<cr>", mode = { "n", "v" }, desc = "AI fix code" },
      { "<leader>at", "<cmd>CodeCompanion /tests<cr>", mode = { "n", "v" }, desc = "AI generate tests" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      interactions = {
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
        cmd = {
          adapter = "ollama",
        },
        background = {
          adapter = "ollama",
        },
      },
      adapters = {
        http = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              schema = {
                model = {
                  default = ollama_chat_model,
                },
                num_ctx = {
                  default = 8192,
                },
                num_predict = {
                  default = 2048,
                },
                temperature = {
                  default = 0.2,
                },
                keep_alive = {
                  default = "10m",
                },
              },
            })
          end,
        },
      },
      opts = {
        log_level = "WARN",
      },
    },
  },
}
