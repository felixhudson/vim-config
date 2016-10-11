" lets use pathogen now
execute pathogen#infect()
filetype plugin indent on

colorscheme desert
if &t_Co > 1
   syntax enable
endif
set tabstop=2
set expandtab
set shiftwidth=2 
set ai
set colorcolumn=80
map <F2> :NERDTreeToggle<CR>

imap    jk  <Esc>
let mapleader = " "
autocmd FileType python nnoremap <buffer> <leader>r :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType python nnoremap <buffer> <leader>e :exec '!python -m unittest discover'<cr>
autocmd FileType ruby nnoremap <buffer> <leader>r :exec '!ruby' shellescape(@%, 1)<cr>
autocmd FileType ruby nnoremap <buffer> <leader>e :exec '!rspec'<cr>
nmap <leader>p "1p
nmap <leader>o u.
nmap <leader>n :cn<CR> 
nmap <leader>g :exec "grep -ir " . expand("<cword>"). " *"
nmap <leader>f :exec "grep -ir foo " 
nmap <leader>` :tabedit ~/.vimrc<cr>
nmap <leader>t :tabnew<cr>
nmap <leader>v "*p<cr>
nmap <leader>w :w<CR>

set laststatus=2
set bg=dark
set statusline=%F%m%r%h%w\ [%04l,%04v][%p%%]
"set statusline=%F%m%r%h%w\ %{&ff}\ %Y\ [ASCII=\%03.3b\ HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set incsearch
set ic
" line numbers!
set number
" allow matching of special charaters in replace
set magic
syntax on
" set autochdir
" open new buffers as tabs
":set switchbuf+=usetab,newtab
set guifont=Consolas:h16

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:UltiSnipsExpandTrigger="<S-tab>"

" ctrl-p stuff
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"make the command line do better tab completion
set wildmode=longest,list,full
set wildmenu

" go vim stuff
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
