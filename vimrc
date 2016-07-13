" General "{{{
set nocompatible               " be iMproved

set history=1024               " Number of things to remember in history.
set timeoutlen=250             " Time to wait after ESC.
set clipboard+=unnamed         " Yanks go on clipboard instead.
set pastetoggle=<F10>          " toggle between paste and normal: for 'safer'
                               "   pasting from keyboard
set shiftround                 " round indent to multiple of 'shiftwidth'
set tags=./tags;$HOME          " local and global tags

set modeline
set modelines=5                " lines to read for modeline instructions

set autowrite                  " Writes on make/shell commands
set noautoread                 " Do not automatically read in changes made outside of vim

set nobackup
set nowritebackup
set directory^=/tmp//           " prepend(^=) /tmp/ to default path; use full path as backup filename(//)

set hidden                     " The current buffer can be put to the background without writing to disk

set hlsearch                   " highlight search

set ignorecase                 " ignore case by default
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

set grepprg=ag\ --vimgrep\ $*  " use ag instead of grep
set grepformat=%f:%l%c%m

set foldcolumn=1               " left margin

let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s

let mapleader = ','
let maplocalleader = "\\"

if has('mac')
  " set macmeta                  " mac-style meta keys
endif

" "}}}

" Formatting "{{{
set fo+=o                      " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment leader after an enter
set fo+=t                      " auto-wrap text using textwidth (does not apply to comments)

set linebreak                  " Wrap lines at words by default
set textwidth=80
set scrolloff=10               " Minimal number of lines to keep around the cursor

set tabstop=2                  " tab size eql 2 spaces
set softtabstop=2
set shiftwidth=2               " default shift width for indents
set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab                   " Use shiftwidth to determine tab behavior at the beginning of lines

set backspace=indent,eol,start " let me backspace over everything

set autoindent                 " copy indent mode line-to-line
set cindent                    " c-style indentations
set indentkeys-=0#             " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case
" "}}}

" Visual "{{{
syntax on                      " enable syntax

set mouse=a                   "enable mouse in GUI mode
set mousehide                 " Hide mouse after chars typed

set nonumber                  " line numbers Off
set showmatch                 " Show matching brackets.
set matchtime=2               " Bracket blinking.

set wildmenu                  " Nice autocomplete browsing
set wildmode=longest:full     " Complete till longest common string, then use wildmenu

set completeopt+=preview

set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error

set laststatus=2              " always show status line.
set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline

set statusline=%<%f\          " custom statusline
set stl+=[%{&ff}]             " show fileformat
set stl+=%y%m%r               " type, mode, readonly
set stl+=%{fugitive#statusline()}%=  " gitalicious
set stl+=%-14.(%l,%c%V%)\ %P  " row, column, percent complete.

set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
                              " Don't autofold anything (but I can still fold manually)
set foldlevel=100

set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix

set splitbelow
set splitright

" invisible characters.
set list                      " display unprintable characters f12 - switches
set listchars=tab:\ ·,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<CR>
set invlist

if has('gui_running')
  set guioptions=cMg " console dialogs, do not show menu and toolbar

  " Fonts
  if has('mac')
    set guifont=Andale\ Mono:h13
  else
    set guifont=Terminus:h16
  end

  if has('mac')
    set noantialias
    " set fullscreen
    set fuoptions=maxvert,maxhorz ",background:#00AAaaaa
    let g:utl_cfg_hdl_scm_http_system = "!open '%u'"
  endif
endif
" "}}}

" Key mappings " {{{

" Aborting
inoremap jk <esc>
inoremap <esc> <nop>
" double-, acts as escape in insert mode
inoremap <leader>, <Esc>
inoremap ;; <Esc>

" Navigation
nnoremap H 0
nnoremap L $

" quickfix
noremap <leader>j :cn!<CR><CR>
noremap <leader>h :cp!<CR><CR>

" toggle windows
nmap <F2> :TagbarToggle<CR>
nmap <F4> :cl<CR>
nmap <F5> :GundoToggle<CR>

" drawer
nnoremap <silent> <leader><Tab> :NERDTreeToggle<CR>

" fullscreen
" workaround for https://code.google.com/p/macvim/issues/detail?id=512
nnoremap <silent> <leader>m :set fu<CR>:set lines=999<CR>

" tabs
nnoremap <M-h> :tabprev<CR>
nnoremap <M-l> :tabnext<CR>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Make Control-direction switch between windows (like C-W h, etc)
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" FuzzyFinder customisations "{{{
let g:fuf_modesDisable = []
nnoremap <leader>help :FufHelp<CR>
nnoremap <leader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <leader>q  :FufFile **/<CR>
nnoremap <leader>3  :FufBuffer<CR>
nnoremap <leader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <leader>$  :FufDir<CR>
nnoremap <leader>5  :FufChangeList<CR>
nnoremap <leader>6  :FufMruFile<CR>
nnoremap <leader>7  :FufLine<CR>
nnoremap <leader>9  :FufTaggedFile<CR>

nnoremap <leader>p :FufDir ~/src/<CR>
nnoremap <leader>fr :FufDir ~/.rvm/rubies/<CR>
"}}}

" Text Support

" nohighLight
:map <silent> <leader>l :noh<CR>

" shift-cr, insert nextline
map <S-CR> A<CR><ESC>

" highlight a word
noremap <leader><space> viw

" move current line
nmap <M-j> ]e
nmap <M-k> [e
" move visual selection lines
vmap <M-j> ]egv
vmap <M-k> [egv

" upper-case the current word
inoremap <c-u> <esc>viwUea
nnoremap <leader>u viwU

" typo fixes
iab waht what
iab tehn then

" quoting things
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>

" visual indentations
vmap > >gv
vmap < <gv

" cd to the current file's directory
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" copy filename 
map <silent> <leader>. :let @+=expand('%').':'.line('.')<CR>
" copy path
map <silent> <leader>< :let @+=expand('%:p:h')<CR>

" hexdumps
nmap xxd :%!xxd<cr>
nmap xxr :%!xxd -r<cr>

" generate HTML version current buffer using current color scheme
map <leader>2h :runtime! syntax/2html.vim<CR>

" insert date
nmap <leader>ds :r !date "+\%+"<CR>

" ruby json parsing
nmap <leader>jt :%:!ruby -r 'json' -e 'jj JSON.parse gets'<CR>

map <leader>e :Explore<CR>
map <leader>f :Ack 

nnoremap <leader>ev :vsplit ~/.vim/vimrc<CR>

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gb :Gblame<CR>

" compiler error buffer for current window
nnoremap <leader>cm :silent CoffeeMake! \| cwindow 2<CR>
" live preview of compiled javascript
nnoremap <leader>cw :CoffeeCompile watch vertical<CR>

" Marked for markdown previews
command! Marked silent !open -a "Marked.app" '%:p'

" Refresh the running web browser
map <silent><leader>w :RRB<CR>

" Automatic import-handling for Go
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" /Key Mappings }}}

" AutoCommands " {{{
au BufRead,BufNewFile {Gemfile,Rakefile,Guardfile,Vagrantfile,Capfile,Rules,*.rake,config.ru,*.rabl,*.prawn}     set ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile rebar.config                                    set ft=erlang
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit noml list| norm 1G
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()

" if (exists('&relativenumber'))
" au  WinEnter          *                                               set relativenumber
" au  WinLeave          *                                               set norelativenumber
" endif

" swig support
au BufNewFile,BufRead *.i set filetype=swig 
au BufNewFile,BufRead *.swg set filetype=swig 

" cfengine support
au BufRead,BufNewFile *.cf set ft=cf3

" " }}}

" Scripts and Bundles " {{{
filetype off
runtime macros/matchit.vim
call pathogen#infect()

colorscheme solarized
set background=dark

filetype plugin indent on      " Automatically detect file types.
" " }}}
