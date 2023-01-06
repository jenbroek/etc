let g:help_in_tabs = 1

function! s:HelpInNewTab()
	if &buftype == 'help' && g:help_in_tabs
		execute "normal \<C-W>T"
	endif
endfunction

augroup HelpInTabs
	autocmd!
	autocmd! BufEnter *.txt call s:HelpInNewTab()
augroup END
