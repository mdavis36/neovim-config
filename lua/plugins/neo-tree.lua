return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },

    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.cmd([[setlocal relativenumber]])
        end,
      },
    },
  },
}
