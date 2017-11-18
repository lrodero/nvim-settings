call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
" Open NERDTree when vim starts up
autocmd vimenter * NERDTree
" Close NERDTree if it's the only window left open:
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <F3> :NERDTreeFind<CR>

set expandtab
set tabstop=2
set shiftwidth=2

" Moving around windows using Alt key
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" watch for file changes
set autoread

" 1000 undos
set undolevels=1000

" line numbers
set number

" highlight current line
set cursorline

" highlight searches
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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
"colorscheme jellybeans
colorscheme seoul256
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

" Prevent plugins from hiding special chars (e.g. double quotes in JSON files)
set conceallevel=0

" Setting background color for seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233
colo seoul256

" Set terminal colors
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

" hi Normal ctermbg=NONE guibg=NONE
" hi NonText ctermbg=NONE guibg=NONE

" Enable mouse pointer, e.g. for resizing of window splits
set mouse=a

" To setup ensime-vim plugin
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <localleader>t :EnTypeCheck<CR>
let ensime_server_v2=1

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_signs = 1
"let g:syntastic_error_symbol = "\u2717"
"let g:syntastic_warning_symbol = "\u26A0"

let g:syntastic_scala_checkers = ['ensime']

