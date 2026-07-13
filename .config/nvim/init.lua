------------------------------------------------------------
-- Basic settings
------------------------------------------------------------
local opt = vim.opt
local g   = vim.g
local cmd = vim.cmd
local fn  = vim.fn
local api = vim.api

opt.compatible = false
opt.showmatch = true
opt.ignorecase = true
opt.mouse = "a"
opt.hlsearch = true
opt.incsearch = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.number = true
opt.wildmode = { "longest", "list" }
opt.syntax = "on"
opt.ttyfast = true
opt.swapfile = false
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = "| " }
opt.autochdir = true
opt.sessionoptions:remove("options")
opt.sessionoptions:remove("folds")
opt.spelllang = { "en", "de" }
opt.clipboard = "unnamedplus"
opt.background = "dark"

------------------------------------------------------------
-- Key mappings
------------------------------------------------------------
local map = vim.keymap.set
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<F3>", ":NERDTreeToggle<CR>", { silent = true })
map("n", "\\lc", ":VimtexStop<CR>:VimtexClean<CR>", { silent = true })
map("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

cmd("command! Reloadconfig source $MYVIMRC")

------------------------------------------------------------
-- Filetype / Autocommands
------------------------------------------------------------

cmd([[
  autocmd FileType python setlocal sw=4 ts=4 noexpandtab
]])

-- Markdown highlighting
cmd([[
function! MathAndLiquid()
  syn region math start=/\$\$/ end=/\$\$/
  syn match math_block '\$[^$].\{-}\$'
  syn match liquid '{%.*%}'
  syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
  syn region highlight_block start='```' end='```'
  hi link math Statement
  hi link liquid Statement
  hi link highlight_block Function
  hi link math_block Function
endfunction
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
]])

------------------------------------------------------------
-- vim-plug in Lua style
------------------------------------------------------------
local Plug = fn["plug#"]

vim.call("plug#begin", "~/.vim/plugged")

Plug("tpope/vim-fugitive")
Plug("scrooloose/nerdtree")
Plug("joshdick/onedark.vim")
Plug("tomasr/molokai")
Plug("lervag/vimtex")
Plug("ervandew/supertab")
Plug("tpope/vim-surround")
Plug("brennier/quicktex")
Plug("mbbill/undotree")
Plug("scrooloose/nerdcommenter")
Plug("junegunn/fzf", { ["do"] = function() fn["fzf#install"]() end })
Plug("junegunn/fzf.vim")
Plug("jasonccox/vim-wayland-clipboard")
Plug("NLKNguyen/papercolor-theme")
Plug("peterhoeg/vim-qml")
Plug("neovim/nvim-lspconfig")
Plug("karb94/neoscroll.nvim")

vim.call("plug#end")

------------------------------------------------------------
-- Plugin configuration
------------------------------------------------------------

-- Neoscroll
require("neoscroll").setup()

-- Nerdtree
g.NERDTreeMapOpenInTab = "<ENTER>"

-- Vimtex
g.vimtex_view_general_viewer = "okular"
g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
g.vimtex_syntax_conceal_disable = 1
g.vimtex_syntax_conceal = {
  accents = 1, cites = 1, fancy = 1, greek = 1,
  math_bounds = 1, math_delimiters = 1,
  math_fracs = 1, math_super_sub = 1,
  math_symbols = 1, sections = 0, styles = 1,
}
g.vimtex_quickfix_ignore_filters = {
  "Underfull", "Overfull", "Undefined control sequence",
  "Missing number, treated as zero", "Float(s) lost",
  "Not in outer par mode", 'Missing "publisher"',
}
g.Tex_IgnoreLevel = 8

------------------------------------------------------------
-- Colorscheme
------------------------------------------------------------

g.onedark_termcolors = 256

if tonumber(fn.system("tput colors")) >= 8 then
  opt.termguicolors = true
  cmd("colorscheme molokai")
else
  opt.termguicolors = false
end

------------------------------------------------------------
-- Optional: Auto darkmode
------------------------------------------------------------
local function AutoDarkmode()
  local colors = vim.fn.trim(vim.fn.system("tput colors"))
  local mode = vim.fn.trim(vim.fn.system("detect-darkmode"))
  if colors == "256" or vim.env.TERM == nil then
    if mode == "light" then
      opt.background = "light"
      cmd("colorscheme PaperColor")
    else
      opt.background = "dark"
      cmd("colorscheme molokai")
    end
  end
end

api.nvim_create_user_command("AutoDarkmode", AutoDarkmode, {})
-- Uncomment next line if you want to run automatically:
-- AutoDarkmode()
