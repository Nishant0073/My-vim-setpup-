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
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plugin 'Jorengarenar/vim-MvVis'                           " move visual selection
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
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
Plugin 'mhinz/vim-startify'                               " cool start up screen
Plugin 'tpope/vim-fugitive'                               " git support
Plugin 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plugin 'skywind3000/asyncrun.vim'
Plugin 'https://github.com/jeffkreeftmeijer/vim-numbertoggle.git'
Plugin 'https://github.com/907th/vim-auto-save.git'

" Dart
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'nvim-lua/plenary.nvim'

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

" let g:airline_theme='transparent'
" colorschemes
Plugin 'tomasr/molokai'
Plugin 'rakr/vim-one'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'yuttie/comfortable-motion.vim'

" required for vundle
call vundle#end()

syntax on
filetype plugin indent on   " enable detection, plugins, and indent

"Emme" 
" let g:user_emmet_leader_key='<C-K>'
let g:user_emmet_mode='a'    "enable all functions in all modes.

" Local dirs (centralize everything)
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" Change mapleader (easier to type), at the top since it's used everywhere
let mapleader=","
let maplocalleader=";"

set spelllang=en_us         " spell checking
set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awesome.

" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
"   to disk, will remember history/marks.
set lazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.

" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " More undo (default=100)
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
set incsearch               " show the `best match so far' as typed
set ignorecase smartcase    " make searches case-insensitive, unless they
"   contain upper-case letters

" --- keys ---
set backspace=indent,eol,start  " allow backspacing over everything.
" set esckeys                     " Allow cursor keys in insert mode.
set nostartofline               " Make j/k respect the columns
set timeoutlen=500              " how long it waits for mapped commands
set ttimeoutlen=100             " faster timeout for the escape key and others

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

set t_Co=256                " 256 colors terminal

let g:molokai_original=0
colorscheme molokai
hi Comment gui=italic cterm=italic                      " italic comments
highlight Pmenu ctermbg=gray guibg=gray
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for the relative number
hi CursorLineNr gui=bold                                " make the relative number bold
hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words
let g:material_terminal_italics = 1
"remove background
hi Normal guibg=NONE ctermbg=NONE

" colors for git (especially the gutter)
hi DiffAdd  guibg=#0f111a guifg=#43a047
hi DiffChange guibg=#0f111a guifg=#fdd835
hi DiffRemoved guibg=#0f111a guifg=#e53935

" rainbow brackets
let g:rainbow_active = 1

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

" Move windows around (only works on the same row)
noremap <C-S-Right> <C-w>r
noremap <C-S-Left> <C-w>R

" Open current buffer in a new split
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

" close window
noremap <leader>q :clo<CR>

" delete buffer but keep the window open (requires bufkill.vim)
map <leader>bd :BD<CR>

" smarter next/prev buffer (requires bufkill.vim)
map <leader>bn :BF<CR>
map <leader>bp :BB<CR>

" resize splits (http://vim.wikia.com/wiki/Resize_splits_more_quickly)
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" add spaces inside the current parenthesis
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

set clipboard=unnamedplus
"transperent background
" hi Normal guibg=NONE ctermbg=NONE
hi clear LineNr
highlight clear SignColumn
xmap <leader>a viw <Plug>(coc-codeaction-selected)
nmap <leader>a  viw <Plug>(coc-codeaction-selected)

xmap <leader>d  call CocActionAsync('showSignatureHelp') 
nmap <leader>d  call CocActionAsync('showSignatureHelp') 
noremap <silent> <C-S-Left> :vertical resize -20<CR>
let g:netrw_browsex_viewer="brave-browser"
