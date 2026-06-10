return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      extensions = {
        file_browser = {
          hijack_netrw = false, -- oil owns this
          hidden = { file_browser = true, folder_browser = true },
          grouped = true,
          select_buffer = true,
        },
      },
    })
    telescope.load_extension("file_browser")

    local builtin = require("telescope.builtin")
    local function buf_dir()
      return vim.fn.expand("%:p:h")
    end

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

    vim.keymap.set("n", "<leader>fF", function()
      builtin.find_files({ cwd = buf_dir() })
    end, { desc = "Find files (current buffer dir)" })

    vim.keymap.set("n", "<leader>fG", function()
      builtin.live_grep({ cwd = buf_dir() })
    end, { desc = "Live grep (current buffer dir)" })

    vim.keymap.set("n", "<leader>fe", function()
      telescope.extensions.file_browser.file_browser({
        path = buf_dir(),
        select_buffer = true,
      })
    end, { desc = "File browser (current buffer dir)" })
  end,
}
