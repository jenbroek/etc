vim.pack.add({
	{ src = "https://github.com/tpope/vim-vinegar" },
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/tpope/vim-repeat" },
	{ src = "https://github.com/andymass/vim-matchup" },
	{ src = "https://github.com/tiagovla/scope.nvim" },
	{ src = "https://github.com/chaoren/vim-wordmotion" },
	{ src = "https://github.com/godlygeek/tabular" },

	{
		src = "https://github.com/iamcco/markdown-preview.nvim",
		build = function() vim.fn["mkdp#util#install"]() end,
	},

	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/stevearc/aerial.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

vim.cmd.colorscheme("plain")

local o = vim.opt
o.termguicolors = false
o.modeline = false
o.lazyredraw = true
o.updatetime = 100
o.breakindent = true
o.linebreak = true
o.scrolloff = 5
o.sidescroll = 5
o.list = true
o.listchars = {
	tab = "│ ",
	trail = "·",
	lead = "·",
	nbsp = "␣",
	extends = "…",
	precedes = "…",
}
o.fillchars = {
	fold = " ",
	eob = " ",
}
o.shortmess:append("mrcA")
o.foldlevelstart = 99
o.undofile = true
o.conceallevel = 2
o.tabstop = 4
o.shiftwidth = 0
o.ignorecase = true
o.smartcase = true
o.mouse = ""
o.grepprg = "rg --vimgrep -. -g!.git"
o.splitright = true
o.splitbelow = true

vim.g.mapleader = " "
vim.g.c_syntax_for_h = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.matchup_matchparen_offscreen = { method = "popup" }
vim.g.mkdp_auto_close = 0
vim.g.mkdp_theme = "light"
vim.g.mkdp_preview_options = {
	uml = { server = "http://localhost:8888" },
}


vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if vim.treesitter.language.add(lang) then
			vim.treesitter.start()

			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end
	end,
})

require("aerial").setup({
	keymaps = {
		["<CR>"] = "actions.scroll",
	},
})
require("scope").setup()
require("gitsigns").setup()

vim.filetype.add({
	pattern = {
		[".*%.gotmpl%..*"] = "gotmpl",
		["layouts/.*%.html"] = "gotmpl",
	},
})

vim.api.nvim_create_user_command(
	"StripWhitespace",
	[[%s/\s\+$//e | nohlsearch]],
	{}
)

local map = vim.keymap.set
map("n", "<Tab>",   "<Cmd>bnext<CR>")
map("n", "<S-Tab>", "<Cmd>bprevious<CR>")

map("n", "]q", "<Cmd>cnext<CR>")
map("n", "[q", "<Cmd>cprev<CR>")

map("n", "]h", "<Cmd>Gitsigns next_hunk<CR>")
map("n", "[h", "<Cmd>Gitsigns prev_hunk<CR>")

map({"n", "x"}, "<S-Left>",  "g^")
map({"n", "x"}, "<S-Right>", "g$")
map({"n", "x"}, "<Up>",      "gk")
map({"n", "x"}, "<Down>",    "gj")
map({"n", "x"}, "<S-Up>",    "k")
map({"n", "x"}, "<S-Down>",  "j")

map("v", "p", "pgvy")
map("v", "<", "<gv")
map("v", ">", ">gv")

map("t", "<ESC>", [[<C-\><C-n>]])

map("n", "U", "<Cmd>UndotreeToggle<CR>")
map("n", "T", "<Cmd>AerialToggle<CR>")
map("n", "L", "<Cmd>Gitsigns blame_line<CR>")
