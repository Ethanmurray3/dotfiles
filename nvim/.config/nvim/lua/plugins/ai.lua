local ollama_chat_model = "qwen2.5-coder:7b"
local ollama_completion_model = "qwen2.5-coder:1.5b"

return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        provider = "openai_fim_compatible",
        n_completions = 1,
        request_timeout = 5,
        context_window = 1024,
        throttle = 600,
        debounce = 250,
        cmp = {
          enable_auto_complete = true,
        },
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
      })
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        ["<C-j>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
      },
      sources = {
        default = { "lsp", "path", "buffer", "snippets", "minuet" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            async = true,
            timeout_ms = 3000,
            score_offset = 50,
          },
        },
      },
      completion = {
        trigger = {
          prefetch_on_insert = false,
        },
      },
    },
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
      { "<leader>aa", "<cmd>CodeCompanion<cr>", mode = "n", desc = "AI prompt" },
      { "<leader>aa", ":CodeCompanion<cr>", mode = "v", desc = "AI prompt selection" },
      { "<leader>as", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI actions" },
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
