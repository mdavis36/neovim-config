return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = {
        --enabled = false, when .md
        enabled = function() return not vim.tbl_contains({ "markdown" }, vim.bo.filetype) end,
      },
      menu = {
        --auto_show = false, when .md
        auto_show = function() return not vim.tbl_contains({ "markdown" }, vim.bo.filetype) end,
      },

      list = {
        selection = {
          -- Do not pre-select an option.
          preselect = false,

          -- When traversing the menu auto insert when manually selected.
          auto_insert = true,
        },
      },
    },
  },
}
