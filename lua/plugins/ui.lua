-- Unified look with Ghostty (`theme = light:Adwaita,dark:Adwaita Dark`).
--
-- adwaita.nvim picks its light/dark variant from `vim.o.background`, and
-- Neovim >= 0.10 sets that automatically by asking the terminal for its
-- background colour (OSC 11). That query travels over SSH just like the
-- clipboard one, so the remote editor follows the local terminal's theme.
return {
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      -- Transparent background = the editor shows Ghostty's own Adwaita
      -- backdrop, so the nvim pane and the Claude Code pane are literally
      -- the same colour rather than two near-misses.
      vim.g.adwaita_transparent = true
      vim.g.adwaita_darker = false
      vim.g.adwaita_disable_cursorline = false
    end,
  },

  -- Tell LazyVim to use it instead of the default tokyonight.
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "adwaita" },
  },

  -- The VS Code-style animated caret.
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      -- Needed because we run with a transparent background: the smear has
      -- no real bg colour to sample, so give it the Adwaita Dark backdrop.
      transparent_bg_fallback_color = "#1e1e1e",
      stiffness = 0.8,
      trailing_stiffness = 0.6,
      distance_stop_animating = 0.5,
    },
  },

  -- snacks.nvim already ships with LazyVim; just switch on the animated bits.
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = true }, -- smooth scrolling
      indent = { enabled = true }, -- animated indent guides

      terminal = {
        win = {
          -- snacks windows default to `position = "float"`, and a float maps
          -- Normal -> SnacksNormal -> NormalFloat (#36363a under Adwaita),
          -- which is why the terminal sat on a different grey to everything
          -- else. A bottom split also makes it resizable with <C-w>+/-.
          position = "bottom",
          height = 0.35,
          -- Point the terminal window back at plain Normal, which is
          -- transparent, so it shows Ghostty's backdrop like the editor does.
          wo = { winhighlight = "Normal:Normal,NormalNC:Normal" },
        },
      },
    },
  },
}
