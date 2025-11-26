return {
  "git@github.com:mdavis36/cursor-agent.nvim.git",
  --dir = "/root/cursor-agent.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    -- Customise if your binary is named differently, e.g. "cursor"
    terminal_cmd = "cursor-agent",
    --log_level = "debug",
  },
  config = true,
  keys = {
    { "<leader>a", nil, desc = "AI/Cursor Agent" },
    { "<leader>ac", "<cmd>CursorAgent<cr>", desc = "Toggle Cursor" },
    { "<leader>af", "<cmd>CursorAgentFocus<cr>", desc = "Focus Cursor" },
    { "<leader>ar", "<cmd>CursorAgent --resume<cr>", desc = "Resume Cursor" },
    { "<leader>aC", "<cmd>CursorAgent --continue<cr>", desc = "Continue Cursor" },
    --{ "<leader>am", "<cmd>CursorAgentSelectModel<cr>", desc = "Select Cursor model" },
    --{ "<leader>ab", "<cmd>CursorAgentAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>CursorAgentSend<cr>", mode = "v", desc = "Send to Cursor" },
    {
      "<leader>as",
      "<cmd>CursorAgentTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>CursorAgentDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>CursorAgentDiffDeny<cr>", desc = "Deny diff" },
  },
}
