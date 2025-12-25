require "nvchad.autocmds"

-- Auto-refresh base46 cache when theme changes
do
  local ok, chadrc = pcall(require, "chadrc")
  if not ok then
    return
  end

  local theme = chadrc.base46 and chadrc.base46.theme or nil
  if not theme then
    return
  end

  local marker = vim.fn.stdpath("data") .. "/base46/.last_theme"
  local last = ""

  if vim.fn.filereadable(marker) == 1 then
    last = table.concat(vim.fn.readfile(marker), "")
  end

  if last ~= theme then
    pcall(function()
      require("base46").load_all_highlights()
    end)
    pcall(vim.fn.writefile, { theme }, marker)
  end
end
