function! s:fname(name, bufnr, changed)
	if a:name == ''
		return '[No Name]'
	else
		if getbufvar(a:bufnr, '&buftype') =~? 'help\|terminal'
			return '#' .. fnamemodify(a:name, ':t:r')
		else
			return
			    \ simplify(a:name)
			    \->fnamemodify(':~:.')
			    \->pathshorten() .. (a:changed ? ' [+]' : '')
		endif
	endif
endfunction

function! s:page(vals, page_width)
	return strdisplaywidth(join(a:vals)) / a:page_width
endfunction

function! s:find_idx(vals, cur_idx, cur_page, page_width, stop_at_idx, direction)
	let idx = a:cur_idx
	while idx != a:stop_at_idx
	    \&& s:page(a:vals[:idx+a:direction], a:page_width) == a:cur_page
		let idx += a:direction
	endwhile

	return idx
endfunction

function! statusline#render() abort
	let info = $'Ln {line(".")}, Col {virtcol(".")}'
	let tc = tabpagenr('$')
	if tc > 1 | let info = $'Tb {tabpagenr()}|{tc}, {info}' | endif

	let binfo = getbufinfo(#{buflisted:1})
	let bnum = bufnr()
	if !buflisted(bnum) | let binfo += getbufinfo(bnum) | endif

	let [bnums, bnames]
	    \= binfo
	    \->map('[[v:val.bufnr], [s:fname(v:val.name, v:val.bufnr, v:val.changed)]]')
	    \->reduce({a, v -> [a[0]+v[0], a[1]+v[1]]})

	let idx = index(bnums, bnum)
	let page_width = &columns - strdisplaywidth(info)

	let page = s:page(bnames[:idx], page_width)
	let p = s:find_idx(bnames, idx, page, page_width, 0, -1)
	let n = s:find_idx(bnames, idx, page, page_width, len(bnames)-1, 1)
	let bnames = bnames[p:n]
	let idx = idx - p

	call map(bnames, 'substitute(v:val, "%", "%%", "g")')
	let bnames[idx] = $'%#TabLineSel#{bnames[idx]}%#Tabline#'
	let info = substitute(info, '\a\+', '%#TabLineSel#\0%#TabLine#', 'g')

	return $'{join(bnames)}%= {info}'
endfunction
