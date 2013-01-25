"
" Tango Vim Color Scheme
" =======================
"
" Colours
" Light Yellow: 228
" Pink: 168
"
"
"
set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "tango"

hi LineNr        ctermfg=236  ctermbg=233 cterm=none

" Default Colors
hi Normal       ctermfg=250 ctermbg=black cterm=none
hi NonText      ctermfg=darkgray
hi Cursor       ctermfg=11 
hi lCursor      ctermbg=228

" Search
hi Search       cterm=none ctermfg=grey ctermbg=blue
hi IncSearch    cterm=none ctermfg=black ctermbg=228

" Window Elements
hi StatusLine   ctermfg=black ctermbg=green cterm=bold
hi StatusLineNC ctermfg=lightgray ctermbg=22
hi VertSplit    ctermfg=red ctermbg=yellow
hi Folded       ctermfg=black ctermbg=darkgray
hi Visual       ctermbg=black ctermfg=228 cterm=reverse

" Syntax
hi Boolean      ctermfg=red cterm = none
hi Character    ctermfg=yellow  cterm=none
hi Comment      ctermfg=238 cterm=none
hi Constant     ctermfg=darkYellow
hi Define       ctermfg=blue cterm=none
hi Float        ctermfg=208 cterm=none
hi Function     ctermfg=darkblue  cterm=none
hi Error        ctermfg=white ctermbg=darkred
"hi Identifier   ctermfg=208
hi Identifier   ctermfg=blue
hi Include      ctermfg=darkblue cterm=none
hi Macro        ctermfg=red cterm=none
hi Number       ctermfg=magenta
hi PreProc      ctermfg=blue
hi Special      ctermfg=gray cterm=none
"hi Special      ctermfg=168 cterm=none
hi Statement    ctermfg=gray
hi String       ctermfg=yellow
hi Structure    ctermfg=red
hi Title        ctermfg=white cterm=bold
hi Todo         ctermfg=darkred ctermbg=228
hi Type         ctermfg=gray cterm=bold

" Diff
hi DiffAdd      ctermfg=gray ctermbg=blue cterm=none
hi DiffChange   ctermfg=gray ctermbg=darkgray cterm=none
hi DiffDelete   ctermfg=gray ctermbg=none cterm=none
hi DiffText     ctermfg=gray ctermbg=yellow cterm=none
