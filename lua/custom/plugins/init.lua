-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'tpope/vim-fugitive' },
  {
    'theprimeagen/harpoon',
    config = function()
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      vim.keymap.set('n', '<leader>a', mark.add_file)
      vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

      vim.keymap.set('n', '<C-h>', function()
        ui.nav_file(1)
      end)
      vim.keymap.set('n', '<C-g>', function()
        ui.nav_file(2)
      end)
      vim.keymap.set('n', '<C-,>', function()
        ui.nav_file(3)
      end)
      vim.keymap.set('n', '<C-.>', function()
        ui.nav_file(4)
      end)
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'aznhe21/actions-preview.nvim',
    lazy = true,
    event = 'VeryLazy',
  },
}
