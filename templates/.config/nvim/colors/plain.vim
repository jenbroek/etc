hi clear
if exists('syntax_on')
	syntax reset
endif

function! s:hi(grp, args)
	call map(a:args, '"cterm" .. v:key .. "=" .. v:val')
	execute 'hi clear ' .. a:grp
	execute 'hi ' .. a:grp .. ' ' .. join(values(a:args))
endfunction

let g:colors_name = 'plain'

call s:hi('Visual', #{bg:8, fg:7})
hi! link MatchParen Visual

hi! link SpecialKey Normal
call s:hi('Ignore', #{fg:0})
hi! link NonText Ignore

hi clear Conceal
hi! link SignColumn Conceal

call s:hi('Search', #{bg:15, fg:8})
call s:hi('CurSearch', #{bg:7, fg:0})

call s:hi('ColorColumn', #{bg:234})
hi! link CursorColumn ColorColumn
hi! link CursorLine ColorColumn

call s:hi('LineNr', #{fg:8})
hi! link CursorLineNr ColorColumn

hi clear StatusLine
hi clear StatusLineNC

call s:hi('TabLine', #{fg:4})
hi clear TabLineSel

call s:hi('Pmenu', #{bg:15, fg:0})
call s:hi('PmenuSel', #{bg:0, fg:15})
call s:hi('PmenuSBar', #{bg:7})
call s:hi('PmenuThumb', #{bg:8})

" Color1: Identifier
" Color2d: Constant
" Colar2l: Special, PreProc
" Color3: Function, Qualifier
" Dim (light): Type, Brackets
" Dim (dark): Delimiter, Comment
" Clear: Statement, Operator

call s:hi('Identifier', #{fg:1})
hi! link @variable Identifier

call s:hi('Constant', #{fg:10})
hi! link @string @constant

call s:hi('Special', #{fg:14})
hi! link PreProc Special
hi! link @constant.macro PreProc
hi! link @function.macro PreProc
hi! link @keyword.directive PreProc
hi! link @keyword.directive.define PreProc

call s:hi('Function', #{fg:13})
hi! link @constructor @function
hi! link @type.qualifier Function

call s:hi('Type', #{fg:15})
hi! link @punctuation.bracket Type

call s:hi('Delimiter', #{fg:8})

call s:hi('Comment', #{fg:8})
call s:hi('Todo', #{bg:8, fg:7})
call s:hi('DiagnosticWarn', #{bg:8, fg:9})
call s:hi('DiagnosticError', #{bg:8, fg:11})

hi clear Statement
hi! link Operator Statement
