return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = { width = 32 },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle neo-tree" })
    vim.keymap.set("n", "<leader>E", "<cmd>Neotree reveal<cr>", { desc = "Reveal current file in neo-tree" })
  end,
}
