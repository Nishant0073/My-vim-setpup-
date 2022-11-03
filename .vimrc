set encoding=UTF-8
set autoread
au CursorHold * checktime
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" ================= looks and GUI stuff ================== "{{{

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'                           " pretty icons everywhere
Plugin 'luochen1990/rainbow'                              " rainbow parenthesis
Plugin 'hzchirs/vim-material'                             " material color themes
Plugin 'gregsexton/MatchTag'                              " highlight matching html tags
Plugin 'djoshea/vim-autoread'
"Plugin 'Jorengarenar/vim-MvVis'                           " move visual selection
" Use release branch (recommend)
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'natebosch/dartlang-snippets'
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'https://github.com/tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'othree/html5.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
Plugin 'junegunn/fzf.vim'                                 " fuzzy search integration
Plugin 'mhinz/vim-startify'                               " cool start up screen
Plugin 'tpope/vim-fugitive'                               " git support
Plugin 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plugin 'skywind3000/asyncrun.vim'
Plugin 'https://github.com/jeffkreeftmeijer/vim-numbertoggle.git'


" Dart
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'

" css
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'

" js
" Plugin 'pangloss/vim-javascript'
" Plugin 'elzr/vim-json'
" Plugin 'mxw/vim-jsx'
"Plugin 'millermedeiros/vim-gccesformatter'
" Plugin 'leafgarland/typescript-vim'
Plugin 'prettier/vim-prettier'

" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'preservim/nerdtree'
" Plugin 'bling/vim-airline'

let g:airline_theme='transparent'
" colorschemes
Plugin 'tomasr/molokai'
Plugin 'rakr/vim-one'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'yuttie/comfortable-motion.vim'


" required for vundle
call vundle#end()



syntax on
filetype plugin indent on   " enable detection, plugins and indent


"Emme" 
" let g:user_emmet_leader_key='<C-K>'
let g:user_emmet_mode='a'    "enable all function in all mode.


" Local dirs (centralize everything)
set backupdir=~/.vim/backups
set directory=~/.vim/swaps


" Change mapleader (easier to type), at the top since its used everywhere
let mapleader=","
let maplocalleader=";"

set spelllang=en_us         " spell checking
set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awsum.


" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
"   to disk, will remember history/marks.
set lazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.


" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally


" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile


" --- search / regexp ---
set gdefault                " RegExp global by default
set magic                   " Enable extended regexes.
set hlsearch                " highlight searches
set incsearch               " show the `best match so far' astyped
set ignorecase smartcase    " make searches case-insensitive, unless they
"   contain upper-case letters

" --- keys ---
set backspace=indent,eol,start  " allow backspacing over everything.
" set esckeys                     " Allow cursor keys in insert mode.
set nostartofline               " Make j/k respect the columns
set timeoutlen=500              " how long it wait for mapped commands
set ttimeoutlen=100             " faster timeout for escape key and others




" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

set t_Co=256                " 256 colors terminal

let g:molokai_original=0
colorscheme molokai
hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
hi Comment gui=italic cterm=italic                      " italic comments
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words
let g:material_terminal_italics = 1

" colors for git (especially the gutter)
hi DiffAdd  guibg=#0f111a guifg=#43a047
hi DiffChange guibg=#0f111a guifg=#fdd835
hi DiffRemoved guibg=#0f111a guifg=#e53935

" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2


" make 'var' keyword easier to spot
" defaul line number is too distractive
hi link LineNr Comment
hi link OverLength Error
hi link javascriptType Keyword


" set cursorline              " Highlight current line
set laststatus=2            " Always show status line
set number                  " Enable line numbers.
set report=0                " Show all changes.
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set splitbelow splitright   " how to split new windows.
set title                   " Show the filename in the window title bar.

set scrolloff=5             " Start scrolling n lines before horizontal
"   border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
"   horizontally.
set emoji                                               " enable emojis

" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes









" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=4               " Tab key results in # spaces
set tabstop=4                   " Tab is # spaces
set shiftwidth=4                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
"   spaces, <Bs> deletes shift width spaces.

set wrap                        " wrap lines
set textwidth=120
set formatoptions=qrn1          " automatic formating.
" set formatoptions-=o            " don't start new lines w/ comment leader on
"   pressing 'o'

"=========================General Configuration================================

packadd termdebug 
set mouse=a
set modifiable


" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

let g:snipMate = { 'snippet_version' : 1 }
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" --- NERDTree ----
let NERDTreeIgnore=['.DS_Store']
let NERDTreeShowBookmarks=0         "show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
noremap <C-n> :NERDTreeToggle<CR>






" --- snipmate ---
let g:snips_author = 'Miller Medeiros'

" --- vim-css-color ---
let g:cssColorVimDoNotMessMyUpdatetime = 1


" indentLine
let g:indentLine_char_list = ['▏', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
let g:indentLine_fileTypeExclude = ['startify']





" --- Tabular.vim ---
noremap <silent> <leader>t: :Tabularize /:<CR>
noremap <silent> <leader>t= :Tabularize /=<CR>
noremap <silent> <leader>t, :Tabularize /,<CR>
noremap <silent> <leader>t{ :Tabularize /{<CR>
noremap <silent> <leader>t" :Tabularize /"<CR>
noremap <silent> <leader>t' :Tabularize /'<CR>
noremap <silent> <leader>t[ :Tabularize /[<CR>
noremap <silent> <leader>t/ :Tabularize ///<CR>
noremap <silent> <leader>t\| :Tabularize /\|<CR>


"" coc

" Navigate snippet placeholders using tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " use <tab> for trigger completion and navigate to the next complete item
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#next(1)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
      " \ coc#pum#visible() ? coc#pum#next(1) :
      " \ CheckBackspace() ? "\<Tab>" :
      " \ coc#refresh()

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-clangd',
            \'coc-java',
            \ 'coc-snippets',
            \ 'coc-flutter',
            \]



function! KeywordsAll()
    setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc

function! KeywordsBasic()
    setl iskeyword=@,48-57,192-255
endfunc


" rainbow brackets
let g:rainbow_active = 1


"" FZF
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"



" -----------------------------------------------------------------------------
" KEY MAPPINGS
" -----------------------------------------------------------------------------

" mapleader set at the top of the file to avoid conflicts


" --- FIX/IMPROVE DEFAULT BEHAVIOR ---

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing
nnoremap S i<cr><esc><right>

" movement by screen line instead of file line (for text wrap)
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk

" next tab
nnoremap <C-Tab> :tabn<CR>

" automatic esc, really uncommon to type jj,jk
inoremap jj <ESC>
inoremap jk <Esc>

" Faster scrolling
nnoremap <C-e> 3


" Bubble single lines, similar to Eclipse (requires unimpaired.vim)
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines, similar to Eclipse (requires unimpaired.vim)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Duplicate lines, similar to Eclipse
noremap <C-S-Up> YP
noremap <C-S-Down> YP

" 'fix' search regexp to be compatible with Perl format
" nmap / /\v
" vmap / /\v

" Use the damn hjkl keys
" noremap <up> <nop>
" noremap <down> <nop>
" noremap <left> <nop>
" noremap <right> <nop>

" improve the 'search word under cursor' behavior
nnoremap * :silent call KeywordsAll()<CR> *
nnoremap # :silent call KeywordsAll()<CR> #


" --- COMMON STUFF / HELPERS ---

" Clear the search highlight
nnoremap <silent> \ :silent nohlsearch<CR>

" Open file (useful for HTML)
noremap <silent> <leader>o :!open %<CR>

" Reformat code
nnoremap <leader>rf gg=G

" I use retab too much and it's hard to type
nnoremap <leader>rt :retab!<CR>

" Pull word under cursor into LHS of a substitute (find and replace)
nnoremap <leader>rr :silent call KeywordsAll()<CR> :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Insert/append a single character
" noremap ,, i_<esc>r
" noremap ;; a_<esc>r


" Move between splits (windows)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Move windows around (only works on same row)
noremap <C-S-Right> <C-w>r
noremap <C-S-Left> <C-w>R

" Open current buffer in a new split
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

" close window
noremap <leader>q :clo<CR>

" delete buffer but keep window open (requires bufkill.vim)
map <leader>bd :BD<CR>

" smarter next/prev buffer (requires bufkill.vim)
map <leader>bn :BF<CR>
map <leader>bp :BB<CR>

" resize splits (http://vim.wikia.com/wiki/Resize_splits_more_quickly)
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" add spaces inside current parenthesis
map <leader>( vi(xi  P

"Run programs

function RunProgram()
    if &ft=='cpp'
        :!clear && g++ -g % -o output && time ./output output < input.txt  > output.txt
    elseif &ft=='c'
        :!clear && gcc -g % -o output && ./output
    elseif &ft=='html'
        :!clear &&  open %<CR>
    elseif &ft=='java'
        :!clear && javac % && java %:r
    elseif &ft=='python'
        :!clear &&  python3 %
    elseif &ft=='ruby'
        :!clear ruby %
    endif
endfunction

function RunCPP()
    let l:currentWindow=winnr()
    execute "normal! :vsplit input.txt\<cr>"
    execute ":30winc <"
    execute "normal! :split output.txt\<cr>"
    execute "normal! :wincmd p \<cr>"
endfunction


map <F2> :call RunProgram()<CR>
map <F3> :call  RunCPP()<CR>
map <F4> :set paste<CR>
map <F5> :set nopaste<CR>
map <F1> :FlutterRun <CR>

"Flutter 
noremap <leader>ff :CocList --input=flutter commands <CR>
nnoremap <leader>fd :CocList flutter.gotoSuper<CR>
noremap <leader>r :CocList flutter.dev.hotReload<CR>
noremap <leader>rn :CocList flutter.dev.hotRestart<CR>

set clipboard=unnamedplus
"transperent background
" hi Normal guibg=NONE ctermbg=NONE
hi clear LineNr
highlight clear SignColumn

"FLUTTER
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Enable Flutter menu
" call FlutterMenu()

" Some of these key choices were arbitrary;
" it's just an example.
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
let g:dart_format_on_save = 1
let g:coc_disable_startup_warning = 1
noremap <silent> <C-S-Left> :vertical resize -20<CR>
