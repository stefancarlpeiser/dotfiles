scriptencoding utf-9
set encoding=utf-8

set nocompatible

" Deactivate filetype identification until after plugins have been activated
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Code completion plugin
Plugin 'valloric/YouCompleteMe'

" Better C++ syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'

" Dependency for vim-easytags
Plugin 'xolox/vim-misc'

" Tagbar: display file synopsis based on Ctags
Plugin 'majutsushi/tagbar'

" File browser
Plugin 'scrooloose/nerdtree'

" Change surrounding delimiters via cs<current-delims><desired-delims>
Plugin 'tpope/vim-surround'

" Insert brackets in pairs
Plugin 'Raimondi/delimitMate'

" Fuzzy search tool
Plugin 'ctrlpvim/ctrlp.vim'

" Snippet engine
Plugin 'SirVer/ultisnips'

" Snippets for ultisnips
Plugin 'honza/vim-snippets'

" Typescript plugin

Plugin 'Quramy/tsuquyomi'

" Colour scheme
Plugin 'morhetz/gruvbox'

" Display git diff beside line number
Plugin 'airblade/vim-gitgutter'

" Git tools
Plugin 'tpope/vim-fugitive'

" Directory-local vimrc overrides (loaded after main vimrc)
Plugin 'embear/vim-localvimrc'

Plugin 'challenger-deep-theme/vim'

Plugin 'leafgarland/typescript-vim'

Plugin 'jacoborus/tender.vim'

Plugin 'rakr/vim-two-firewatch'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Turn on filetype detection
filetype plugin indent on

" Include and use powerline
set rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Syntax highlighting
syntax on

" Colours (assumes 256-colour terminal)
"let g:gruvbox_termcolors="256"
"let g:gruvbox_contrast_dark="hard"
set t_Co=256
set background=dark
colorscheme challenger_deep

set backspace=2 " enable <BS> for everything
set completeopt-=preview " don't show preview window
set hidden " hide when switching buffers, don't unload
set laststatus=2 " always show status line
set lazyredraw " don't update the screen when executing macros
set mouse=a " enable mouse scroll
set number " show line numbers
set relativenumber " show relative line number for all lines but current
set showcmd " show command on last line of screen
set showmatch " show bracket matches
set textwidth=100
set linebreak " soft wrap lines at whitespace instead of in middle of words
set title " use file name in window title
set wildmenu " enhanched cmd line completion
set spelllang=en_GB
set clipboard=autoselect
set ttymouse=xterm2

" Display whitespace
set listchars=trail:·,precedes:«,extends:»,tab:▸\ 
set list

" Folding
set foldignore= " don't ignore anything when folding
set foldlevelstart=99 " no folds closed on open
set foldmethod=indent " collapse code using indentation

" Tabs
set autoindent " copy indent from previous line
set shiftwidth=4 " spaces for autoindenting
set smarttab " <BS> removes shiftwidth worth of spaces
set tabstop=4 " no of spaces for <Tab>
set expandtab " spaces instead of tabs

" Searches
set hlsearch " highlight search results
set incsearch " search whilst typing
set ignorecase " case insensitive searching
set smartcase " override ignorecase if upper case typed

" Mappings
let mapleader = ","

nmap <silent> <C-n> :noh<CR>

" Leave insert mode with S-space
imap <S-Space> <Esc>

" Move up & down lines visually (without breaking line counting)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Less emacsy window switching
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Allow window switching in insert mode
imap <C-h> <Esc><C-h>
imap <C-l> <Esc><C-l>

" Switch tabs with tab in normal mode
nnoremap <S-Tab> :tabn<CR>

" Bindings for YCM actions
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gtc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gtf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>ck :YcmDiags<CR>

" Remove noisy 'User defined completion' message
set shortmess+=c

" Conveniently exit vimdiff when using git difftool
if &diff
    map Q :cquit<CR>
    map <C-c> :qa!<CR>
endif


" Bindings for nerdtree actions
nnoremap <F2> :NERDTreeToggle<CR>

" Files to ignore when searching (Ctrl-P)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Triggers for ultisnips
let g:UltiSnipsExpandTrigger="<C-j>"

let delimitMate_expand_cr = 1

" Highlight cursor line
set cursorline
hi CursorLine cterm=NONE ctermbg=0

" Right margin
set colorcolumn=+1
highlight ColorColumn ctermbg=0

" Sign Column (gutter)
highlight clear SignColumn

highlight LineNr ctermfg=white
