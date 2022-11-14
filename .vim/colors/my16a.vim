""" Init
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "my16a"

" Other elements: (see :help highlight)
"   Directory, InsSearch, ErrorMsg, WarningMsg
"   ModeMsg, Question, VertSplit, DiffAdd
"   SpecialComment, Debug, Title, Ignore

highlight CursorLine    ctermbg=237 cterm=none
highlight LineNr        ctermfg=236
highlight MatchParen    cterm=none ctermfg=Yellow ctermbg=none

highlight Normal        ctermfg=White ctermbg=none cterm=none
highlight NonText       ctermfg=White ctermbg=none
highlight Search        ctermfg=Red ctermbg=none cterm=bold
highlight Visual        ctermfg=White ctermbg=black
highlight Cursor        ctermfg=Black ctermbg=Green cterm=bold
highlight Comment       ctermfg=Green
highlight StatusLine    ctermfg=Gray ctermbg=234 cterm=none
highlight StatusLineNC  ctermfg=238 ctermbg=234 cterm=none

highlight Operator      ctermfg=Gray
highlight Function      ctermfg=Gray
highlight Error         ctermfg=White ctermbg=Red
highlight Todo          ctermfg=Yellow ctermbg=none

highlight String        ctermfg=DarkBlue
highlight Character     ctermfg=26
highlight Number        ctermfg=Gray
highlight Boolean       ctermfg=241
highlight Float         ctermfg=Gray
highlight Constant      ctermfg=27
highlight SpecialChar   ctermfg=White
highlight SpecialKey    ctermfg=White

highlight Keyword       ctermfg=246
highlight Statement     ctermfg=241 cterm=none
highlight Conditional   ctermfg=241
highlight Repeat        ctermfg=241
highlight StorageClass  ctermfg=241
highlight Label         ctermfg=241
highlight Type          ctermfg=241 cterm=none
highlight Structure     ctermfg=251
highlight Typedef       ctermfg=95

highlight Macro         ctermfg=DarkYellow
highlight PreProc       ctermfg=DarkYellow
highlight Include       ctermfg=DarkYellow
highlight PreCondit     ctermfg=DarkYellow

highlight Tabline       ctermfg=Gray ctermbg=233 cterm=none
highlight TablineSel    ctermfg=White ctermbg=238 cterm=none
highlight TablineFill   ctermfg=233

highlight Pmenu         ctermbg=235 ctermfg=Gray
highlight PmenuSel      ctermbg=237 ctermfg=White

" XML closing tag %(
highlight Identifier    ctermfg=Gray cterm=none

highlight Special       ctermfg=White
highlight Delimiter     ctermfg=Gray
highlight Tag           ctermfg=White

highlight Linear        ctermfg=132 ctermbg=Yellow

highlight Register   ctermfg=124
highlight AssDirective ctermfg=238

highlight todo  ctermfg=yellow


