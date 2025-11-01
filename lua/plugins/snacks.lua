vim.keymap.set("n", "<leader>fd", function() Snacks.picker.git_files({ cwd = "~/dotfiles", hidden= true }) end, { desc = "Find in dotfiles" })

return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      formats = {
        "png",
        "jpg",
        "gif",
        "bmp",
        "webp",
        "webm",
        "svg",
      },
    },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          hidden = true,
        },
      },
    },
  },
}
