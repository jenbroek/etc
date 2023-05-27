let s:plug_path = stdpath('data') . '/site/autoload/plug.vim'
if empty(glob(s:plug_path))
	silent execute '!curl -fLo ' . s:plug_path .
		\ ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\ | PlugInstall --sync | source $MYVIMRC | endif

let g:mapleader = ' '
let g:is_posix = 1
let g:c_syntax_for_h = 1

let g:undotree_SetFocusWhenToggle = 1
let g:matchup_matchparen_offscreen = { 'method': 'popup' }

call plug#begin()

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'
Plug 'andymass/vim-matchup'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'godlygeek/tabular'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

call plug#end()

colorscheme plain

set nomodeline
set lazyredraw
set updatetime=100
set breakindent
set linebreak
set scrolloff=5
set sidescroll=5
set smartindent
set list
set listchars=tab:│\ ,trail:·,nbsp:␣,extends:…,precedes:…
set fillchars=fold:\ ,eob:\ 
set shortmess+=mrcSA
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99
set undofile
set conceallevel=2
set tabstop=4
set shiftwidth=0
set ignorecase
set smartcase
set mouse=

lua << EOF
require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"bash",
		"dockerfile",
		"markdown",
		"markdown_inline"
	},
	highlight = {
		enable = true,
		disable = { "latex", "markdown" }
	},
	indent = {
		enable = true
	},
	context_commentstring = {
		enable = true
	},
}
EOF

command! StripWhitespace %s/\s\+$//e | nohlsearch

nnoremap <Tab>   <Cmd>bnext<CR>
nnoremap <S-Tab> <Cmd>bprevious<CR>

nnoremap <S-Left>  g^
nnoremap <S-Right> g$
nnoremap <Up>      gk
nnoremap <Down>    gj
nnoremap <S-Up>    k
nnoremap <S-Down>  j

xnoremap <S-Left>  g^
xnoremap <S-Right> g$
xnoremap <Up>      gk
xnoremap <Down>    gj
xnoremap <S-Up>    k
xnoremap <S-Down>  j

vnoremap p pgvy
vnoremap < <gv
vnoremap > >gv

nnoremap U <Cmd>UndotreeToggle<CR>
