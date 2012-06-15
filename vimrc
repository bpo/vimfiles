" interactive line-moving
noremap <leader>- ddp
" this doesn't work on the top-line of a document yet.
noremap <leader>_ ddkP

" highlight a word
noremap <leader><space> viw

" upper-case the current word
inoremap <c-u> <esc>viwUea
nnoremap <leader>u viwU

" Typo fixes
iabbrev and and
iabbrev waht what
iabbrev tehn then

" Kickin shortcuts
iabbrev @@    bpo@somnambulance.net
iabbrev ccopy Copyright 2011 Brian P O'Rourke, all rights reserved
iabbrev ssig -- <cr>Brian P O'Rourke<cr>bpo@somnambulance.net

" Quoting things
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>

" Navigation
nnoremap H 0
nnoremap L $

inoremap jk <esc>
inoremap <esc> <nop>

nnoremap wurl :NERDTree wurl<cr>

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

let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s
let mapleader = ','
let maplocalleader = "\\"
" "}}}

" Formatting "{{{
set fo+=o                      " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment leader after an enter
"set fo+=t                      " auto-wrap text using textwidth (does not apply to comments)

set linebreak                  " Wrap lines at words by default
set textwidth=80

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
set stl+=%-14.(%l,%c%V%)\ %P  " depth through file

set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
                              " Don't autofold anything (but I can still fold manually)
set foldlevel=100

set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix

set splitbelow
set splitright

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
  endif
endif
" "}}}

" Key mappings " {{{
" Duplication
nnoremap <leader>c mz"dyy"dp`z
vnoremap <leader>c "dymz"dP`z

nnoremap <leader>rs :source ~/.vimrc<CR>
nnoremap <leader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <leader>re :vsplit ~/.vim/vimrc<CR>
nnoremap <leader>rd :vsplit ~/.vim/ <CR>

nnoremap <leader>dd :r !date "+\%+"<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gb :Gblame<CR>

" compiler error buffer for current window
nnoremap <leader>cm :silent CoffeeMake! \| cwindow 2<CR>
" live preview of compiled javascript
nnoremap <leader>cw :CoffeeCompile watch vertical<CR>

" ,l = nohighLight
:map <silent> <leader>l :noh<CR>
" ,d = use the drawer
nnoremap <silent> <leader>d :NERDTreeToggle<CR>

" Tabs
nnoremap <M-h> :tabprev<CR>
nnoremap <M-l> :tabnext<CR>

" Esc
" double-, acts as escape in insert mode
inoremap <leader>, <Esc>
inoremap ;; <Esc>

" Buffers
nnoremap <leader>- :bd<CR>
" Split line(opposite to S-J joining line)
" marked for deletion
nnoremap <C-J> gEa<CR><ESC>ew

nnoremap <leader>v :vnew<CR>
nnoremap <leader>s :snew<CR>

" copy filename 
map <silent> <leader>. :let @+=expand('%').':'.line('.')<CR>
" copy path
map <silent> <leader>< :let @+=expand('%:p:h')<CR>


map <S-CR> A<CR><ESC>

map <leader>E :Explore<CR>

" Make Control-direction switch between windows (like C-W h, etc)
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

if has('mac')
  set macmeta

  " map(range(1,9), 'exec "imap <D-".v:val."> <C-o>".v:val."gt"')
  " map(range(1,9), 'exec " map <D-".v:val."> ".v:val."gt"')

  " Copy whole line
  nnoremap <silent> <D-c> yy
endif

" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
"
" generate HTML version current buffer using current color scheme
map <leader>2h :runtime! syntax/2html.vim<CR>

ab #e # encoding: UTF-8
" " }}}

" AutoCommands " {{{
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile rebar.config                                    set ft=erlang
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit noml list| norm 1G
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()
" if (exists('&relativenumber'))
" au  WinEnter          *                                               set relativenumber
" au  WinLeave          *                                               set norelativenumber
" endif
" " }}}

" Scripts and Bundles " {{{
filetype off
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" It's better than standard netrw
Bundle 'scrooloose/nerdtree'

" Fast date manipulation
Bundle 'tpope/vim-speeddating'

" Orgmode support
Bundle 'jceb/vim-orgmode'

" Clean tag navigation
Bundle 'majutsushi/tagbar'
nmap <F2> :TagbarToggle<CR>

" Colorscheme
Bundle 'molokai'
Bundle 'git@github.com:gmarik/ingretu.git'
Bundle 'git@github.com:trapd00r/neverland-vim-theme.git'

if has("gui_running")
  colorscheme neverland2-darker
else
  " colorscheme ingretu
  colorscheme neverland2-darker
endif

" Syntax
Bundle 'fsouza/go.vim'
Bundle 'jQuery'
Bundle 'tpope/vim-rails'
Bundle 'jimenezrick/vimerl.git'

" Snippets
Bundle 'gmarik/snipmate.vim'

" Syntax highlight
Bundle 'cucumber.zip'
Bundle 'hallison/vim-markdown'
Bundle 'othree/html5-syntax.vim'

" Git integration
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" (HT|X)ml tool
Bundle 'ragtag.vim'

" Utility
Bundle 'gmarik/ide-popup.vim'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'Gundo'

Bundle 'mkitt/browser-refresh.vim'
map <silent><leader>r :RRB<CR>

Bundle 'unimpaired.vim'
" bubble current line
nmap <M-j> ]e
nmap <M-k> [e
" bubble visual selection lines
vmap <M-j> ]egv
vmap <M-k> [egv

Bundle 'repeat.vim'
Bundle 'surround.vim'

" Bundle 'SuperTab'
Bundle 'file-line'
Bundle 'Align'
Bundle 'lastpos.vim'

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key='<LocalLeader>'

Bundle 'Indent-Guides'
let g:indent_guides_guide_size = 1

Bundle 'ZoomWin'
noremap <leader>o :ZoomWin<CR>
vnoremap <leader>o <C-C>:ZoomWin<CR>
inoremap <leader>o <C-O>:ZoomWin<CR>

Bundle 'tlib'
Bundle 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Bundle 'git@github.com:gmarik/hlmatch.vim.git'
nnoremap # :<C-u>HlmCword<CR>
nnoremap <leader># :<C-u>HlmGrepCword<CR>
vnoremap # :<C-u>HlmVSel<CR>
vnoremap <leader># :<C-u>HlmGrepVSel<CR>

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'
" FuF customisations "{{{
let g:fuf_modesDisable = []
nnoremap <leader>h :FufHelp<CR>
nnoremap <leader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <leader>@  :FufFile<CR>
nnoremap <leader>3  :FufBuffer<CR>
nnoremap <leader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <leader>$  :FufDir<CR>
nnoremap <leader>5  :FufChangeList<CR>
nnoremap <leader>6  :FufMruFile<CR>
nnoremap <leader>7  :FufLine<CR>
nnoremap <leader>9  :FufTaggedFile<CR>
nnoremap <leader>t  :FufFile **/<CR>

nnoremap <leader>p :FufDir ~/src/<CR>
nnoremap <leader>fr :FufDir ~/.rvm/rubies/<CR>

" " }}}

" Command-T
" Bundle 'wincent/Command-T.git'
" let g:CommandTMatchWindowAtTop=1 " show window at top

Bundle 'SWIG-syntax'
au BufNewFile,BufRead *.i set filetype=swig 
au BufNewFile,BufRead *.swg set filetype=swig 

" trying this
Bundle 'kchmck/vim-coffee-script'

Bundle 'int3/vim-extradite'
Bundle 'thinca/vim-quickrun.git'
Bundle 'gh:thinca/vim-poslist.git'
Bundle 'github:mattn/gist-vim.git'
Bundle 'rstacruz/sparkup.git', {'rtp': 'vim/'}

filetype plugin indent on      " Automatically detect file types.
" " }}}

