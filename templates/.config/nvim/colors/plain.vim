if exists('syntax_on')
	syntax reset
endif

let g:colors_name = 'plain'

hi SpecialKey ctermfg=0
hi! link NonText SpecialKey
hi! link EndOfBuffer SpecialKey

hi ErrorMsg ctermbg=none ctermfg=1 cterm=bold
hi WarningMsg ctermfg=3

hi clear MoreMsg
hi clear ModeMsg
hi clear Question
hi clear Directory

hi Search ctermbg=0 ctermfg=7 cterm=bold,reverse
hi IncSearch ctermbg=3 ctermfg=0 cterm=none

hi LineNr ctermfg=0
hi CursorLineNr ctermfg=7 ctermbg=0 cterm=bold

hi ColorColumn ctermbg=0
hi! link CursorColumn ColorColumn
hi! link CursorLine ColorColumn

hi Visual ctermbg=0 ctermfg=7 cterm=bold,reverse

hi VertSplit cterm=none

" Different guibgs are needed to trick vim into hiding fillchars.
" See: https://vi.stackexchange.com/a/15894
hi StatusLine cterm=underline guibg=red
hi StatusLineNC cterm=underline guibg=green

hi clear Title
hi TabLine ctermbg=none ctermfg=0 cterm=underline
hi TabLineSel cterm=underline
hi! link TabLineFill TabLine

hi MatchParen ctermbg=0

hi clear Folded
hi clear FoldColumn

hi Pmenu ctermbg=0 ctermfg=7
hi PmenuSel ctermbg=7 ctermfg=0
hi PmenuSBar ctermfg=0 cterm=bold,reverse
hi PmenuThumb ctermfg=7 cterm=reverse

hi! link WildMenu PmenuSel

hi DiffAdd ctermbg=2 ctermfg=0
hi DiffChange ctermbg=3 ctermfg=0
hi DiffDelete ctermbg=1 ctermfg=1 cterm=none
hi DiffText ctermfg=3 ctermbg=0 cterm=bold,reverse

hi clear SignColumn
hi clear Conceal

hi Comment ctermfg=0 cterm=bold
hi Constant ctermfg=2 cterm=bold
hi Identifier ctermfg=5 cterm=bold
hi clear Statement
hi PreProc ctermfg=5 cterm=bold
hi Type ctermfg=3 cterm=bold
hi clear Special
hi Underlined ctermfg=none
hi! link Ignore NonText
hi Error ctermbg=1 ctermfg=none
hi Todo ctermbg=4 ctermfg=7
