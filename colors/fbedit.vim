" Vim color file: fbedit
" Maintainer: Fergus Bremner
" Last Change: 2012-01-04
" Email: <fergus.bremner@gmail.com>

" A clean, light color scheme based on BBEdit defaults
" Colors are as follows:
" Black   #202020 
" Blue    #000099
" Grey    #555555
" Green   #007777
" Purple  #990066 
" Maroon  #AA0000
" Rust    #993300
" Pink    #FF3399
" Yellow  #FFFFCC
" White   #FFFFFF

" Colorscheme initialization "{{{
" ---------------------------------------------------------------------
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name="fbedit"

"}}}

if (has("gui_running"))
    let s:vmode       = "gui"
    let s:black       = "#202020"
    let s:yellow      = "#ffffcc"
    let s:grey      = "#cb4b16"
    let s:red         = "#dc322f"
    let s:maroon     = "#d33682"
    let s:pink      = "#6c71c4"
    let s:blue        = "#268bd2"
    let s:rust        = "#2aa198"
    let s:green       = "#007777"
    let s:white       = "#FFFFFF"
endif
" Terminal colours (dark)

" Gvim colours (light)
hi Cursor 		      gui=none       guifg=white       guibg=#555555

hi Normal 		      gui=none       guifg=black       guibg=white
hi NonText		      gui=none       guifg=#555555     guibg=white

hi Boolean          gui=none       guifg=#990066
hi Character        gui=bold       guifg=red
hi Comment          gui=none       guifg=#555555
hi Constant         gui=none       guifg=black
hi Define           gui=none       guifg=#990066     guibg=bg
hi Float            gui=none       guifg=red
hi Function         gui=none       guifg=#000099
hi Identifier       gui=none       guifg=black
hi Include          gui=none       guifg=#000099     guibg=bg
hi Macro            gui=none       guifg=#FF3399     guibg=bg
hi Number           gui=none       guifg=black
hi PreProc          gui=none       guifg=#990066
hi Special          gui=none       guifg=black
hi Statement        gui=none       guifg=#000099
hi StorageClass     gui=none       guifg=#000099     guibg=bg
hi String           gui=none       guifg=#FF3399
hi Structure        gui=none       guifg=#990066     guibg=bg
hi Title            gui=none       guifg=Maroon
hi Todo             gui=none       guifg=black       guibg=yellow
hi Type             gui=none       guifg=#990066

hi LineNr           gui=none       guifg=#999999     guibg=#E8E8E8
hi StatusLine       gui=none       guifg=white       guibg=#555555
hi StatusLineNC     gui=none       guifg=white       guibg=#555555
hi VertSplit        gui=none       guifg=white       guibg=#333333

hi Directory        gui=none       guifg=darkblue
hi Error            gui=none       guifg=white       guibg=red
hi Folded           gui=none       guifg=#202020     guibg=#B2B2B2
hi Search           gui=none       guibg=yellow
hi Visual           gui=none       guibg=#b8d5ff     guifg=black

hi WildMenu         gui=none       guibg=gray        guifg=black
hi MatchParen       gui=none       guibg=gray

hi ModeMsg          gui=none
hi MoreMsg          gui=reverse
hi Question         gui=none       guifg=Red         guibg=NONE
hi WarningMsg       gui=none       guifg=Red

hi DiffDelete       gui=none
hi DiffText         gui=none

" current line
hi CurrentLine      gui=none       guibg=#FFFFBB
hi CursorLine       gui=none       guibg=#FFFFBB
hi CursorColumn     gui=none       guibg=#FFEEDD

" spell check
hi BadWord          gui=bold       guifg=#000099     guibg=#FFDDDD
hi DoubleWord       gui=bold       guifg=#000099     guibg=#FFEECC

if v:version >= 700
	hi Pmenu          gui=none       guifg=#4d4d4d     guibg=#dbdbdb     cterm=bold     ctermbg=DarkGreen ctermfg=Gray
	hi PMenuSel       gui=none       guifg=#FFFFFF     guibg=#7499bf     cterm=bold     ctermbg=Yellow    ctermfg=Gray
	hi PmenuSbar      gui=none       guifg=fg          guibg=#41609e     cterm=bold     ctermbg=DarkGreen 	
	hi PmenuThumb     gui=none       guifg=bg          guibg=#bdcae3     cterm=bold     ctermbg=Yellow
	hi SpellBad       gui=undercurl  guisp=Red                           ctermbg=Red
  hi SpellRare      gui=undercurl  guisp=Orange                        ctermbg=Red
  hi SpellLocal     gui=undercurl  guisp=Orange                        ctermbg=Red
  hi SpellCap       gui=undercurl  guisp=Yellow                        ctermbg=Yellow
endif

" css
hi cssTagName       gui=none       guifg=black
hi cssBraces        gui=none       guifg=black
hi cssImportant     gui=none       guifg=#000099
hi cssMedia         gui=none       guifg=#000099
hi cssClassName     gui=none       guifg=#000099

" html
hi htmlBoldUnderline  gui=underline
hi htmlBold           gui=none
hi htmlBoldItalic     gui=none
hi htmlBoldUnderlineItalic gui=underline

hi htmlH1            gui=none       guifg=#336699     guibg=bg
hi htmlH2            gui=none       guifg=#336699     guibg=bg
hi htmlH3            gui=none       guifg=#336699     guibg=bg
hi htmlH4            gui=none       guifg=#336699     guibg=bg
hi htmlH5            gui=none       guifg=#336699     guibg=bg
hi htmlH6            gui=none       guifg=#336699     guibg=bg
