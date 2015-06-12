" vim config file ~/.vimrc
" Fergus Bremner <fergus.bremner@gmail.com>
" Last Modified: 2015-05-22 01:26:43 CEST

" Section: Settings {{{1
"---------------------------------------------------------------------------"
set nocompatible            " Use Vim settings (must be first)

set autochdir               " Auto-change cwd to current file
set autoread                " Auto read a file when it's changed from without
set autowrite               " Auto write file when switching to another file or window
set cursorline
set enc=utf-8               " Default encoding to UTF-8
set fenc=utf-8              " ditto
set fileformat=unix         " Set fileformat to UNIX
set fileformats=unix,mac    " Fave filetypes
set history=1000            " VIM history
set lazyredraw              " Do not redraw, when running macros
set linebreak               " Don't break words on wrap
set matchpairs+=<:>         " Bounce between matches
set noerrorbells            " Turn off error warnings
set nostartofline           " Keep the cursor in the current column with page commands
set novisualbell
set number                  " Show line numbers
set printfont=monospace:h9
set ruler                   " Always show current position
set scrolljump=2
set scrolloff=3             " show lines on vertcal scroll
set secure                  " Disable security risk features
set shell=zsh               " Set shell to zsh
set shortmess+=filmnrxoOtT  " abbr of messages (avoids 'hit enter'))"
" set showbreak=↪ 
set showtabline=1
set splitbelow              " New pane put below the current one
set switchbuf=usetab
set t_vb=                   " Disable error beeps
set viminfo=%,'20,<50,h     " Restore cursor position between sessions
set viminfo+=n~/.vim/tmp/viminfo " Change location of viminfo
set whichwrap=b,s,h,l,<,>,[,] " keys wrap to previous/next line

" Section: Swap and backup {{{1
"---------------------------------------------------------------------------"

set nobackup                  " No backups
set nowritebackup             " No atomic saves
set undofile
set undolevels=100  " maximum number of changes that can be undone
set undoreload=100  " maximum number lines to save for undo on a buffer reload
set directory=$HOME/.vim/tmp//,.,/tmp//  " swp files to /tmp if neccesary
set undodir=$HOME/.vim/undo//
set viewdir=$HOME/.vim/view//

" Create directories if they don't exist
silent execute '!mkdir -p $HOME/.vim/tmp > /dev/null 2>&1'
silent execute '!mkdir -p $HOME/.vim/undo > /dev/null 2>&1'
silent execute '!mkdir -p $HOME/.vim/view > /dev/null 2>&1'

" Section: Search {{{1
"---------------------------------------------------------------------------"

set incsearch               " Show the `best match so far' as search strings are typed
set magic                   " Magic on
set mat=2
set nohls                   " Don't highlight search
set showmatch
set smartcase
" set wrapscan                " begin search at top when EOF reached

" Section: Syntax {{{1
"---------------------------------------------------------------------------"

syntax enable                " syntax highlighting
set synmaxcol=1024           " switch off for wide documents
set t_Co=256                 " force 256color
set modeline
set modelines=5
color acedia
if exists('$TMUX')
  set term=screen-256color
endif

" Section: GUI {{{1
"---------------------------------------------------------------------------"

if has("gui_running")

  if has("gui_gtk2") " GTK/Linux font
    set guifont=Screen\ 9
    set columns=90
    set lines=55
  elseif has('gui_macvim')
    set guifont=Monaco:h10  " Mac font
    set noantialias
    set columns=90
    set lines=55
    set transp=0 " transparency
    set fuopt+=maxhorz " full width full screen
  else
    set guifont=monospace:h9
    set columns=79
    set lines=55
  endif

  " set guicursor=a:blinkon0
  set guicursor=n-v-c:blinkon0

  " Hide menus and toolbar
  set guioptions-=m
  set guioptions-=T

  " Hide scrollbars
  set guioptions-=L
  set guioptions-=l
  set guioptions-=R
  set guioptions-=r
  set guioptions-=b

  set guioptions+=a " copy selection to register

  if has("mouse")
    set mousehide   " Hide mouse when typing
    " set mousemodel=extend
    set mousemodel=popup_setpos
  endif
else
  set nuw=3
  set ttimeoutlen=10
  if has("autocmd")
" escape insert mode immediately
    augroup FastEscape
      autocmd!
      autocmd InsertEnter * set timeoutlen=0
      autocmd InsertLeave * set timeoutlen=1000
    augroup END
  endif
endif

" Nice window title
if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%{v:progname} " program name
  set titlestring+=\ \|\ %f\ " file name
  set titlestring+=%h%m%r%w " flags
  " set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " cwd
endif

" Section: Status-line {{{1
"---------------------------------------------------------------------------"

" Format statusline
set laststatus=2
set statusline=
set statusline+=%<[%n]\           " buffer number
set statusline+=%Y\ 
" set statusline+=[%{&encoding},    " encoding
" set statusline+=%{&fileformat}]   " file format
set statusline+=\ %F%m%r%h\        " filename and path
set statusline+=%w                 " flags
if &ft != 'mail'
  set statusline+=%{fugitive#statusline()} " git
endif
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
set su=.h,~,.o,.info,.swp,.obj,.pyc      " low priority filetypes

" Section: Formatting {{{1
"---------------------------------------------------------------------------"

filetype plugin on
filetype indent on

" set autoindent
" set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
" set formatoptions=tcrqn2
" set wrapmargin=4
" set lbr
set equalprg=par\ -w79            " use par for =
" set formatprg=par\ -w79          " also use par for gq

" Section: Abbreviations {{{1
"---------------------------------------------------------------------------"
iabbr teh the
iabbr tehn then

" Section: Formats and filetypes {{{1
"---------------------------------------------------------------------------"
" autocommands
if has("autocmd")
  autocmd BufEnter * :syntax sync fromstart

  " use templates
  autocmd BufNewFile * silent! 0r ~/.vim/skel/%:e.tpl

  " strip trailing white space
  autocmd FileType c,cpp,css,java,php,python,html,html.django autocmd BufWritePre <buffer> :%s/\s\+$//e

  " human dicts and speling
  " autocmd FileType mail,human,mkd,txt,vo_base set dict+=/usr/share/dict/words
  autocmd FileType mail,human,mkd,txt,vo_base set spelllang=en_gb,de

  " dynamically set filetype-specific dictionary
  " autocmd FileType * exec('setlocal dict+=~/.vim/dict/'.expand('<amatch>').'.dict')

  augroup filetype
    autocmd BufRead,BufNewFile *.less set filetype=css
    autocmd BufRead,BufNewFile *.scss set filetype=scss.css
    autocmd BufRead,BufNewFile *.markdown,*.mdown,*.mkdn,*.md set filetype=mkd
  augroup END

  augroup css
    au!
    autocmd FileType css let css_fold=1
    autocmd FileType css set fen foldmethod=indent
    autocmd FileType css set ai et si ts=2 sw=2 sts=2
  augroup END

  " only show cursorline in current window
  augroup cursorline
    au!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup END

  augroup django
    au!
    autocmd FileType htmldjango inoremap {{ {{ }}<left><left><left>
    autocmd FileType htmldjango inoremap {% {% %}<left><left><left>
  augroup END

  augroup mutt
    au!
    autocmd FileType mail set nonu noai nosi
    autocmd FileType mail set tw=79 fo=wantq1 smc=0
  augroup END

  augroup text
    au!
    autocmd FileType txt set js
    autocmd FileType txt set nosi
    autocmd FileType txt set tw=79 fo+=aw2tq
  augroup END

  augroup markdown
    au!
    autocmd FileType mkd set nonu nosi nofen ts=4 sts=4 sw=4
    autocmd FileType mkd set ai tw=79 fo+=wantq1 comments=n:>
    " autocmd FileType mkd set ai tw=79 fo+=aw2tq comments=n:>
  augroup END

  " in human-language files, automatically format everything at 79 chars:
  autocmd FileType vo_base,human set nonu ts=4 sts=4 sw=4 tw=79 fo+=aw2tq

  " for C-like programming, have automatic indentation:
  autocmd FileType c,cpp,slang set cindent

  " for actual C (not C++) programming where comments have explicit end
  " characters, if starting a new line in the middle of a comment automatically
  " insert the comment leader characters:
  autocmd FileType c set fo+=ro

  augroup Python
    au!
    " Python PEP8 compliant indentation - (not needed with python-mode plugin)
    " autocmd FileType python,python.django set ai et ts=4 sts=4 sw=4
    " autocmd FileType python,python.django set ai sr et ts=8 sts=4 sw=4
    " autocmd FileType python,python.django set si cinwords=if,elif,else,for,while,try,except,finally,def,class
    " autocmd FileType python,python.django set indentkeys=!^F,o,O,<:>,0),0],0},=elif,=except
    autocmd FileType python set nowrap
    autocmd FileType python,python.django setlocal foldlevel=99
  augroup END

  augroup vim
    au!
    autocmd BufWritePost ~/.vimrc so ~/.vimrc
    autocmd BufWritePost vimrc    so ~/.vimrc
  augroup END

  augroup xml
    au!
    au syntax xml setlocal equalprg=xmlindent\ -i\ 2\ -l\ 78
  augroup END

  " Perl, PHP indentation
  autocmd FileType perl,php set ai et sr

  " JSP and JSTL indentation
  autocmd FileType jsp set ai et

  " format html but leave long lines alone
  autocmd FileType html,xhtml,xml,xsl set nofen foldmethod=indent fo+=tl
  autocmd FileType xml,xslt setlocal iskeyword=@,-,\:,48-57,_,128-167,224-235
else
  set ai ts=2 sts=2 sw=2 " defaults for everything else
endif " end has("autocmd")

" Section: Autocompletion {{{1
"---------------------------------------------------------------------------"
" initialize omnicompletion
if has("autocmd")
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
endif

" completion style
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz,*.bak,.DS_Store,*.pyc
set complete=.,k,w,b,u,t,]
" set complete=.,k,w,b,u,t,i,]
set completeopt=menu,longest,preview
set infercase

" Section: Keymapping {{{1
"---------------------------------------------------------------------------"
" set leader
let mapleader = ","
let g:mapleader = ","

" disable Ex Mode
nnoremap Q <Nop>

" new tab quick
nnoremap <leader>t :tabnew<cr>

" edit this file
nnoremap <leader>ev :tabe $HOME/.vimrc<cr>

"-- F-keys --"
" toogle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" F3 list buffers and enter number to switch
nnoremap <F3> :buffers<CR>:buffer<Space>

" CTRL+F8 to reformat file as XML
map <silent><C-F8> <Esc>:%!xmllint --format -<CR><CR>
vmap <silent><C-F8> <Esc>:'<, '>!xmllint --format -<CR><CR>

if has("gui_running")
  " F12 toggle toolbar
  map <silent><F12> :if &guioptions =~# 'T' \| set guioptions-=T \| else \| set guioptions+=T \| endif<CR>
  " CTRL+F12 to toggle the right-hand scroll bar
  nmap <silent><C-F12> :if &guioptions=~'r' \| set guioptions-=r \| else \| set guioptions+=r \| endif<CR>
endif

" Bash-like
" cnoremap <C-a> <Home>
" cnoremap <C-e> <End>
" cnoremap <C-k> <C-U>

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

" Reformat the current paragraph (or selected text if there is any)
nnoremap <leader>q gqap<CR>
vnoremap <leader>q gq<CR>

" Lazy moving
nnoremap j gj
nnoremap k gk

" remap to omnicompletion to control-space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ '\<lt>C-n>' :
            \ '\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?' .
            \ '\'\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\' :' .
            \ '\' \\<lt>bs>\\<lt>C-n>\'\<CR>'
imap <C-@> <C-Space>

" Section: Brackets and auto-pairs {{{1
"---------------------------------------------------------------------------"

let g:loaded_matchparen = 1   " Turn off bracket matching grey

" Visual mode auto pairs
vnoremap ' <ESC>`>a'<ESC>`<i'<ESC>
vnoremap " <ESC>`>a"<ESC>`<i"<ESC>
vnoremap ( <ESC>`>a)<ESC>`<i(<ESC>
vnoremap < <ESC>`>a><ESC>`<i<<ESC>
vnoremap { <ESC>`>a}<ESC>`<i{<ESC>
vnoremap [ <ESC>`>a]<ESC>`<i[<ESC>
" Insert mode auto pairs
" inoremap [ []<ESC>:let leavechar="]"<CR>i
" inoremap " ""<ESC>:let leavechar='"'<CR>i
" inoremap ( ()<ESC>:let leavechar=")"<CR>i
" complex curlies
" inoremap {     {}<ESC>:let leavechar="}"<CR>i
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {{    {
" inoremap {}    {}

" imap <C-j> <ESC>:exec "normal f" . leavechar<CR>a

if has("autocmd")
  " css
  " autocmd FileType css inoremap :<space> : ;<left>
  " autocmd FileType css inoremap (" ("")<ESC>:let leavechar=')'<CR>i<left>

  " Markdown
  " autocmd FileType mkd vnoremap i <ESC>`>a*<ESC>`<i*<ESC>
  " autocmd FileType mkd vnoremap b <ESC>`>a**<ESC>`<i**<ESC>

  " XML
  " autocmd FileType html,xhtml,xml inoremap <buffer><silent> <C-S-B> <ESC>bdwi<<ESC>pa></<ESC>pa><ESC>bba
endif

" Section: Date & time {{{1
"---------------------------------------------------------------------------"

" let g:timestamp_rep = '%Y-%m-%d'  " Format date thusly: YYYY-MM-DD
let g:timestamp_rep = '%Y-%m-%d %I:%M:%S %Z'  " Format date thusly: YYYY-MM-DD h:m:s Z
let g:timestamp_regexp = '\v\C%(<Last %([cC]hanged?|[Mm]odified):\s+)@<=.*$'

iab <silent> ddate <C-R>=strftime("%d %B %Y")<CR>
iab <silent> ttime <C-R>=strftime("%I:%M:%S %p %Z")<CR>
iab <silent> isoD <C-R>=strftime("%Y-%m-%d")<CR>

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

" ack
map <leader>aa :Ack<space>

" auto-pairs
let g:AutoPairsShortcutToggle = '<leader>pt'
let g:AutoPairsShortcutFastWrap = '<C-F>'
let g:AutoPairsShortcutJump = '<C-N>'
let g:AutoPairsShortcutBackInsert = '<C-B>'

" BufExplorer
" map <silent><leader>b :BufExplorer<CR>

" gundo
nnoremap <silent><leader>u :GundoToggle<CR>

" Disable autocomplpop plugin at startup
let g:acp_enableAtStartup = 0

" ShowMarks
let g:showmarks_enable = 0
let showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

" NERD commenter
let g:NERDSpaceDelims = 1 " Adds space after comment 

" SuperTab
" let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
" let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2
let g:SuperTabClosePreviewOnPopupClose = 1

" python mode settings
" Activate rope
" Keys:
" K             Show python docs
" <Tab>         Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" let g:pymode_breakpoint_bind = '<leader>bp'
let g:pymode_lint_ignore="E501" " ignore stuff

" tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

" ToggleWord
map <leader>tw :ToggleWord<CR>

" ToggleWords/vars/vals
let g:toggle_words_dict = {'python': [['if', 'elif', 'else']]}

" Yankring
nnoremap <silent><leader>y :YRShow<CR>
let g:yankring_history_dir = '$HOME/.vim/tmp'
let g:yankring_replace_n_pkey = '<Nop>'
let g:yankring_replace_n_nkey = '<Nop>'

" Section: Experimental {{{1
"---------------------------------------------------------------------------"
"set grepprg to vimgrep function
set grepprg=vimgrep

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

noremap % v% " visual to brace match 

:fixdel

" }}}

" vim:ft=vim:fdm=marker
