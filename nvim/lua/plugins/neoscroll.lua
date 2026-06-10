return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({
      easing = "sine",
      hide_cursor = false,
    })

    local ns = require("neoscroll")
    local keymap = {
      ["<C-u>"] = function() ns.ctrl_u({ duration = 150 }) end,
      ["<C-d>"] = function() ns.ctrl_d({ duration = 150 }) end,
      ["<C-b>"] = function() ns.ctrl_b({ duration = 250 }) end,
      ["<C-f>"] = function() ns.ctrl_f({ duration = 250 }) end,
      ["<C-y>"] = function() ns.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
      ["<C-e>"] = function() ns.scroll( 0.1, { move_cursor = false, duration = 100 }) end,
      ["zt"]    = function() ns.zt({ duration = 150 }) end,
      ["zz"]    = function() ns.zz({ duration = 150 }) end,
      ["zb"]    = function() ns.zb({ duration = 150 }) end,
    }

    for key, fn in pairs(keymap) do
      vim.keymap.set({ "n", "v", "x" }, key, fn)
    end
  end,
}
