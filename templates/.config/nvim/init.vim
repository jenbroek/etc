let s:p = stdpath('data') . '/site/autoload/plug.vim'
if empty(glob(s:p))
	call system(['curl', '-fLo', s:p, '--create-dirs',
	            \'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'])
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\| PlugInstall --sync | source $MYVIMRC | endif

call plug#begin()

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'echasnovski/mini.comment'
Plug 'andymass/vim-matchup'

Plug 'mbbill/undotree'
Plug 'stevearc/aerial.nvim'

Plug 'iamcco/markdown-preview.nvim', {'do': {-> mkdp#util#install()}}
Plug 'godlygeek/tabular'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

colorscheme plain

set nomodeline
set lazyredraw
set updatetime=100
set breakindent
set linebreak
set scrolloff=5
set sidescroll=5
set list
set listchars=tab:│\ ,trail:·,nbsp:␣,extends:…,precedes:…
set fillchars=fold:\ ,eob:\ 
set shortmess+=mrcA
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

let g:mapleader = ' '
let g:c_syntax_for_h = 1
let g:undotree_SetFocusWhenToggle = 1
let g:matchup_matchparen_offscreen = {'method': 'popup'}
let g:mkdp_auto_close = 0

lua << EOF
require('nvim-treesitter.configs').setup({
	highlight = { enable = true },
	indent    = { enable = true },
	matchup   = { enable = true }
})
require('aerial').setup({
	keymaps = { ['<CR>'] = 'actions.scroll' }
})
require('mini.comment').setup()
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
nnoremap T <Cmd>AerialToggle<CR>
