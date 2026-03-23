return {
  {
    "tiagovla/tokyodark.nvim",
    lazy = false, -- makes sure we load this during startup
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme "tokyodark" -- sets the colorscheme to tokyodark
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
        dependencies = {
          "nvim-tree/nvim-web-devicons", -- imports icon dependency
        },
        opts = {
          theme = "tokyodark", -- sets the lualine theme to tokyodark
      }
  },
}
