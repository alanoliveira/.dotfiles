vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false
vim.opt.showcmdloc = "statusline"
vim.opt.laststatus = 3
vim.opt.swapfile = false
vim.opt.grepprg = "rg --vimgrep"
vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.updatetime = 300
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = "»-", trail = "-", eol = "↴", extends = "»", precedes = "«", nbsp = "%", lead = "⋅" }
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4
vim.opt.termguicolors = true
vim.opt.inccommand = "split"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spellfile = os.getenv("CLOUD_DIR") .. "/nvim_spell/en.utf-8.add"
vim.opt.spellcapcheck = ""
vim.opt.spelloptions:append({ "camel" })
vim.g.mapleader = " "
-- vim.b.did_ftplugin = "1" -- prevent load default ftplugin settings
-- vim.g.no_plugin_maps = true
-- vim.g.markdown_recommended_style = 0
-- vim.g.ruby_recommended_style = 0

vim.filetype.add({ extension = { ruby = "ruby", thor = "ruby" } })

vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "" })

vim.api.nvim_create_autocmd("InsertEnter", { command = "if (&number || &relativenumber) | set nornu | endif" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "if (&number || &relativenumber) | set rnu | endif" })
vim.api.nvim_create_autocmd("TextYankPost", { pattern = "*", command = "lua require('vim.highlight').on_yank()" })

vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local keys = { "n", "N", "*", "#", "<CR>", "/", "?" }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end)

vim.keymap.set("x", "<leader>p", [["_dp]], { desc = "p using _" })
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "P using _" })
vim.keymap.set("n", "<leader>ec", "<cmd>tabedit .nvim_conf.local<cr>", { desc = "edit local config" })
vim.keymap.set("n", "<leader>ee", "<cmd>tabedit $DIRENV_FILE<cr>", { desc = "edit .envrc" })

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    if vim.fn.glob("Gemfile") == "" or vim.fn.executable("bundle") == 0 then
      return
    end
    vim.system({ "bundle", "list", "--paths" }, { text = true }, function(obj)
      vim.schedule(function()
        for gem_path in vim.gsplit(obj.stdout, "\n") do
          vim.opt.tags:append(vim.fs.joinpath(gem_path, "tags"))
        end
      end)
    end)
  end,
})
