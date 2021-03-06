" lets use pathogen now
execute pathogen#infect()
filetype plugin indent on

colorscheme desert
hi QuickFixLine guibg=DarkCyan
if &t_Co > 1
   syntax enable
endif
set tabstop=2
set expandtab
set shiftwidth=2 
set ai
set colorcolumn=80
set diffopt=filler,vertical
map <F2> :NERDTreeToggle<CR>

imap    jk  <Esc>
let mapleader = " "
autocmd FileType python nnoremap <buffer> <leader>r :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType python nnoremap <buffer> <leader>e :exec '!python -m unittest discover'<cr>
autocmd FileType ruby nnoremap <buffer> <leader>r :exec '!ruby' shellescape(@%, 1)<cr>
autocmd FileType ruby nnoremap <buffer> <leader>e :exec '!rspec'<cr>
nmap <leader>p "1p
nmap <leader>o u.
nmap <leader>n @:<CR> 
nmap <leader>g :exec "grep -ir " . expand("<cword>"). " *"
nmap <leader>` :tabedit ~/.vimrc<cr>
nmap <leader>t :tabnew<cr>
nmap <leader>v "*p<cr>
nmap <leader>w :w<CR>
nmap <leader>s :tabnew<CR>:setlocal bt=nofile<CR>
nmap <leader>a "Ayy
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>
nmap <leader>c :silent !osascript ~/bin/refresh-chrome.scpt <CR>
nmap <leader>m :CtrlPMRU<CR>
nmap <leader>l :Rlog<CR>
nmap <silent> <C-J> :wincmd j<CR> 
nmap <silent> <C-K> :wincmd k<CR> 
nmap <silent> <C-H> :wincmd h<CR> 
nmap <silent> <C-L> :wincmd l<CR> 

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

"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:UltiSnipsExpandTrigger="<S-tab>"
"let g:SuperTabContextTextFileTypeExclusions = '*.csv'

" ctrl-p stuff
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" make netrw open files in a vertical split
let g:netrw_browse_split = 2

"make the command line do better tab completion
set wildmode=longest,list,full
set wildmenu

" go vim stuff
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" git grep is fast!

func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -i\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)
func GitGrepWord()
  normal! "zyiw
  call GitGrep('-w -e ', getreg('z'))
endf
nmap <leader>f :call GitGrepWord()<CR>
