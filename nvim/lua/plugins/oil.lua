return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false, -- needed so oil hijacks `nvim .` and replaces netrw
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["q"] = "actions.close",
      },
    })

    vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent dir (oil)" })
    vim.keymap.set("n", "<leader>-", "<cmd>Oil --float<cr>", { desc = "Open parent dir (oil float)" })
  end,
}
