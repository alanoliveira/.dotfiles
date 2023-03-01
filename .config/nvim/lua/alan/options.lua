vim.language = "en_US.UTF-8"
vim.opt.cmdheight = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.updatetime = 300
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.wrap = false
vim.opt.list = true
vim.opt.laststatus = 3
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spelloptions:append({ "camel" })
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.listchars = { tab = "»-", trail = "-", eol = "↴", extends = "»", precedes = "«", nbsp = "%", lead = "⋅" }
vim.opt.colorcolumn = "100"
vim.opt.mouse = ""
vim.opt.wildmode = "longest:full"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
