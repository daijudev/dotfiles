-- Editing
vim.opt.clipboard:append("unnamedplus,unnamed")
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.undofile = true

-- Interface
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.scrolloff = 3
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"

-- Search and external file changes
vim.opt.autoread = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250

-- Cursor appearance
vim.opt.guicursor = "a:blinkwait700-blinkoff400-blinkon250,n-v-c:block-nCursor,i-ci-ve:ver75-iCursor,r-cr:hor20"
