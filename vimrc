set nocompatible
set ttyfast
set encoding=utf-8

" display
"

" truecolor support for iTerm2
set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set background=dark
colorscheme tender
" colorscheme smyck
" colorscheme snow
" colorscheme solarized8

set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error
set updatetime=100

" modal
"
let mapleader = ','
inoremap jk <esc>

set splitbelow
set splitright
" use <C-direction> to change windows
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Easy start/end of line
nnoremap H 0
nnoremap L $

" editing
"
set autowrite
set noautoread

set hlsearch                   " highlight search
" toggle nohighlight
:map <silent> <leader>l :noh<CR>
set ignorecase                 " ignore case by default
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

set grepprg=ag\ --vimgrep\ $*  " use ag instead of grep
set grepformat=%f:%l:%c%m

" invisible characters toggled with F12
set list
set listchars=tab:\ ·,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<CR>
set invlist

" quickfix
nnoremap <C-b> :cprevious<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <leader>a :cclose<CR>

" whitespace
"
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" hexdumps
nmap xxd :%!xxd<cr>
nmap xxr :%!xxd -r<cr>

" insert date
nmap <leader>ds :r !date "+\%+"<CR>

" ruby json parsing
nmap <leader>jt :%:!ruby -r 'json' -e 'jj JSON.parse gets'<CR>

" Marked for markdown previews
command! Marked !open -a Marked\ 2.app '%:p'

" ctrlp
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' " vc root of current file or cwd

" fugitive
"
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gs :Gstatus<CR>


" splitjoin
"
" gS - split a one-liner
" gJ - join a multi-liner


" go
"
" ctrl-] go to definition
" ctrl-t pop out of definition
" GoDefStack show definition stack
" GoDefStackClear ...
"
" GoDecls
" GoDeclsDir
"
"
" guru support:
" GoReferrers
" GoImplements
" GoWhicherrs
" GoChannelPeers
" GoCallees
" GoRename
" GoFreevars
" GoImpl
"
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>tt <Plug>(go-test-func)
autocmd FileType go nmap <leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>gd <Plug>(go-doc)

autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" run :GoBuild or :GoTestCompile based on the filename
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<cr>
autocmd BufNewFile,BufRead *.go setlocal noexpandtab
