colorscheme plain

set nomodeline
set breakindent
set fileencoding=utf-8

set nosmarttab
set expandtab
set softtabstop=-1
set shiftwidth=4

set list
set listchars=tab:│\ ,trail:·
set matchpairs=

set statusline=%f%(\ %m%)%(\ %r%)%=%l:%v\ -\ %p%%

let g:c_syntax_for_h=1
let s:use_tabs=0

function! s:UseTabs()
    if s:use_tabs
        set expandtab shiftwidth=4
        let s:use_tabs=0
    else
        set noexpandtab shiftwidth=8
        let s:use_tabs=1
    endif
endfunction

command! Strip   %s/\s\+$//e | noh
command! UseTabs call s:UseTabs()

autocmd! Filetype c UseTabs

xnoremap p pgvy

nnoremap H g0
nnoremap j gj
nnoremap k gk
nnoremap L g$

vnoremap H g0
vnoremap j gj
vnoremap k gk
vnoremap L g$
