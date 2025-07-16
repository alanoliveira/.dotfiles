vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars:append{ tab = "»-", trail = "-", eol = "↴", extends = "»", precedes = "«", nbsp = "%", lead = "⋅" }
vim.opt.spell = true
vim.opt.spelllang = "en_us"
-- vim.opt.spellfile = os.getenv("CLOUD_DIR") .. "/nvim_spell/en.utf-8.add"
vim.opt.spelloptions:append({ "camel" })
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.laststatus = 3
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.g.mapleader = " "

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "p using _" })
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })

vim.filetype.add({ extension = { ruby = "ruby", thor = "ruby", jbuilder = "ruby" } })
