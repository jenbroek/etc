function! FoldText()
	let l:s = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
	let l:e = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s\+', '', '')
	return l:s . ' [...] ' . l:e
endfunction

set foldtext=FoldText()
