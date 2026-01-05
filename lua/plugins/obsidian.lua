vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Backlinks to current note" })

vim.keymap.set("n", "<leader>oV", "<cmd>ObsidianFollowLink vsplit_force<cr>", { desc = "Open link in v-split" })

vim.keymap.set("n", "<leader>oo", "<cmd>cd ~/PARA<cr>", { desc = "Jump to PARA dir" })

vim.keymap.set("n", "<leader>ost", "<cmd>ObsidianTags<cr>", { desc = "List Obsidian Tags" })

vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "Create new note" })

vim.keymap.set("n", "<leader><cr>", "<cmd>Obsidian preview_link<cr>", { desc = "Preview current link" })

vim.keymap.set("n", "<leader>oit", "<cmd>ObsidianTemplate<cr>", { desc = "Insert template" })

vim.keymap.set("n", "<leader>od", "<cmd>Obsidian today<cr>", { desc = "Open todays note" })
vim.keymap.set("n", "<leader>ow", "<cmd>Obsidian weekly<cr>", { desc = "Open this weeks note" })
vim.keymap.set("n", "<leader>om", "<cmd>Obsidian monthly<cr>", { desc = "Open this months note" })
vim.keymap.set("n", "<leader>oq", "<cmd>Obsidian quarterly<cr>", { desc = "Open this quarters note" })
vim.keymap.set("n", "<leader>oy", "<cmd>Obsidian yearly<cr>", { desc = "Open this years note" })

vim.keymap.set("n", "<leader>oD", "<cmd>Obsidian dailies<cr>", { desc = "Open todays note" })
vim.keymap.set("n", "<leader>oW", "<cmd>Obsidian weeklies<cr>", { desc = "Open this weeks note" })
vim.keymap.set("n", "<leader>oM", "<cmd>Obsidian monthlies<cr>", { desc = "Open this months note" })
vim.keymap.set("n", "<leader>oQ", "<cmd>Obsidian quarterlies<cr>", { desc = "Open this quarters note" })
vim.keymap.set("n", "<leader>oY", "<cmd>Obsidian yearlies<cr>", { desc = "Open this years note" })

return {
  --"obsidian-nvim/obsidian.nvim",
  --version = "*",
  "mdavis36/obsidian.nvim",
  branch = "md/main",

  ft = "markdown",

  opts = {
    workspaces = {
      {
        name = "PARA",
        path = "~/PARA",
      },
      {
        name = "test",
        path = "~/MD-TEST",
      },
    },

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {
        pretty_date = function()
            return os.date("%B %-d, %Y", os.time())
        end,
        daily_date = function(ctx)
            local date_string_yyyymmdd = ctx.partial_note.id

            -- Parse the YYYY-MM-DD string into a table suitable for os.time
            local year, month, day = date_string_yyyymmdd:match("(%d%d%d%d)-(%d%d)-(%d%d)")
            local date_table = {
                year = tonumber(year),
                month = tonumber(month),
                day = tonumber(day)
            }

            -- Convert the date table to a Unix timestamp
            local timestamp = os.time(date_table)

            -- Format the timestamp into the desired %B %d, %Y format
            local formatted_date = os.date("%B %d, %Y", timestamp)

            return formatted_date
            --print(formatted_date)
            --return os.date("%B %-d, %Y", os.date)
        end,
      },
    },

    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,

    daily_notes = {
      enabled = true,
      folder = "1 - Areas/journal/daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
      template = "templates/calendar/daily.md",
      workdays_only = false,
    },

    weekly_notes = {
      enabled = true,
      folder = "1 - Areas/journal/weekly",
      template = "calendar/weekly.md",
    },

    monthly_notes = {
      enabled = true,
      folder = "1 - Areas/journal/monthly",
      template = "calendar/monthly.md",
    },

    quarterly_notes = {
      enabled = true,
      folder = "notes/quarterly",
      template = "calendar/quarterly.md",
    },

    yearly_notes = {
      enabled = true,
      folder = "notes/yearly",
      template = "calendar/yearly.md",
    },
  },
}

-----@diagnostic disable: missing-fields
--return {
--  enabled = true,
--
--  "obsidian-nvim/obsidian.nvim",
--  version = "*",
--
--  --"mdavis36/obsidian.nvim",
--  --branch = "md/link-preview",
--
--  lazy = true,
--  ft = "markdown",
--  dependencies = {
--    -- Required.
--    "nvim-lua/plenary.nvim",
--  },
--
--  opts = {
--
--    workspaces = {
--      {
--        name = "PARA",
--        path = "~/PARA",
--      },
--      {
--        name = "test",
--        path = "~/MD-TEST",
--      },
--    },
--
--    -- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
--    -- 'workspaces'. For example:
--    -- dir = "~/vaults/work",
--
--    -- Optional, if you keep notes in a specific subdirectory of your vault.
--    notes_subdir = "notes",
--
--    -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
--    -- levels defined by "vim.log.levels.\*".
--    log_level = vim.log.levels.INFO,
--
--    daily_notes = {
--      enabled = true,
--      folder = "notes/dailies",
--      date_format = "%Y-%m-%d",
--      alias_format = "%B %-d, %Y",
--      default_tags = { "daily-notes" },
--      template = "calendar/daily.md",
--      workdays_only = false,
--    },
--
--    weekly_notes = {
--      enabled = true,
--      folder = "notes/dailies",
--      template = "calendar/weekly.md",
--    },
--
--    monthly_notes = {
--      enabled = true,
--      folder = "notes/dailies",
--      template = "calendar/monthly.md",
--    },
--
--    quarterly_notes = {
--      enabled = true,
--      folder = "notes/dailies",
--      template = "calendar/quarterly.md",
--    },
--
--    yearly_notes = {
--      enabled = true,
--      folder = "notes/dailies",
--      template = "calendar/yearly.md",
--    },
--
--    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
--    completion = {
--      -- Enables completion using nvim_cmp
--      nvim_cmp = false,
--      -- Enables completion using blink.cmp
--      blink = true,
--      -- Trigger completion at 2 chars.
--      min_chars = 2,
--    },
--
--    ------ Optional, customize how note IDs are generated given an optional title.
--    -------@param title string|?
--    -------@return string
--    --note_id_func = function(title)
--    --  local suffix = ""
--    --  if title ~= nil then
--    --    -- If title is given, transform it into valid file name.
--    --    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
--    --  else
--    --    -- If title is nil, just add 4 random uppercase letters to the suffix.
--    --    for _ = 1, 4 do
--    --      suffix = suffix .. string.char(math.random(65, 90))
--    --    end
--    --  end
--    --  return suffix
--    --end,
--
--    ---- Optional, customize how note file names are generated given the ID, target directory, and title.
--    -----@param spec { id: string, dir: obsidian.Path, title: string|? }
--    -----@return string|obsidian.Path The full path to the new note.
--    --note_path_func = function(spec)
--    --  -- This is equivalent to the default behavior.
--    --  local path = spec.dir / tostring(spec.id)
--    --  return path:with_suffix(".md")
--    --end,
--
--    -- Optional, customize how wiki links are formatted. You can set this to one of:
--    -- _ "use_alias_only", e.g. '[[Foo Bar]]'
--    -- _ "prepend*note_id", e.g. '[[foo-bar|Foo Bar]]'
--    -- * "prepend*note_path", e.g. '[[foo-bar.md|Foo Bar]]'
--    -- * "use_path_only", e.g. '[[foo-bar.md]]'
--    -- Or you can set it to a function that takes a table of options and returns a string, like this:
--    -- wiki_link_func = function(opts)
--    --   ---@diagnostic disable-next-line: param-type-mismatch
--    --   return require("obsidian.util").wiki_link_id_prefix(opts)
--    -- end,
--
--    ---- Optional, customize how markdown links are formatted.
--    --markdown_link_func = function(opts)
--    --  ---@diagnostic disable-next-line: param-type-mismatch
--    --  return require("obsidian.util").markdown_link(opts)
--    --end,
--
--    -- Either 'wiki' or 'markdown'.
--    -- wiki_link_func = "use_alias_only",
--    preferred_link_style = "wiki",
--
--    -- Optional, boolean or a function that takes a filename and returns a boolean.
--    -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
--    disable_frontmatter = false,
--
--    -- Optional, alternatively you can customize the frontmatter data.
--    ---@return table
--    note_frontmatter_func = function(note)
--      -- Add the title of the note as an alias.
--      if note.title then
--        note:add_alias(note.title)
--      end
--
--      local out = {
--        id = note.id,
--        aliases = note.aliases,
--      }
--
--      -- `note.metadata` contains any manually added fields in the frontmatter.
--      -- So here we just make sure those fields are kept in the frontmatter.
--      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
--        for k, v in pairs(note.metadata) do
--          out[k] = v
--        end
--      end
--
--      return out
--    end,
--
--    -- Optional, for templates (see https://github.com/obsidian-nvim/obsidian.nvim/wiki/Using-templates)
--    templates = {
--      folder = "templates",
--      date_format = "%Y-%m-%d",
--      time_format = "%H:%M",
--      -- A map for custom variables, the key should be the variable and the value a function
--      substitutions = {
--        pretty_date = function()
--            return os.date("%B %-d, %Y", os.time())
--        end,
--        daily_date = function(ctx)
--            local date_string_yyyymmdd = ctx.partial_note.id
--
--            -- Parse the YYYY-MM-DD string into a table suitable for os.time
--            local year, month, day = date_string_yyyymmdd:match("(%d%d%d%d)-(%d%d)-(%d%d)")
--            local date_table = {
--                year = tonumber(year),
--                month = tonumber(month),
--                day = tonumber(day)
--            }
--
--            -- Convert the date table to a Unix timestamp
--            local timestamp = os.time(date_table)
--
--            -- Format the timestamp into the desired %B %d, %Y format
--            local formatted_date = os.date("%B %d, %Y", timestamp)
--
--            return formatted_date
--            --print(formatted_date)
--            --return os.date("%B %-d, %Y", os.date)
--        end,
--      },
--    },
--
--    ---- Sets how you follow URLs
--    -----@param url string
--    --follow_url_func = function(url)
--    --  vim.ui.open(url)
--    --  -- vim.ui.open(url, { cmd = { "firefox" } })
--    --end,
--
--    ---- Sets how you follow images
--    -----@param img string
--    --follow_img_func = function(img)
--    --  vim.ui.open(img)
--    --  -- vim.ui.open(img, { cmd = { "loupe" } })
--    --end,
--
--    open = {
--      -- Optional, set to true if you use the Obsidian Advanced URI plugin.
--      -- https://github.com/Vinzent03/obsidian-advanced-uri
--      use_advanced_uri = false,
--      -- Optional, set to true to force ':Obsidian open' to bring the app to the foreground.
--      open_app_foreground = false,
--    },
--
--    picker = {
--      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
--      name = "telescope.nvim",
--      -- name = "snacks.pick",
--      -- Optional, configure key mappings for the picker. These are the defaults.
--      -- Not all pickers support all mappings.
--      note_mappings = {
--        -- Create a new note from your query.
--        new = "<C-x>",
--        -- Insert a link to the selected note.
--        insert_link = "<C-l>",
--      },
--      tag_mappings = {
--        -- Add tag(s) to current note.
--        tag_note = "<C-x>",
--        -- Insert a tag at the current location.
--        insert_tag = "<C-l>",
--      },
--    },
--
--    -- Optional, sort search results by "path", "modified", "accessed", or "created".
--    -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
--    -- that `:Obsidian quick_switch` will show the notes sorted by latest modified time
--    sort_by = "modified",
--    sort_reversed = true,
--
--    -- Set the maximum number of lines to read from notes on disk when performing certain searches.
--    search_max_lines = 1000,
--
--    -- Optional, determines how certain commands open notes. The valid options are:
--    -- 1. "current" (the default) - to always open in the current window
--    -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
--    -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
--    open_notes_in = "current",
--
--    -- Optional, define your own callbacks to further customize behavior.
--    callbacks = {
--      -- Runs at the end of `require("obsidian").setup()`.
--      ---@param client obsidian.Client
--      post_setup = function(client) end,
--
--      -- Runs anytime you enter the buffer for a note.
--      ---@param client obsidian.Client
--      ---@param note obsidian.Note
--      enter_note = function(client, note) end,
--
--      -- Runs anytime you leave the buffer for a note.
--      ---@param client obsidian.Client
--      ---@param note obsidian.Note
--      leave_note = function(client, note) end,
--
--      -- Runs right before writing the buffer for a note.
--      ---@param client obsidian.Client
--      ---@param note obsidian.Note
--      pre_write_note = function(client, note) end,
--
--      -- Runs anytime the workspace is set/changed.
--      ---@param client obsidian.Client
--      ---@param workspace obsidian.Workspace
--      post_set_workspace = function(client, workspace) end,
--    },
--
--    checkbox = {
--      order = {" ", "x", ">", "~", "!"},
--    },
--
--    -- Optional, configure additional syntax highlighting / extmarks.
--    -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
--    ui = {
--      enable = false,         -- set to false to disable all additional syntax features
--    },
--
--    -- Specify how to handle attachments.
--    attachments = {
--      -- The default folder to place images in via `:Obsidian paste_img`.
--      -- If this is a relative path it will be interpreted as relative to the vault root.
--      -- You can always override this per image by passing a full path to the command instead of just a filename.
--      img_folder = "assets/imgs", -- This is the default
--
--      ---- A function that determines default name or prefix when pasting images via `:Obsidian paste_img`.
--      -----@return string
--      --img_name_func = function()
--      --  -- Prefix image names with timestamp.
--      --  return string.format("Pasted-image-%s", os.date("%Y%m%d%H%M%S"))
--      --end,
--    },
--
--    -- See https://github.com/obsidian-nvim/obsidian.nvim/wiki/Notes-on-configuration#statusline-component
--    statusline = {
--      enabled = true,
--      format = "{{properties}} properties {{backlinks}} backlinks {{words}} words {{chars}} chars",
--    },
--  },
--}
