call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
" Open NERDTree when vim starts up
autocmd vimenter * NERDTree
" Close NERDTree if it's the only window left open:
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Window navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <F3> :NERDTreeFind<CR>

if has('nvim')
  tnoremap <silent> <A-Up> <C-\><C-n><C-w>k
  tnoremap <silent> <A-Down> <C-\><C-n><C-w>j
  tnoremap <silent> <A-Left> <C-\><C-n><C-w>h
  tnoremap <silent> <A-Right> <C-\><C-n><C-w>l
endif

set expandtab
set tabstop=2
set shiftwidth=2

" watch for file changes
set autoread

" 1000 undos
set undolevels=1000

" line numbers
set number

" highlight current line
set cursorline

set encoding=utf-8

" keep at least 3 lines above/below
set scrolloff=3
" keep at least 3 lines left/right
set sidescrolloff=3

" required by OceanicNext color scheme
if has('termguicolors')
  set termguicolors
endif

syntax on
colorscheme jellybeans
let airline_theme='oceanicnext'

if has('gui_running')
  set guioptions-=T " No toolbar
  set guioptions-=r " No scrollbars
  set guioptions-=R " No scrollbars
  set guioptions-=l " No scrollbars
  set guioptions-=L " No scrollbars
"  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Regular\ 9
  set guifont=Inconsolata\ 9
  colorscheme guardian
  let g:airline_theme='papercolor'
  let g:Powerline_symbols='utf-8'
endif

" indentline config
let g:indentLine_char = '┊'

let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Move visual blocks
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
