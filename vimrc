" vim config file ~/.vimrc
" Fergus Bremner <fergus.bremner@gmail.com>
" Last Modified: 2013-07-13 04:06:40 CEST
 
" Section: Settings {{{1
"---------------------------------------------------------------------------"
set nocompatible            " Use Vim settings (must be first)

set autochdir               " Auto-change cwd to current file
set autoread                " Auto read a file when it's changed from without
set autowrite               " Auto write file when switching to another file or window
set writebackup             " Atomic saves
set enc=utf-8               " Default encoding to UTF-8
set ffs=unix,mac            " Favorite filetypes
set fileformat=unix         " Set fileformat to Unix
set history=8000            " VIM history
"set joinspaces              " Insert two spaces after a period
set lazyredraw              " Do not redraw, when running macros
set matchpairs+=<:>         " Bounce between matches
set noerrorbells            " Turn off error warnings
set nostartofline           " Keep the cursor in the current column with page commands
set novisualbell
set number                  " Show line numbers
set ruler                   " Always show current position
set secure                  " Disable security risk features
set shell=zsh               " Set shell to zsh
set shortmess+=filmnrxoOtT  " abbr of messages (avoids 'hit enter'))"
set so=7                    " Set 7 lines to the curors - when moving vertically
set t_vb=                   " Disable error beeps
set viminfo=%,'20,<50,h     " Restore cursor position between sessions
set whichwrap=b,s,h,l,<,>,[,] " keys wrap to previous/next line
set wildmenu                " Enable menu at bottom of vim/gvim window
set splitbelow              " New pane put below the current one

" Section: Swap and backup {{{1
"---------------------------------------------------------------------------"

set backup
set undofile
set undolevels=1000  " maximum number of changes that can be undone
set undoreload=10000  " maximum number lines to save for undo on a buffer reload
set backupdir=~/.vim/bak//,.,/tmp//  " backup with full file path
set directory=~/.vim/tmp//,.,/tmp//  " swp files to /tmp if neccesary
set undodir=~/.vim/undo//
set viewdir=~/.vim/view//
" Create directories if they don't exist
silent execute '!mkdir -p $HOME/.vim/bak'
silent execute '!mkdir -p $HOME/.vim/spell'
silent execute '!mkdir -p $HOME/.vim/tmp'
silent execute '!mkdir -p $HOME/.vim/undo'
silent execute '!mkdir -p $HOME/.vim/view'

" Section: Search {{{1
"---------------------------------------------------------------------------"

set incsearch               " Show the `best match so far' as search strings are typed
set magic                   " Magic on
set mat=2
set nohls                   " Don't highlight search
set showmatch
set smartcase
"set wrapscan                " begin search at top when EOF reached

" Section: Syntax {{{1
"---------------------------------------------------------------------------"

syntax enable                " syntax highlighting
set synmaxcol=1024           " switch off for wide documents
set t_Co=256                 " force 256color
set modeline
set modelines=5
color acedia

filetype plugin on
filetype indent on

" Section: GUI {{{1
"---------------------------------------------------------------------------"

if has("gui_running")
  if has("gui_gtk2") " GTK/Linux font
    set guifont=Screen\ 9
    set columns=79
    set lines=55
  else
    set guifont=Monaco:h10  " Mac font
    set noantialias
    set columns=90
    set lines=55
  endif
  set guioptions-=T " Hide useless toolbar (toggle with F2)
  set guioptions-=r " Hide right scrollbar (toggle with CTRL+F2)
  set guioptions-=l " Hide left scrollbar
  set guioptions-=b " Hide bottom scrollbar
  set cursorline
  set switchbuf=usetab
  set showtabline=1
  "set guicursor=a:blinkon0
  set guicursor=n-v-c:blinkon0
  set scrolljump=5
  set scrolloff=5
  if has("mouse")
    set mouse=a               " Enable mouse at all times
    set mousehide             " Hide mouse when typing
    "set mousemodel=popup_setpos
    set mousemodel=extend
  endif

" Section: Printing {{{2

if has("gui_gtk2") " GTK/Linux font
  set printfont=Bitstream\ Vera\ Sans\ Mono\ 10
else
  set printfont=monospace:h9
endif

" }}}

" Section: Menus {{{2

" Popup mouse menu
  :amenu PopUp.Close.\ Window :confirm close<CR>
  :amenu PopUp.Close.\ Other :confirm only<CR>
"  }}}

else
  set nuw=3
endif " end gui_running

" Nice window title
if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%{v:progname} " program name
  set titlestring+=\ \|\ %f\ " file name
  set titlestring+=%h%m%r%w " flags
  "set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " cwd
endif

" Section: Formatting {{{1
"---------------------------------------------------------------------------"

set autoindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set backspace=4
set nowrap
"set formatoptions=tcrqn2
"set wrapmargin=4
"set lbr
"set smartindent
set equalprg=par\ -w78      " use par for =
"set formatprg=par\ -w78     " also use par for gq

" Section: Status-line {{{1
"---------------------------------------------------------------------------"

" Format statusline
set laststatus=2
set statusline=
set statusline+=%<[%n]\            " buffer number
set statusline+=%Y\ 
"set statusline+=[%{&encoding},     " encoding
"set statusline+=%{&fileformat}]    " file format
set statusline+=\ %F%m%r%h\        " filename and path
set statusline+=%w                 " flags
set statusline+=%{fugitive#statusline()} " git
set statusline+=%=                 " right align
set statusline+=%P\ 
set statusline+=Ln:%l/%L\ 
set statusline+=Col:%c%V\ 

" Display the current mode and partially-typed commands in the status line
set showmode
set showcmd

" Section: Command line {{{1
"---------------------------------------------------------------------------"

set cmdheight=1
set su=.h,~,.o,.info,.swp,.obj      " low priority filetypes 
set wildchar=<TAB>                  " tab for command-line expansion
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz,*.bak " ignore these
set wildmode=list:longest,list:full
set wmnu                            " show list of matches when tabbing a command

" Section: Autocompletion {{{1
"---------------------------------------------------------------------------"
" initialize omnicompletion
if has("autocmd")
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
endif

" how should we fuck off?
set complete=.,k,w,b,u,t,]
"set complete=.,k,w,b,u,t,i,]

set completeopt=longest
"set completeopt=longest,menuone

" adjust case of a keyword completion match
set infercase

" Section: Formats and filetypes {{{1
"---------------------------------------------------------------------------"
"valid when compiled with support for autocommands.
if has("autocmd")
  autocmd BufEnter * :syntax sync fromstart

" use templates
  autocmd BufNewFile * silent! 0r ~/.vim/skel/%:e.tpl

  " Dictionaries and speling
  autocmd FileType mail,human,markdown,txt,vo_base set dict+=/usr/share/dict/words
  autocmd FileType mail,human,markdown,txt,vo_base set spell spelllang=en_gb

  " Dynamically set filetype-specific dictionary
  autocmd FileType * exec('setlocal dict+=~/.vim/dict/'.expand('<amatch>').'.dict')

  augroup filetype
    autocmd BufRead,BufNewFile *.jade set filetype=jade
    autocmd BufRead,BufNewFile *.less,*.scss set filetype=css
    autocmd BufRead,BufNewFile *.markdown,*.mdown,*.mkdn,*.mkd,*.md set filetype markdown
    autocmd BufRead,BufNewFile *.webui set filetype=jsp
  augroup END

  augroup css
    autocmd FileType css let css_fold=1
    autocmd FileType css set foldenable foldmethod=indent
    autocmd FileType css set expandtab smartindent tabstop=2 shiftwidth=2
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  augroup END

  augroup mail
    autocmd FileType mail set expandtab nonu nosi 
    autocmd FileType mail set tw=78 tabstop=2 sw=2 fo+=aw2tq
  augroup END

  augroup txt
    autocmd FileType txt set expandtab nosi noai
    autocmd FileType txt set tw=78 tabstop=2 sw=2 fo+=aw2tq
  augroup END

  " Mardown syntax 
  "autocmd BufRead *.markdown set nonu ai formatoptions=tcroqn2 comments=n:>
  autocmd FileType markdown set nonu ai tw=78 fo+=aw2tq comments=n:>

  " in human-language files, automatically format everything at 78 chars:
  autocmd FileType vo_base,human set nonu fo+=aw2tq ts=4 tw=78

  " for C-like programming, have automatic indentation:
  autocmd FileType c,cpp,slang set cindent

  " for actual C (not C++) programming where comments have explicit end
  " characters, if starting a new line in the middle of a comment automatically
  " insert the comment leader characters:
  autocmd FileType c set fo+=ro

  " for Perl, PHP, Python, have things in braces indent themselves:
  autocmd FileType perl,php,python set smartindent

  " JSP and JSTL files
  autocmd FileType jsp set expandtab smartindent tabstop=2 shiftwidth=2

  " for HTML, generally format text, but if a long line has been created leave it
  " alone when editing
  autocmd FileType html,xhtml,xml,xsl set fo+=tl expandtab nofoldenable foldmethod=indent
  autocmd FileType {xml,xslt} setlocal iskeyword=@,-,\:,48-57,_,128-167,224-235
else
  set autoindent    " always set autoindenting on
endif " has("autocmd")

" Section: Keymapping {{{1
"---------------------------------------------------------------------------"
"Set leader
let mapleader = ","
let g:mapleader = ","

"-- F-keys --"

if has("gui_running")
  " F2 toggle toolbar
  map <silent><F2> :if &guioptions =~# 'T' \| set guioptions-=T \| else \| set guioptions+=T \| endif<CR>
  " CTRL+F2 to toggle the right-hand scroll bar
  nmap <silent><C-F2> :if &guioptions=~'r' \| set guioptions-=r \| else \| set guioptions+=r \| endif<CR>
endif

" F5 list buffers and enter number to switch
nnoremap <F5> :buffers<CR>:buffer<Space>

" F6 to cycle through split windows (and <Shift>+<F6> to cycle backwards)
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" F8 markdown preview
noremap <silent><F8> :w!<CR>:!MultiMarkdown.pl % \| tidy -config $HOME/.tidy.conf \| SmartyPants.pl > $HOME/Desktop/%.html && firefox $HOME/Desktop/%.html<CR><CR>

" CTRL+F8 to reformat file as XML
map <silent><C-F8> <Esc>:%!xmllint --format -<CR><CR>
vmap <silent><C-F8> <Esc>:'<, '>!xmllint --format -<CR><CR>

" F9 Toggle NERDTree
"noremap <silent><F9> :NERDTreeToggle<CR>

" Bash-like
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <C-U>

" Fast saves
nmap <silent><C-s> :update<CR>
vmap <silent><C-s> <Esc><c-s>
imap <silent><C-s> <Esc><c-s>a

" Fast find
"nmap <leader>f :e ~/buffer<CR>
nmap <leader>f :find<CR>

" Fast sourcing of current file
nmap <leader>so :source %<CR>

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Visual shifting (builtin-repeat)
" Increase indent.
vnoremap <Tab> >gv
" Decrease indent.
vnoremap <S-Tab> <gv

" Standard control-backspace deletion
imap <C-BS> <C-W>

" make CTRL+] behave like CTRL+[ while in insert mode
imap <silent><C-]> <C-[>

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
"nnoremap <C-N> :next<CR>
"nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" Reformat the current paragraph (or selected text if there is any)
nnoremap Q gqap<CR>
vnoremap Q gq<CR>

" Turn last word into a tag
"inoremap <leader>, <ESC>diwa<<ESC>pa></<ESC>pa><ESC>bba

" Wrap selection a tag - prompt for tag name
"nmap <leader>w viw<leader>w
"vnoremap <leader>w <ESC>:call TagSelection()<CR>

" Toggle wrap and display status
"nnoremap <leader>w :set wrap! \| set wrap?<CR>
"nnoremap <C-S-w> :set wrap! \| set wrap?<CR>
"inoremap <C-S-w> <C-O>:set wrap! \| set wrap?<CR>

" Lazy moving
nnoremap j gj
nnoremap k gk

" toggle search highlight, show status
nnoremap <leader>h :set nohls! \| set nohls?<CR>


" Section: Brackets and auto-pairs {{{1
"---------------------------------------------------------------------------"

let g:loaded_matchparen = 1   " Turn off bracket flashing

" Visual mode auto pairs
vnoremap ' <ESC>`>a'<ESC>`<i'<ESC>
vnoremap " <ESC>`>a"<ESC>`<i"<ESC>
vnoremap ( <ESC>`>a)<ESC>`<i(<ESC>
vnoremap < <ESC>`>a><ESC>`<i<<ESC>
vnoremap { <ESC>`>a}<ESC>`<i{<ESC>
vnoremap [ <ESC>`>a]<ESC>`<i[<ESC>
" Insert mode auto pairs
inoremap [ []<ESC>:let leavechar="]"<CR>i
inoremap " ""<ESC>:let leavechar='"'<CR>i
inoremap ( ()<ESC>:let leavechar=")"<CR>i
" complex curlies
inoremap {     {}<ESC>:let leavechar="}"<CR>i
inoremap {<CR> {<CR>}<ESC>O
inoremap {{    {
inoremap {}    {}

imap <C-j> <ESC>:exec "normal f" . leavechar<CR>a

if has("autocmd")
  " CSS
  autocmd FileType css inoremap :<space> : ;<left>
  autocmd FileType css inoremap (" ("")<ESC>:let leavechar=')'<CR>i<left>

  " Markdown
  autocmd FileType markdown vnoremap i <ESC>`>a*<ESC>`<i*<ESC>
  autocmd FileType markdown vnoremap b <ESC>`>a**<ESC>`<i**<ESC>

  " XML
  autocmd FileType html,xhtml,xml inoremap <buffer><silent> <C-S-B> <ESC>bdwi<<ESC>pa></<ESC>pa><ESC>bba
endif

" Section: Date & time {{{1
"---------------------------------------------------------------------------"

"let g:timestamp_rep = '%Y-%m-%d'  " Format date thusly: YYYY-MM-DD
let g:timestamp_rep = '%Y-%m-%d %I:%M:%S %Z'  " Format date thusly: YYYY-MM-DD h:m:s Z
let g:timestamp_regexp = '\v\C%(<Last %([cC]hanged?|[Mm]odified):\s+)@<=.*$'

"iab <silent> ddate <C-R>=strftime("%d %B %Y")<CR>
"iab <silent> ttime <C-R>=strftime("%I:%M:%S %p %Z")<CR>
"iab <silent> isoD <C-R>=strftime("%Y-%m-%d")<CR>

" Section: Transpose {{{1
"---------------------------------------------------------------------------"

"nnoremap <silent> gb xph      " Transpose current character with next
"nnoremap <silent> gc xhPl     " Transpose current character with previous
"nnoremap <silent> gy dawwPb   " Transpose current word with next
"nnoremap <silent> gl dawbPb   " Transpose current word with previous
"nnoremap <silent> g{ {dap}p{  " Transpose current paragraph with next

" Transpose lines vertically
nmap <C-Up> :<C-u>move .-2<CR>
nmap <C-Down> :<C-u>move .+1<CR>
imap <C-Up> <C-o>:<C-u>move .-2<CR>
imap <C-Down> <C-o>:<C-u>move .+1<CR>
vmap <C-Up> :move '<-2<CR>gv
vmap <C-Down> :move '>+1<CR>gv

" Section: Plugin-dependent settings {{{1
"---------------------------------------------------------------------------"

" Pathogen - make sure this comes first
execute pathogen#infect()
execute pathogen#helptags()

" BufExplorer
map <silent><leader>b :BufExplorer<CR>

" Conversion HTML (:help 2html.vim)
let g:html_use_css = 1
let g:html_use_encoding = "utf8"
let g:use_xhtml = 1

" NERD_Commenter menu
let g:NERDMenuMode = 3
"inoremap <M-/> <ESC>:call NERDComment(0, "toggle")<cr>a
"nnoremap <M-/>/ :call NERDComment(0, "toggle")<cr>
"vnoremap <M-/>/ :call NERDComment(1, "toggle")<cr>

" Disable autocomplpop plugin at startup
let g:acp_enableAtStartup = 0

" ShowMarks
let g:showmarks_enable = 0
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" EasyMotion
let g:EasyMotion_leader_key = "<leader>"

" taglist
nnoremap <leader>T :Tlist<CR>
nnoremap <leader>To :TlistOpen<CR>
nnoremap <leader>Tc :TlistClose<CR>
nnoremap <leader>Tu :TlistUpdate<CR>
nnoremap <leader>Ts :TlistSessionSave tlist<CR>
nnoremap <leader>Tl :TlistSessionLoad tlist<CR>

" ToggleWords/vars/vals
let g:toggle_words_dict = {'python': [['if', 'elif', 'else']]}

" ToggleWord
map <leader>t :ToggleWord<CR>
map <C-S-t> :ToggleWord<CR>
imap <C-S-t> <ESC>:ToggleWord<CR>a

" Yank ring
nnoremap <silent><leader>y :YRShow<CR>
let g:yankring_history_dir = "$HOME/.vim/"
let g:yankring_max_history = 200

" Section: Experimental {{{1
"---------------------------------------------------------------------------"
"set grepprg to vimgrep function
set grepprg=vimgrep

" convert vimoutliner to markdown
function! VO2MD()
  let lines = []
  let was_body = 0
  for line in getline(1,'$')
    if line =~ '^\t*[^:\t]'
      let indent_level = len(matchstr(line, '^\t*'))
      if was_body " <= remove this line to have body lines separated
        call add(lines, '')
      endif " <= remove this line to have body lines separated
      call add(lines, substitute(line, '^\(\t*\)\([^:\t].*\)', '\=repeat("#", indent_level + 1)." ".submatch(2)', ''))
      call add(lines, '')
      let was_body = 0
    else
      call add(lines, substitute(line, '^\t*: ', '', ''))
      let was_body = 1
    endif
  endfor
  silent %d _
  call setline(1, lines)
endfunction

" convert markdown to vimoutliner
function! MD2VO()
  let lines = []
  for line in getline(1,'$')
    if line =~ '^\s*$'
      continue
    endif
    if line =~ '^#\+'
      let indent_level = len(matchstr(line, '^#\+')) - 1
      call add(lines, substitute(line, '^#\(#*\) ', repeat("\<Tab>", indent_level), ''))
    else
      call add(lines, substitute(line, '^', repeat("\<Tab>", indent_level) . ': ', ''))
    endif
  endfor
  silent %d _
  call setline(1, lines)
endfunction

" Section: Unsorted {{{1
"---------------------------------------------------------------------------"

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Remove pesky DOS/Windows ^M
noremap <leader>m0 mmHmt:%s/<C-V><CR>//ge<cr>'tzt'm

"inoremap <S-Tab> <C-D> " Standard back indentation
" map Shift Insert to [set paste][paste][set nopaste]
map <S-Insert> <ESC>:set paste<CR>"*p:set nopaste<CR>a

"a new window is put below the current one
set splitbelow

"visual to brace match
noremap % v%
"map <S-Insert> <ESC>:set paste<CR>"*p:set nopaste<CR>a

" automatically leave insert mode after 'updatetime' milliseconds of inaction
"au CursorHoldI * stopinsert
"" set 'updatetime' to 5 seconds when in insert mode
"au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
"au InsertLeave * let &updatetime=updaterestore

" restore folds and views
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" Replace the current word with the last-yanked text.
"map <leader>s diw"2P

" Time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

" unindent
imap <S-Tab> <C-o><<

" }}}
" vim:ft=vim:fdm=marker:sw=2
