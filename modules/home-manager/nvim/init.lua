-- options that plugins need
vim.g.mapleader = " "
vim.o.winborder = "single"

-- configure plugins
require("lze").load("plugins")

-- configure everything else
require("options")
require("keymaps")
require("lsp")
