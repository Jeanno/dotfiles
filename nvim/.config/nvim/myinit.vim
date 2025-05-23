" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=400

"" UI
" Enable syntax highlighting
syntax enable

set background=dark
set cursorline

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"" Others
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"" Files, backups and undo
" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowb
set noswapfile

"" Text, tab and indent related
set noexpandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
autocmd FileType * setlocal formatoptions-=ro

" Remember info about open buffers on close
set viminfo^=%

"" Status line
" Always show the status line
set laststatus=2

set path+=**
set number
set relativenumber
set complete-=i
set colorcolumn=80
set mouse=a

set splitbelow
set splitright

set updatetime=300
set timeoutlen=300

set belloff=

set fdm=indent
set foldlevel=1
set t_TE= t_TI=

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Sync clipboard register with unnamed register
set clipboard^=unnamed



""" Remap

nnoremap <space> <nop>
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

"" Visual mode related
" <leader>v to select last pasted lines
nnoremap <leader>v '[V']

"" Moving around, tabs, windows and buffers

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Tab and windows navigation
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <C-j> <C-W><C-W>

nnoremap <M-h> :vertical resize -3<cr>
nnoremap <M-l> :vertical resize +3<cr>
nnoremap <M-j> :resize -3<cr>
nnoremap <M-k> :resize +3<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"" Editing mappings

" Remap VIM 0 to first non-blank character
map 0 ^

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.ts :call DeleteTrailingWS()
autocmd BufWrite *.tsx :call DeleteTrailingWS()
autocmd BufWrite *.swift :call DeleteTrailingWS()

nnoremap <leader>f :Files<cr>
nnoremap <leader>g :Rg 
nnoremap <leader>G :Rg <c-r><c-w>
nnoremap <leader>t :BTags<cr>
nnoremap <leader>T :Tags <c-r><c-w>
nnoremap <leader>l :BLines<cr>

"" vimgrep searching and cope displaying
" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
" map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>


"" Spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"" Misc
" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

inoremap jk <Esc>

vnoremap > >gv
vnoremap < <gv

" file browsing
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

nnoremap <leader>el :Lexplore<cr>
nnoremap <leader>ev :Vexplore<cr>

" Auto complete by enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Run last shell command
nnoremap <leader>r :!<up><cr>

" Disable arrowkeys
" w word, b back, e end of word, ge backward
" f find, t before find
" c remove to next cursor
" x remove next char

" :range co. copy multiple lines
" Surround plugin

set termguicolors
colorscheme monokai-bold

set noshowmode

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_sign_column_always = 1

nnoremap <leader>j :Gvdiffsplit<cr>

nnoremap <leader>nj :sp ~/notes/journal.md<cr> " Notes - Journal
nnoremap <leader>nl :sp ~/notes/<cr> " Notes List
nnoremap <leader>orv :tabe ~/dotfiles/nvim/.config/nvim/init.lua<cr> " Open RC for vim
nnoremap <leader>orz :tabe ~/.zshrc<cr> " Open RC for zsh

