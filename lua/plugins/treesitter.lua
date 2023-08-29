return {
  'windwp/nvim-ts-autotag',
  'HiPhish/nvim-ts-rainbow2',

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ":TSUpdate",
    config = function()
      -- require 'nvim-treesitter.install'.compilers = { 'zig' }
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          'c', 'cpp',
          'css',
          'go',
          'html',
          'javascript',
          'lua',
          'rust',
          'tsx',
          'typescript',
          'vimdoc',
          'vim',
          'vue',
        },
        auto_install = true,
        sync_install = false,

        autotag = { enable = true },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true, disable = { 'python' }
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<S-space>',
            node_incremental = '<S-space>',
            node_decremental = '<S-Z>',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>z'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>Z'] = '@parameter.inner',
          },
        },

        rainbow = {
          enable = true,
          disable = { 'jsx', 'tsx' },
          hlgroups = {
            'TSRainbowYellow',
            'TSRainbowBlue',
            'TSRainbowGreen',
            'TSRainbowViolet',
          }
        }
      }
    end
  },

  -- probably will need to migrate after updating nvim and treesitter
  -- {
  --   'HiPhish/rainbow-delimiters.nvim',
  --   config = function()
  --     local rainbow_delimiters = require 'rainbow-delimiters'
  --     vim.g.rainbow_delimiters = {
  --       strategy = {
  --         [''] = rainbow_delimiters.strategy['global'],
  --         vim = rainbow_delimiters.strategy['local'],
  --       },
  --       query = {
  --         [''] = 'rainbow-delimiters',
  --         lua = 'rainbow-blocks',
  --       },
  --       -- disable = { 'jsx', 'tsx' },
  --       highlight = {
  --         'RainbowDelimiterYellow',
  --         'RainbowDelimiterBlue',
  --         'RainbowDelimiterGreen',
  --         'RainbowDelimiterViolet',
  --         -- 'RainbowDelimiterRed',
  --         -- 'RainbowDelimiterOrange',
  --         -- 'RainbowDelimiterCyan',
  --       },
  --     }
  --   end
  -- },

  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      local c = require("treesitter-context")
      c.setup {}
      vim.keymap.set("n", "[c", c.go_to_context, { silent = true })
    end
  },

  'nvim-treesitter/playground',
}
