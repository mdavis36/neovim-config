return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    code = {
      sign = false,
      width = "block",
      left_pad = 2,
      right_pad = 4,
      border = "thick",
    },
    heading = {
      sign = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      width = "block",
      position = "inline",
      left_pad = 2,
      right_pad = 2,
    },
    checkbox = {
      enabled = true,
      bullet = false,
      unchecked = { icon = "󰆢", highlight = "RenderMarkdownChecked", scope_highlight = nil },
      checked = {
        icon = "󰅘",
        highlight = "RenderMarkdownChecked",
        scope_highlight = nil
      },
      custom = {
        todo = {
          raw = "[-]",
          rendered = "󰅘",
          highlight = "RenderMarkdownChecked",
          scope_highlight = "@markup.strikethrough"
        },
        inprogress = {
          raw = "[~]",
          rendered = "󰛲",
          highlight = "RenderMarkdownChecked",
          scope_highlight = nil
        },
        pushed = {
          raw = "[>]",
          rendered = "󰜶",
          highlight = "RenderMarkdownChecked",
          scope_highlight = nil
        },
        cancelled = { raw = "[!]",
          rendered = "󰳤",
          highlight = "RenderMarkdownChecked",
          scope_highlight = nil
        },
      },
    },
  },

  ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
  config = function(_, opts)
    require("render-markdown").setup(opts)
    Snacks.toggle({
      name = "Render Markdown",
      get = function()
        return require("render-markdown.state").enabled
      end,
      set = function(enabled)
        local m = require("render-markdown")
        if enabled then
          m.enable()
        else
          m.disable()
        end
      end,
    }):map("<leader>um")
  end,
}
