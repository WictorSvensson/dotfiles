return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha     = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- ── Header ──────────────────────────────────────────────────────────
    dashboard.section.header.val = {
      "██╗    ██╗███████╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      "██║    ██║██╔════╝    ████╗  ██║██║   ██║██║████╗ ████║",
      "██║ █╗ ██║███████╗    ██╔██╗ ██║██║   ██║██║██╔████╔██║",
      "██║███╗██║╚════██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "╚███╔███╔╝███████║    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      " ╚══╝╚══╝ ╚══════╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }
    dashboard.section.header.opts.hl = "AlphaHeader"

    -- ── Buttons ─────────────────────────────────────────────────────────
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File",    "<cmd>Telescope find_files<CR>"),
      dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("n", "  New File",     "<cmd>ene <BAR> startinsert<CR>"),
      dashboard.button("e", "  Open Sidebar", "<cmd>Neotree toggle<CR>"),
      dashboard.button("g", "  LazyGit",      "<cmd>LazyGit<CR>"),
      dashboard.button("q", "  Quit",         "<cmd>qa<CR>"),
    }

    -- ── Footer ───────────────────────────────────────────────────────────
    local stats = require("lazy").stats()
    local version = vim.version()
    dashboard.section.footer.val = string.format(
      "  %d plugins   v%d.%d.%d",
      stats.count, version.major, version.minor, version.patch
    )
    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- ── Highlights ───────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#7aa2f7", bold = true })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#565f89", italic = true })

    -- ── Hide statusline on the dashboard ─────────────────────────────────
    vim.api.nvim_create_autocmd("User", {
      pattern  = "AlphaReady",
      callback = function() vim.opt.laststatus = 0 end,
    })
    vim.api.nvim_create_autocmd("BufWinLeave", {
      pattern  = "*",
      callback = function()
        if vim.bo.filetype == "alpha" then
          vim.opt.laststatus = 3
        end
      end,
    })

    alpha.setup(dashboard.opts)
  end,
}
