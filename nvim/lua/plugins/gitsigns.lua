return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
      },
      current_line_blame = false,
      current_line_blame_opts = {
        delay = 300,
      },
    })

    local gs = require("gitsigns")

    -- Hunk navigation
    vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next git hunk" })
    vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev git hunk" })

    -- Stage / reset
    vim.keymap.set("n", "<leader>hs", gs.stage_hunk,   { desc = "Stage hunk" })
    vim.keymap.set("n", "<leader>hr", gs.reset_hunk,   { desc = "Reset hunk" })
    vim.keymap.set("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage selected hunks" })
    vim.keymap.set("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset selected hunks" })
    vim.keymap.set("n", "<leader>hS", gs.stage_buffer,  { desc = "Stage buffer" })
    vim.keymap.set("n", "<leader>hR", gs.reset_buffer,  { desc = "Reset buffer" })

    -- Preview / blame / diff
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk,               { desc = "Preview hunk" })
    vim.keymap.set("n", "<leader>hb", gs.toggle_current_line_blame,  { desc = "Toggle inline blame" })
    vim.keymap.set("n", "<leader>hd", gs.diffthis,                   { desc = "Diff this file" })
  end,
}
