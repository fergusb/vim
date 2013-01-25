" Vim color file: fbedit
" Maintainer: Fergus Bremner
" Last Modified: 2013-01-25 08:59:27 CET
" Email: <fergus.bremner@gmail.com>
" A clean color scheme based: gui light, console dark

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
if &t_Co != 256 && ! has("gui_running")
  echomsg "Switch to a GUI-based vim or a 256-color terminal"
elseif (has("gui_running"))
	set background=light
else
	set background=dark
endif

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="fbedit"

"}}}

hi Cursor 		      gui=none   guifg=white     guibg=#555555 	ctermbg=11 

hi Normal 		      gui=none   guifg=black     guibg=white   	ctermfg=250   		ctermbg=black cterm=none
hi NonText		      gui=none   guifg=#555555   guibg=white   	ctermfg=darkgray

hi Boolean          gui=none   guifg=#990066   								ctermfg=red 			cterm=none
hi Character        gui=bold   guifg=red      							 	ctermfg=yellow    cterm=none
hi Comment          gui=none   guifg=#555555   								ctermfg=238       cterm=none
hi Constant         gui=none   guifg=black     								ctermfg=darkYellow
hi Define           gui=none   guifg=#990066   								ctermfg=blue      cterm=none
hi Float            gui=none   guifg=red       								ctermfg=208       cterm=none
hi Function         gui=none   guifg=#000099   								ctermfg=darkblue  cterm=none
hi Identifier       gui=none   guifg=black     								ctermfg=blue
hi Include          gui=none   guifg=#000099   guibg=bg   		ctermfg=darkblue  cterm=none
hi Macro            gui=none   guifg=#FF3399   guibg=bg   		ctermfg=red   		cterm=none
hi Number           gui=none   guifg=black                		ctermfg=magenta
hi PreProc          gui=none   guifg=#990066   								ctermfg=blue
hi Special          gui=none   guifg=black     								ctermfg=gray   		cterm=none
hi Statement        gui=none   guifg=#000099   								ctermfg=gray
hi StorageClass     gui=none   guifg=#000099   								ctermfg=gray
hi String           gui=none   guifg=#FF3399   								ctermfg=yellow
hi Structure        gui=none   guifg=#990066   								ctermfg=red
hi Title            gui=none   guifg=Maroon    								ctermfg=white   	cterm=bold
hi Todo             gui=none   guifg=black     guibg=yellow   ctermfg=darkred   ctermbg=228
hi Type             gui=none   guifg=#990066   								ctermfg=gray 			cterm=bold
                               
hi LineNr           gui=none   guifg=#999999   guibg=#E8E8E8 	ctermfg=236  			ctermbg=233 			cterm=none
hi StatusLine       gui=none   guifg=white     guibg=#555555 	ctermfg=black 		ctermbg=green 		cterm=bold
hi StatusLineNC     gui=none   guifg=white     guibg=#555555 	ctermfg=lightgray ctermbg=22
hi VertSplit        gui=none   guifg=white     guibg=#333333
                               
hi Directory        gui=none   guifg=darkblue
hi Error            gui=none   guifg=white      guibg=red  		ctermfg=white 		ctermbg=darkred
hi Folded           gui=none   guifg=#202020    guibg=#B2B2B2 ctermfg=black 		ctermbg=darkgray
hi Search           gui=none   guibg=yellow 								 	ctermfg=grey 			ctermbg=blue			cterm=none
hi IncSearch    		gui=none   guibg=yellow                   ctermfg=black 		ctermbg=228 			cterm=none
hi Visual           gui=none   guibg=#b8d5ff    guifg=black  	ctermbg=black 		ctermfg=228 			cterm=reverse

hi WildMenu         gui=none   guibg=gray    		guifg=black
hi MatchParen       gui=none   guibg=gray

hi ModeMsg          gui=none
hi MoreMsg          gui=reverse
hi Question         gui=none   guifg=red        guibg=none
hi WarningMsg       gui=none	 guifg=red

hi DiffAdd       		gui=none   ctermfg=gray   ctermbg=blue     cterm=none
hi DiffChange       gui=none   ctermfg=gray   ctermbg=darkgray cterm=none
hi DiffDelete       gui=none   ctermfg=gray   ctermbg=none     cterm=none
hi DiffText         gui=none   ctermfg=gray   ctermbg=yellow   cterm=none

" current line
hi CurrentLine      gui=none   guibg=#FFFFBB   ctermfg=yellow   ctermbg=red   cterm=none
hi CursorLine       gui=none   guibg=#FFFFBB   ctermfg=yellow   ctermbg=red   cterm=none
hi CursorColumn     gui=none   guibg=#FFEEDD   ctermbg=yellow   cterm=none

" spell check
hi BadWord          gui=bold   guifg=#000099   guibg=#FFDDDD
hi DoubleWord       gui=bold   guifg=#000099   guibg=#FFEECC

if v:version >= 700
	hi Pmenu          gui=none       guifg=#4d4d4d     guibg=#dbdbdb     cterm=bold    ctermbg=darkgreen ctermfg=gray
	hi PMenuSel       gui=none       guifg=#FFFFFF     guibg=#7499bf     cterm=bold    ctermbg=yellow    ctermfg=gray
	hi PmenuSbar      gui=none       guifg=fg          guibg=#41609e     cterm=bold    ctermbg=darkgreen 	
	hi PmenuThumb     gui=none       guifg=bg          guibg=#bdcae3     cterm=bold    ctermbg=yellow
	hi SpellBad       gui=undercurl  guisp=red                           ctermbg=red
  hi SpellRare      gui=undercurl  guisp=orange                        ctermbg=red
  hi SpellLocal     gui=undercurl  guisp=orange                        ctermbg=red
  hi SpellCap       gui=undercurl  guisp=yellow                        ctermbg=yellow
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
