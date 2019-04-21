" vim:ft=vim

filetype off

call plug#begin()

Plug 'valloric/YouCompleteMe'

Plug 'scrooloose/nerdtree'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'vim-syntastic/syntastic'

Plug 'tpope/vim-fugitive'

Plug 'joshdick/onedark.vim'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'sheerun/vim-polyglot'

Plug 'vim-airline/vim-airline'

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
call plug#end()            " required


filetype plugin indent on


if has('nvim') || has('termguicolors')
  set termguicolors
endif

syntax on
colorscheme challenger_deep

hi Normal guibg=NONE ctermbg=NONE


let g:airline_theme='challenger_deep'
let g:airline_powerline_fonts = 1

" Editor settings
set mouse=a
set number
set relativenumber
set showmatch
set linebreak

" Whitespace settings
set listchars=trail:·,precedes:«,extends:»,tab:▸\ 
set list


" Search settings
set hlsearch " highlight search results
set incsearch " search whilst typing
set ignorecase " case insensitive searching
set smartcase " override ignorecase if upper case typed

" Mappings

let mapleader = ","

" Less emacsy window switching
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Allow window switching in insert mode
imap <C-h> <Esc><C-h>
imap <C-l> <Esc><C-l>

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


" Triggers for ultisnips
let g:UltiSnipsExpandTrigger="<C-j>"
