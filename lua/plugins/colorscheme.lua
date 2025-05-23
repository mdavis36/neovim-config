return {
  {
    "mdavis36/vscode.nvim",
    branch = "feature/render-md-headers",
    opts = {
      underline_links = true,
    },
  },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
