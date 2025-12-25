require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

local function gs(fn)
  return function()
    local ok, gitsigns = pcall(require, "gitsigns")
    if ok then
      fn(gitsigns)
    end
  end
end

map("n", "]h", gs(function(g)
  g.next_hunk()
end), { desc = "Next hunk" })

map("n", "[h", gs(function(g)
  g.prev_hunk()
end), { desc = "Prev hunk" })

map("n", "<leader>hs", gs(function(g)
  g.stage_hunk()
end), { desc = "Stage hunk" })

map("n", "<leader>hr", gs(function(g)
  g.reset_hunk()
end), { desc = "Reset hunk" })

map("n", "<leader>hp", gs(function(g)
  g.preview_hunk()
end), { desc = "Preview hunk" })

map("n", "<leader>hb", gs(function(g)
  g.blame_line()
end), { desc = "Blame line" })

map("n", "<leader>hd", gs(function(g)
  g.diffthis()
end), { desc = "Diff this" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
